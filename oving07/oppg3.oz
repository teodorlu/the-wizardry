\insert npo.oz
declare

proc {ServerProc Msg}
   %{Browse servergot(Msg)}
   case Msg of  add(X1 X2 Y) then
      Y = X1 + X2
   [] sub(X1 X2 Y) then
      Y = X1 - X2
   [] mult(X1 X2 Y) then
      Y = X1 * X2
   [] divide(X1 X2 Y) then
      Y = {Int.'div' X1 X2}
   end
end

Server = {NewPortObject2 ServerProc}

proc {ClientProc Msg}
   %{Browse clientgot(Msg)}
   case Msg of work(?Y) then
      Y1 Y2 Y3 Y4 in
      {Send Server add(10 10 Y1)}
      {Wait Y1}
      {Send Server sub(10 10 Y2)}
      {Wait Y2}
      {Send Server mult(10 10 Y3)}
      {Wait Y3}
      {Send Server divide(10 10 Y4)}
      {Wait Y4}
      Y = Y1 + Y2 + Y3 + Y4
   end
end

Client = {NewPortObject2 ClientProc}

{Browse {Send Client work($)}}