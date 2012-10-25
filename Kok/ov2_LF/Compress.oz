declare

fun {Compress Ms}
   Ns = {ApplyRules Ms}
in
   if Ns==Ms then Ms else {Compress Ns} end
end

fun {ApplyRules Ms}
   case Ms of nil then nil
   [] one(N) | one(M) | Rest then
      one(N+M) | {ApplyRules Rest}
   [] two(N) | two(M) | Rest then
      two(N+M) | {ApplyRules Rest}
   [] one(0) | Rest then
      {ApplyRules Rest}
   [] two(0) | Rest then
      {ApplyRules Rest}
   [] H | Rest then
      H | {ApplyRules Rest}
   end
end
