{Show 'Hello World!'}

declare
X Y Z

Y = 42
Z = 23
X = Y + Z

{Browse X}

declare
X Y
X = 'dette er magisk'
{Browse Y}
Y = X

declare
fun {Min X Y}
   if X < Y then
      X
   else
      Y
   end
end

{Browse {Min 1 2}}

declare
fun {IsBigger Number Threshold}
   if Number > Threshold then
      true
   else
      false
   end
end

{Browse {IsBigger 3 4}}
{Browse {IsBigger 3 1}}

proc {Circle R}
   A D O in
   A = 3.14 * R * R
   D = 2.0 * R
   O = 3.14 * D
   {Browse [A D O]}
end

{Circle 1.0}


fun {SumTo FirstInteger LastInteger}
   if FirstInteger > LastInteger then
      {SumTo LastInteger FirstInteger}
   elseif FirstInteger == LastInteger then
      FirstInteger
   else
      FirstInteger + {SumTo (FirstInteger + 1) LastInteger}
   end
end

{Browse {SumTo 10 0}}