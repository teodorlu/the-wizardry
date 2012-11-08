declare

proc {ServerProc Msg}
   {Browse servergot(Msg)}
   % fill in server functionality
end

Server = {NewPortObject2 ServerProc}

proc {ClientProc Msg}
   {Browse clientgot(Msg)}
   case Msg of work(?Y) then
      Y1 Y2 Y3 Y4 in
      {Send Server add(10 10 Y1)} % prints servergot(add(10 10 20))
      {Wait Y1}
      {Send Server sub(10 10 Y2)} % prints servergot(sub(10 10 0))
      {Wait Y2}
      {Send Server mult(10 10 Y3)} % prints servergot(mult(10 10 100))
      {Wait Y3}
      {Send Server divide(10 10 Y4)} % prints servergot(divide(10 10 1))
      {Wait Y4}
      Y = Y1 + Y2 + Y3 + Y4
   end
end

Client = {NewPortObject2 ClientProc}

{Browse {Send Client work($)}} % prints 121