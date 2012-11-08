declare

fun {NewPortObject Init Fun}
Sin Sout in
   thread {FoldL Sin Fun Init Sout} end
   {NewPort Sin}
end

fun {NewPortObject2 Proc}
Sin  in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end
