\insert List.oz

declare

%Tweak this to get a better output list (copy of Find as of now)
fun {FewFind Xs Ys}
   case Ys of nil then
      nil
   [] Y|Yr then
      Hs Ts in
      Hs#Ts = {SplitTrain Xs Y}
      trackA({Length Ts} + 1) | trackB({Length Hs}) |
      trackA(~({Length Ts} + 1)) | trackB(~{Length Hs}) |
      %Leaving the correctly placed carts out of the equation
      {Find {Append Hs Ts} Yr}
   end
end