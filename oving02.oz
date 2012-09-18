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
			    {Drop S.trackA {Length S.trackA} +N}
			    main}
	       S1.trackB = S.trackB
	       S1.trackA = {Droplast S.trackA ~N}
	    end

	    
	    
end

% {Visualize [state(main:[a b] trackA:nil trackB:nil) 	    state(main:[a] trackA:[b] trackB:nil) 	    state(main:nil trackA:[b] trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a x]) 	   ]}