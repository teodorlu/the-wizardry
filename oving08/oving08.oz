\insert 'Solve.oz'
declare

fun {Consecutive Ls X Y Suffix}
   fun {ConsecutiveRel Ls X Y Suffix}
      H
   in
      choice
	 Ls = H|X|Y|Suffix
	 ok
      []
	 Ls = X|Y|Suffix
	 ok
      end
   end
in
   nil \= {SolveAll fun {$} {ConsecutiveRel Ls X Y Suffix} end}
end
%{Browse {Consecutive [1 2 3 4 5] 1 2 [3 4 5]}}
%{Browse {Consecutive [1 2 3 4 5] 1 2 [3 4 5]}}
%{Browse {Consecutive [1 2 3 4 5] 2 3 [3 4]}}
%{Browse {Consecutive [1 2 3 4 5] 2 3 [4 5]}}

fun {SumList Numbers Sum}
   fun {SumListRel Numbers Sum}
      X Y
   in
      X = {From Numbers}
      Y = {From Numbers}
      X + Y = Sum
      X#Y
   end
in
   {SolveAll fun {$} {SumListRel Numbers Sum} end }
end

%{Browse {SumList [1 2 3 4 5] 5}}
		  
fun {From Ls}
   case Ls of H|T then
      choice H [] {From T} end
   else
      fail
   end
end

fun {SumFrom List Sum}
   fun {SumFromRel List Sum}
      X Y
   in
      X = {From List}
      Y = {From List}
      X + Y = Sum
      X#Y
   end
in
   {SolveAll fun {$} {SumFromRel List Sum} end }
end

{Browse {SumList [1 2 3 4 5] 5}}