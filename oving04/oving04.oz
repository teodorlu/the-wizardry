declare

fun lazy {StreamMap S F}
   case S of H|T then
      {F H}|{StreamMap T F}
   else
      nil
   end
end

fun {StreamZip S1 S2 F}
   skip
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
