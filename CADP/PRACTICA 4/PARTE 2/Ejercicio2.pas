program EJ2P4P2;

const 
	dimf = 500;
type
	
	nombre = record
		nombres:string;
	end;
	
	vector = array [1..dimf] of nombre;
	posicion = array [1..dimf] of integer;

procedure leer (var v:vector; var n:nombre);
var
	i:integer;
begin

	for i:=1 to dimf do begin
		while (n.nombres <> 'ZZZ') do begin
			readln(n.nombres);
            diml := diml +1;
            pos[diml]:= pos
			v[i]:= n;
		end;
	end;
end;

procedure cargar (var pos:posicion; var v:vector; var diml:integer);
var 
    i:integer;
begin
    for i:=1 to dimf do begin 
        pos[i]:= 0;    
end;
    end;
end;
procedure borrar (var v:vector; var pos:posicion; var exito:boolean);
var
	diml:integer;
	pos:posicion;
begin
    exito := false;
    read(n.nombres)
    if (pos = 1) then begin 
        exito := true;
        for i:=pos to diml do
            v[i-1]:= v[i];
        diml := diml - 1;
    end;
end;

procedure insertar (var v:vector; pos:posicion; exito:boolean);
var 
    i:integer;
begin
    exito:false;
    read(n.nombres)
    if (diml < dimf) and (pos = 4) and (pos<= diml) then begin 
        exito:= true;
        for i:= diml downto pos do 
            v[i + 1] := v[i];
        v[pos] := elemento;
        diml:= diml +1:
    end;
end;

procedure agregar (var v:vector; var pos:posicion; var diml:integer; exito:boolean);
begin 
    exito:= false;

    if (diml < dimf) then begin 
        exito:= true;
        diml:= diml +1;
        v[diml]:= elemento;
    end;
var 
	v:vector;
	n:nombre;
begin 
	
	leer(v,n);
end.
