\insert List.oz

declare

%Tweak for better output
fun {FewFind Xs Ys}
   case Ys of nil then
      nil
   [] Y|Yr then
      Hs Ts in
      Hs#Ts = {SplitTrain Xs Y}
      trackA({Length Ts} + 1) | trackB({Length Hs}) |
      trackA(~({Length Ts} + 1)) | trackB(~{Length Hs}) |
      %Leaving the correctly placed carts out of the equation
      {FewFind {Append Hs Ts} Yr}
   end
end