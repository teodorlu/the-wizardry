\insert Find.oz
\insert Visualizer.oz
\insert Compress.oz
\insert oving02.oz

declare

fun {FewerFind Ms As Bs Ys}
   %Ms- vognene på main, Os-vognene på trackA, Ts-vognene på trackB, Ys- ønsket tog på main
   case Ys of nil then nil
   [] Y|Yr then
      if {Member Ms Y} then
	 Hs Ts in
	 Hs#Ts = {SplitTrain Ms Y}
	 trackA({Length Ts} + 1) | trackB({Length Hs}) | trackA(~1) | {FewerFind nil {Append Ts As} {Append Hs Bs} Yr}
      elseif {Member As Y} then
	 Hs Ts in
	 Hs#Ts = {SplitTrain As Y}
	 trackA(~{Length Hs}) | trackB({Length Hs}) | trackA(~1) | {FewerFind nil Ts {Append Hs Bs} Yr}
      elseif {Member Bs Y} then
	 Hs Ts in
	 Hs#Ts = {SplitTrain Bs Y}
	 trackB(~{Length Hs}) | trackA({Length Hs}) | trackB(~1) | {FewerFind nil {Append Hs As} Ts Yr}
      else
	 raise something_is_wrong end
      end
   end
end

{Visualize {ApplyMoves state(main:[a b] trackA:nil trackB:nil) {Compress {FewerFind [a b] nil nil [b a]}}}}