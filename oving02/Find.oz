\insert List.oz

declare

fun {SplitTrain Xs Y}
   Pos = {Position Xs Y}
   Hs = {Take Xs Pos-1}
   Ts = {Drop Xs Pos} in
   Hs#Ts
end

fun {Find Xs Ys}
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

{Browse {Find [a b] [b a]}}