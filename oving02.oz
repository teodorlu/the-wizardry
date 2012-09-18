\insert List.oz

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
	       S1.main = {
	    
end