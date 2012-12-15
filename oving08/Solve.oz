declare

% From V&H p. 773

fun {Solve Script}
   {SolveStep {Space.new Script} nil}
end

fun {SolveStep S SolTail}
   case {Space.ask S} of failed then
      SolTail
   [] succeeded then
      {Space.merge S}|SolTail
   [] alternatives(N) then
      {SolveLoop S 1 N SolTail}
   end
end

fun lazy {SolveLoop S I N SolTail}
   if I>N then
      SolTail
   elseif I==N then
      {Space.commit S I}
      {SolveStep S SolTail}
   else
      C={Space.clone S}
      NewTail={SolveLoop S I+1 N SolTail}
   in
      {Space.commit C I}
      {SolveStep C NewTail}
   end
end

% From V&H p. 626

fun {SolveOne F}
   L={Solve F}
in
   if L==nil then nil else [L.1] end
end

fun {SolveAll F}
   L={Solve F}
   proc {TouchAll L}
      if L==nil then skip else {TouchAll L.2} end
   end
in
   {TouchAll L}
   L
end
