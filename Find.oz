\insert 'List.oz'

declare
fun {SplitTrain Xs Y}
   pos = {Position Xs Y}
   Hs = {Take Xs (pos-1)}
   Ts = {Drop Xs pos}
in
   Hs#Ts
end

{SplitTrain 1|2|nil 2}