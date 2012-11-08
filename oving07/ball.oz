declare
fun {NewPortObject Proc}
Sin in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end

fun {Player Others}
   {NewPortObject
    proc {$ Msg}
       case Msg of ball then
	  {Browse got_ball}
	  Ran = {OS.rand} mod {Width Others} + 1
       in
	  {Delay 1000}
	  {Browse sending_ball}
	  {Send Others.Ran ball}
       end
    end
   }
end

fun {ManyBalls Player}
   {Delay {OS.rand} mod 5000}
   {Send Player ball}
   thread {ManyBalls Player 0} end
   thread {ManyBalls Player} end
end


P1 = {Player others(P2 P3)}
P2 = {Player others(P3 P1)}
P3 = {Player others(P1 P2)}

{ManyBalls P1 0}