declare

fun {Compress Ms}
   Ns = {ApplyRules Ms}
in
   if Ns == Ms then Ms else {Compress Ns} end
end


fun {ApplyRules Ms}
   case Ms of M|Mr then
      case M of trackA(N) then
	 {ApplyRules Mr}
      [] trackB(0) then
	 {ApplyRules Mr}
      else
	 M|{ApplyRules Ms}
      end
   else
      nil
   end
end

{Browse {}}