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

%{Browse {SumList [1 2 3 4 5] 5}}

fun {SumListProper List Sum}
   fun {SR List Sum}
      X Y Rest
   in
      X = {Pick2 List Rest}
      Y = {Pick2 Rest _}
      X + Y = Sum
      X#Y
   end
in
   {SolveAll fun {$} {SR List Sum} end}
end

{Browse {SumListProper [1 2 3 4 5] 5}}
{Browse {SumListProper [1 2 3 4 5] 6}}
{Browse {SumListProper [1 2 3 4 5] 7}}

fun {Pick List Rest}
   case List of H|T then
      choice
	 Rest = T
	 H
      []
	 RestTail Value
      in
	 Value = {Pick T RestTail}
	 Rest = H|RestTail
	 Value
      end
   else
      fail
   end
end

fun {Pick2 List Rest}
   case List of [H] then
      Rest = nil
      H
   [] H|T then
      choice
	 Rest = T H
      []
	 Rest1
      in
	 Rest = H|Rest1
	 {Pick2 T Rest1}
      end
   end
end