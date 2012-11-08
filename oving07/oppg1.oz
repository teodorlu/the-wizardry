declare

fun {MathAgent}
   % code
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