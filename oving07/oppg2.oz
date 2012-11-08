declare

% Messages sent to the Dating Service
%   seeking(MySex MeDescription OtherSex OtherDescription ResponsePort)
% Messages sent by the Dating service on ResponsePort
%   list(CompatiblePeople)
%   match(CompatiblePerson)

% The port object factory
fun {NewDatingService}
   % datingservice functionality
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