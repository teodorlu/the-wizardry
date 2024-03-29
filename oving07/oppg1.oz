\insert npo.oz

declare

fun {MathAgent}
   {NewPortObject 0
    fun {$ OldValue Reckord}
       case Reckord of add(Number) then
	  OldValue + Number
       [] sub(Number) then
	  OldValue - Number
       [] mult(Number) then
	  OldValue * Number
       [] divide(Number) then
	  OldValue / Number
       [] get(Number) then
	  Number = OldValue
       end
    end}
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