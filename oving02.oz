\insert List.oz
\insert Visualizer.oz

declare
fun {ApplyMoves S Ms}
   local S1 in      
      case Ms of nil then
	 [S]
      [] M|Mr then
	 case M of trackA(N) then
	    if N > 0 then
	       S1.trackA = {Append
			    {Drop S.main {Length S.main} -N}
			    trackA}
	       S1.trackB = S.trackB
	       S1.main = {Droplast S.main N}
	    elseif N = 0 then
	       skip
	    else
	       S1.main = {Append
			  main
			  {Droplast S.trackA {Length S.trackA} +N}
			 }
	       S1.trackB = S.trackB
	       S1.trackA = {Drop S.trackA ~N}
	    end

	 [] of trackB(N) then
	    if N > 0 then
	       S1.trackB = {Append
			    {Drop S.main {Length S.main} -N}
			    trackB}
	       S1.trackA = S.trackA
	       S1.main = {Droplast S.main N}
	    elseif N = 0 then
	       skip
	    else
	       S1.main = {Append
			  main
			  {Droplast S.trackB {Length S.trackB} +N}
			 }
	       S1.trackA = S.trackA
	       S1.trackB = {Drop S.trackB ~N}
	    end

	 else
	    skip
	 end   
end

% {Visualize [state(main:[a b] trackA:nil trackB:nil) 	    state(main:[a] trackA:[b] trackB:nil) 	    state(main:nil trackA:[b] trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a x]) 	   ]}