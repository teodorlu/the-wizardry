declare

fun {Compress Ms}
   Ns = {ApplyRules Ms}
in
   if Ns == Ms then Ms else {Compress Ns} end
end