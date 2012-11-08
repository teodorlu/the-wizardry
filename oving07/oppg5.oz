declare
fun {IntLister Start End}
   if Start == End then
      nil
   else
      {Delay 1000}
      Start|{IntLister Start+1 End}
   end
end

local X in
   thread X = {IntLister 0 10} end
   {Browse X}
end

fun {Sum S Stream}
   case Stream of H|T then
      S|{Sum S+H T}
   else
      S
   end
end

local X Y in
   thread X = {IntLister 0 10} end
   thread Y = {Sum 0 X} end
   {Browse Y}
end
