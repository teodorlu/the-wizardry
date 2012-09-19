\insert List.oz

declare

fun {SplitTrain Xs Y}
   Pos = {Position Xs Y}
   Hs = {Take Xs Pos-1}
   Ts = {Drop Xs Pos}
in Hs#Ts
end

{Browse {SplitTrain [a b c] a}}