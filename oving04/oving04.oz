declare

fun lazy {StreamMap S F}
   case S of H|T then
      {F H}|{StreamMap T F}
   else
      nil
   end
end

fun lazy {StreamZip S1 S2 F}
   case S1#S2 of H1|T1#H2|T2 then
      {F H1 H2}|{StreamZip T1 T2}
   else
      nil
   end
end

fun {StreamScale SF Factor}
   skip
end

fun {StreamAdd SF1 SF2}
   skip
end

fun {StreamIntegrate SF InitValue Dt}
   skip
end

fun {MakeRC R C Dt}
   skip
end
