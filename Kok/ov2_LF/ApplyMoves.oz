\insert 'List.oz'
\insert Visualizer.oz

declare
fun {ApplyMoves S Ms}
   case Ms of nil then [S]
   [] M|Mr then
      S1 = case M of trackA(N) then
	      if N>0 then
		 NewO = {Append
			 {Drop S.main {Length S.main}-N}
			 S.trackA}
		 NewM = {Droplast S.main N} in
		 state(main:NewM trackA:NewO trackB:S.trackB)
	      elseif N==0 then
		 S
	      else
		 NewM = {Append
			 S.main
			 {Droplast S.trackA ({Length S.trackA} + N)}}
			% {Take S.trackA ~N}}
		 NewO = {Drop S.trackA ~N} in
		 state(main:NewM trackA:NewO trackB:S.trackB)
	      end
	   [] trackB(N) then
	      if N>0 then
		 NewT = {Append
			 {Drop S.main {Length S.main}-N}
			 S.trackB}
	%	 NewM = {Take S.main {Length S.main}-N} in
		 NewM = {Droplast S.main N} in
		 state(main:NewM trackA:S.trackA trackB:NewT )
	      elseif N==0 then
		 S
	      else
		 NewM = {Append
			 S.main
			 {Droplast S.trackB ({Length S.trackB} + N)}}
		 NewT = {Drop S.trackB ~N} in
		 state(main:NewM trackA:S.trackA trackB:NewT)
	      
	      end
	   end
   in
      S | {ApplyMoves S1 Mr}
   end
end

fun {Droplast Xs N}
   {List.reverse
    {Drop {List.reverse Xs} N}
   }
end

{Visualize {ApplyMoves state(main:[a b c] trackA:nil trackB:nil) [trackA(1) trackB(1)]}}
