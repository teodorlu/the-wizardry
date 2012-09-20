declare

fun {Compress Ms}
   Ns = {ApplyRules Ms}
in
   if Ns == Ms then Ms else {Compress Ns} end
end

fun {ApplyRules Ms}
   case Ms of nil then nil
   [] trackA(M) | trackA(N) | Rest  then
      trackA(M+N)| {ApplyRules Rest}

   [] trackB(M) | trackB(N) | Rest then
      trackB(M+N) | {ApplyRules Rest}

   [] trackA(0) | Rest then
      {ApplyRules Rest}

   [] trackB(0) | Rest then
      {ApplyRules Rest}

   [] H | T then
      H | { ApplyRules T}

   else
      nil
   end
   
end

      

%fun {ApplyRules Ms}
 %  case Ms of M|Mr then
  %    case M of trackA(N) then
%	 {ApplyRules Mr}
 %     [] trackB(0) then
%	 {ApplyRules Mr}
 %     else
%	 M|{ApplyRules Ms}
 %     end
  % else
   %   nil
  % end
%end

{Browse {Compress [trackB(~1) trackA(1) trackA(~1) trackB(1)]}}