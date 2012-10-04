\insert List.oz
\insert Find.oz

declare

%Working
fun {FewFind Xs Ys}
   case Ys of nil then
      nil
   [] Y|Yr then
      if Y == Xs.1 then
	 {FewFind Xs.2 Yr}
      else
	 Hs Ts in
	 Hs#Ts = {SplitTrain Xs Y}
	 trackA({Length Ts} + 1) | trackB({Length Hs}) |
	 trackA(~({Length Ts} + 1)) | trackB(~{Length Hs}) |
	 %Leaving the correctly placed carts out of the equation
	 {FewFind {Append Hs Ts} Yr}
      end
   end
end

{Browse {FewFind [c a b] [c b a]}}