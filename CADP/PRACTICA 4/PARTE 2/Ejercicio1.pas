program EJ1P4P2;
const 
    dimf = 500;

type
    vector = array [1..dimf] of integer;

procedure cargar (v:vector; diml:integer; var num:integer);

begin

diml:= 0;
readln(num);

	while (num <> 0) and (diml < 500) do begin 
		diml:= diml +1;
		v[diml] := num;
		read(num);
	end;
end;

function buscar (v:vector; diml:integer; valor:integer): boolean;
var 
	pos:integer;
	esta:boolean;
begin
	esta:= false;
	pos:=1;
	while (pos <= diml) and (not esta) do begin 
		if (v[pos] = valor) then 
			esta := true
		else 	
			pos:= pos +1;
	end;
	buscar := esta;
end; 

var 
    v:vector;
    diml:integer;
    ok:boolean;
    num:integer;
begin
   diml:= 0;
   read(num);
   cargar(v,diml,num);
   if (buscar (v,diml,valor)) then
		  writeln(num, 'esta en el vector')
	else (num, 'no se encuentra en el vector');
end;
