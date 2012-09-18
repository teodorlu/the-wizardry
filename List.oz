declare
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

fun {Droplast Xs N}
   {List.reverse
    {Drop {List.reverse Xs} N}
   }
end

%{Browse {Droplast [1 2 3 4 5 6 7] 2}}

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
   if {Member Xs Y} == true then
      case Xs of H|T then
	 if H == Y then
	    1
	 else
	    1 + {Position T Y}
	 end
      else
	 0
      end
   else
      ~1
   end
end

%{Browse {Position [1 2 3 5 2 4 5 6 7] 5}}