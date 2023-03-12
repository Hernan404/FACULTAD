program EJ6P2P1;

var
	mayor:integer;

procedure uno;
var
	num:integer;

begin
	
	
	repeat 
		readln(num);
			if (num mod 2) then
			mayor:= num+mayor;
		
	until num = -1;
	
	
end;

begin
	mayor:= -1;
	uno;
	writeln('el numero par mas alto es ', mayor);

end.
