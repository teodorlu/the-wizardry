declare

declare

fun {MathAgent}
       
   {NewPortObject 0
    fun {$ X Y}
       
       case Y of add(Number) then
	  X + Number
       [] sub(Number) then
	  X-Number
       [] mult(Number) then
	  X * Number
       [] divide(Number) then
	  X / Number
       [] get(Number) then
	  Number=X
       end
    end
   }
end


MathPObj = {MathAgent}
{Send MathPObj add(3)}
{Send MathPObj sub(7)}
{Browse {Send MathPObj get($)}} % ~4

{Send MathPObj add(27)}
{Browse {Send MathPObj get($)}} % 23

MathPObj2 = {MathAgent}
{Send MathPObj2 mult(27)}
{Browse {Send MathPObj2 get($)}} % 0