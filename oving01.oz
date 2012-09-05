%{Show 'Hello World!'}

declare
X Y Z

Y = 42
Z = 23
X = Y + Z

%{Browse X}

declare
X Y
X = 'dette er magisk'
%{Browse Y}
Y = X

declare
fun {Min X Y}
   if X < Y then
      X
   else
      Y
   end
end

%{Browse {Min 1 2}}

declare
fun {IsBigger Number Threshold}
   if Number > Threshold then
      true
   else
      false
   end
end

%{Browse {IsBigger 3 4}}
%{Browse {IsBigger 3 1}}

proc {Circle R}
   A D O in
   A = 3.14 * R * R
   D = 2.0 * R
   O = 3.14 * D
   {Browse [A D O]}
end

%{Circle 1.0}


fun {SumTo FirstInteger LastInteger}
   if FirstInteger > LastInteger then
      {SumTo LastInteger FirstInteger}
   elseif FirstInteger == LastInteger then
      FirstInteger
   else
      FirstInteger + {SumTo (FirstInteger + 1) LastInteger}
   end
end

%{Browse {SumTo 10 0}}

fun {Max First Last}
   if First == 0 then
      Last
   elseif Last == 0 then
      First
   else
      1 + {Max (First-1) (Last-1)}
   end
end

%{Browse {Max 12 15}}

fun {Length X}
   case X of H|T then
      1 + {Length T}
   else
      0
   end
end

%{Browse {Length [1 nil 1]}}

fun {Take Xs N}
   H T in
      if {Length Xs} < N+1 then
	 Xs
      elseif N == 0 then
	 nil
      else
	 case Xs of H|T then
	    H|{Take T (N-1) }
	 else
	    nil
	 end
      end
end

%{Browse {Take [3 2 1 2 3 4 5] 5}}

fun {Drop Xs N}
   if N == 0 then
      Xs
   else
      case Xs of H|T then
	 {Drop T (N-1)}
      else
	 nil
      end
   end
end

%{Browse {Drop [1 2 3 4 5 6 7] 2}}

fun {Appendcrap Xs Ys}
   case Ys of H|T then
      {Appendcrap H|Xs T}
   else
      Xs
   end
end

fun {Append Xs Ys}
   if Xs == nil then
      Ys
   else
      Xs.1| {Append Xs.2 Ys}
   end
end

% {Browse {Append [1 2 3] [4 5 6 74363]}}

fun {Member Xs Y}
   if Xs == nil then
      false
   elseif Xs.1 == Y then
      true
   elseif {Member Xs.2 Y} then
      true
   else
      false
   end
end

% {Browse {Member [1 2 3 4 5 6] ~9832}}

fun {Position Xs Y}
   if Xs.1 == Y then
      0
   else
      1 + {Position Xs.2 Y}
   end
end

%{Position [3 4 5 6 7] 5}

fun {Position2 Xs Y}
   case Xs of H|T then
      if H == Y then
	 1
      else
	 1 + {Position T Y}
      end
   end
end

{Position2 1|2|3|nil 3}