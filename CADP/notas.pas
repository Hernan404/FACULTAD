
VECTOR CON DIML 
program EJ3P4;

const 
    dimf = 5;
type 
	rango = 1..dimf;
	
    vector = array [rango] of integer;

procedure cargar (v:vector; diml:integer);
var 
	n:integer;
begin 
	diml:= 0;
	read(n);
	while (diml < dimf) do begin
		diml:= diml +1;
		read(n);
		v[diml]:= n;
	end;
	
end;


procedure procesar (var v:vector; var diml:integer);
var 
	i:rango;
begin 
	i:= 1;
	while (i <= diml) do begin
		if (v[i] > 50) then 
			writeln('el numero en la posicion' i ' es '50'');
	i:= i+1;
end;


var 
	v:vector;
	diml:integer;
	
begin 

		cargar(v,diml);
		procesar(v,diml);

end.


---------------------------------------------------------------
VECTOR SIN DIML

program EJ3P4;

const 
    dimf = 5;
type 
	rango = 1..dimf;
	
    vector = array [rango] of integer;


procedure cargar (var v:vector); {CARGO LOS DATOS}
var 
	i:rango;
begin 
		for i:=1 to dimf do begin 
			readln(v[i]);
		end;
end;


procedure procesar (var v:vector);  {HAGO LA CUENTA QUE TENGA QUE HACER EN EL VECTOR}
var 
	i:rango;
begin 
	for i:= 1 to dimf do begin 
		writeln(v[i]);
	end;
end;


var 
	v:vector;
	
begin 

		cargar(v);
		procesar(v);

end.

--------------------------------------------------------------
















HACER 2 MINIMOS 

if (num < min1) then begin
  min2:=min1;
  min1:= num;
 end;
else
  begin 
    if (num < min2) then begin
        min2:= num;
    end;
    
    
    SACAR PARES DE DIGITOS
    
    procedure trespares (listaF:lista; pares:integer);
var 
    dig:integer;
    par:integer;
    codigo:integer;
begin 
    codigo:= listaF^.num.codigo;
    par:=0;
    while (codigo <> 0) do begin 
        dig:= codigo mod 10;
        if(dig mod 2) = 0) then begin 
            par:= par+1;
            codigo:= codigo div 10;
        end;
        else
            codigo:= codigo div 10;
    if (par >= 3) then begin 
        writeln('desc de codigo' listaF^.num.codigo, 'es', listaF.num.descripcion);
        par:= 0;
end 
else 
    begin 
        par:= 0;
end;
