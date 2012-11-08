\insert npo.oz


% Messages sent to the Dating Service
%   seeking(MySex MyDescription OtherSex OtherDescription ResponsePort)
% Messages sent by the Dating service on ResponsePort
%   list(CompatiblePeople)
%   match(CompatiblePerson)

% The port object factory
declare
fun {NewDatingService}
   {NewPortObject
    state(women:nil men:nil)
    fun {$ OldState Person}
       NewState in
       case Person of seeking(Sex Description OtherSex OtherDescription ResponsePort) then
	  case Sex of male then
	     NewState.men = Person|OldState.men
	     NewState.women = OldState.women
	  [] female then
	     NewState = state(women:Person|OldState.women  men:OldState.men)
	     {Browse NewState}
	  end
       end
       {CheckForMatches OldState Person}
       NewState
    end
    }
end

proc {CheckForMatches State Person}
   {Send Person.5
    {List.append
     {Match State.men Person}
     {Match State.women Person}
    }
   }
end

% Returns list of people matching Person
fun {Match People Person}
   case People of H|Rest then
      if ({ApprovesOf H Person} andthen {ApprovesOf Person H}) then
	 % Response to H
	 {Send H.5 match(Person.1 Person.2 Person.3 Person.4 Person.5)}

	 % Match rest
	 H | {Match Rest Person}
      else
	 {Match Rest Person}
      end
   else
      nil
   end   
end

fun {ApprovesOf A B}
   ((A.3 == B.1) andthen (A.4 == B.2))
end

DatingService = {NewDatingService}

fun {NewClient Name MySex MyDesc OtherSex OtherDesc}
   RP = {NewPortObject2
	 proc {$ Msg}
	    {Browse Name#' got '#Msg}
	 end}
in
   {Send DatingService seeking(MySex MyDesc OtherSex OtherDesc RP)}
   RP
end



Alice = {NewClient 'Alice' female blond male dark}
Bob = {NewClient 'Bob' male dark female blond}
Candice = {NewClient 'Candice' female blond male dark}
Dale = {NewClient 'Dale' male dark female blond}
Elise = {NewClient 'Elise' female brunette male blond}
Fred = {NewClient 'Fred' male blond female brunette}
{Browse done}