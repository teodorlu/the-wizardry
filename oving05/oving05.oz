declare
fun {Evaluate Exp}
   case Exp of int(A) then
      A
   [] plus(A B) then
      {Evaluate A} + {Evaluate B}
   [] minus(A B) then
      {Evaluate A} - {Evaluate B}
   [] times(A B) then
      {Evaluate A} * {Evaluate B}
   [] divide(A B) then
      if B == 0 then
	 raise divby(0) end
      end
      {Int.'div' {Evaluate A} {Evaluate B}}
   else
      raise error end
   end
end

fun {DivByZeroCheck Exp}
   try
      {Evaluate Exp}
      false
   catch divby(0) then
      true
   end
end


Exp = plus(minus(int(1) int(2)) times(int(3) divide(int(4) int(5))))
{Browse {Evaluate Exp}}
%{Browse {Int.'div' 4 0}}