\insert List.oz
\insert Visualizer.oz

declare
fun {ApplyMoves S Ms}
      case Ms of nil then
	 [S]
      [] M|Mr then
	 S1 = case M of trackA(N) then
	    if N > 0 then
	       newA = {Append
			    {Drop S.main {Length S.main} -N}
			    S.trackA}
	       newMain = {Droplast S.main N}
	       state(main:newMain trackA:newA trackB:S.trackB)
	    elseif N == 0 then
	       S
	    else
	       newMain = {Append
			  S.main
			  {Droplast S.trackA {Length S.trackA} +N}
			 }
	       newA = {Drop S.trackA ~N} in
	       state(main:newMain trackA:newA trackB:S.trackB)
	    end

	 [] trackB(N) then
	    if N > 0 then
	       newB = {Append
			    {Drop S.main {Length S.main} -N}
			    S.trackB}
	       newMain = {Droplast S.main N} in
	       state(main:newMain trackA:S.trackA trackB:newB)
	    elseif N == 0 then
	       S
	    else
	       newMain = {Append
			  S.main
			  {Droplast S.trackB {Length S.trackB} +N}
			 }
	       newB = {Drop S.trackB ~N} in
	       state(main:newMain trackA:S.trackA trackB:newB)
	    end

	      end
      in
	 S1|{ApplyMoves S1 Mr}
      end
end

% {Visualize [state(main:[a b] trackA:nil trackB:nil) 	    state(main:[a] trackA:[b] trackB:nil) 	    state(main:nil trackA:[b] trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a]) 	    state(main:[b] trackA:nil trackB:[a x]) 	   ]}

{Visualize {ApplyMoves state(main:[a b] trackA:nil trackB:nil) [trackA(1) trackB(1)]}}