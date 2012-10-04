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

fun lazy {StreamScale SF Factor}
   case SF of H|T then
      (H * Factor) | {StreamScale T Factor}
   else
      nil
   end

   %alternativt (?)
   %case SF of H|T then
   %   {StreamMap H {$ H Factor} H * Factor end} | {StreamScale T Factor}
   %else
   %   nil
   %end
end

fun {Add F1 F2}
   F1+F2
end

fun lazy{StreamAdd SF1 SF2}
   {StreamZip SF1 SF2 Add}
end

fun {StreamIntegrate SF InitValue Dt}
   skip
end

fun {MakeRC R C Dt}
   skip
end
