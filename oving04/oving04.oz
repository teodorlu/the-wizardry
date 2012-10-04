declare
fun lazy {RepeatInf F}
   F|{RepeatInf F}
end

fun lazy {IncreasingSeq F}
   F|{IncreasingSeq F+1.0}
end

fun {Nth S N}
   if N == 0 then
      nil
   else
      case S of H|T then
	 H|{Nth T N-1}
      else
	 nil
      end
   end
end

fun lazy {StreamMap S F}
   case S of H|T then
      {F H}|{StreamMap T F}
   else
      nil
   end
end

fun lazy {StreamZip S1 S2 F}
   case S1 of H1|T1 then
      case S2 of H2|T2 then
	 {F H1 H2}|{StreamZip T1 T2 F}
      else
	 nil
      end
   else
      nil
   end
end

fun lazy {BrokenStreamZip S1 S2 F}
   case S1#S2 of H1|T1#H2|T2 then
      {F H1 H2}|{BrokenStreamZip T1 T2 F}
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
end

fun {Add F1 F2}
   F1+F2
end

fun lazy{StreamAdd SF1 SF2}
   {StreamZip SF1 SF2 Add}
end

fun lazy {StreamIntegrate SF InitValue Dt}
   case SF of H|T then
      InitValue | {StreamIntegrate T (InitValue + H * Dt) Dt}
   else
      nil
   end
end

fun {MakeRC R C Dt}
   nil
end

local S1 S2 Res in
   S1 = {RepeatInf 9.0}
   S2 = {IncreasingSeq 5.0}
   Res = {StreamAdd S1 S2}
   {Browse {Nth Res 4}}
end
