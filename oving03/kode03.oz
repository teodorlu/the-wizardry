declare
local Append in
   Append = proc {$ Xs Ys ?R}
	       case Xs of nil then R = Ys
	       else
		  case Xs of '|'(X Xr) then
		     local Rr in R = '|'(X Rr) {Append Xr Ys Rr} end
		  end
	       end
	    end
end


{Browse {Append [1 2] [3 4]}}