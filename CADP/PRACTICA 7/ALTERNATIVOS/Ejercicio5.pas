program EJ5P7_ALTERNATIVO;
const  
	laboratorios = 100;
type 
	rango_laboratorios = 1..laboratorios;

	laboratorio = record 
		codigo:integer;
		año_inauguaracion:integer;
		capacidad:integer;
	end; 

	vlabs = array [rango_laboratorios] of laboratorio;

	proyecto = record 
		codigo_proyecto:integer;
		codigo_laboratorio:rango_laboratorios;
		cantHoras:integer;
		area:string;
		año_realizo:integer;
		dni:integer;
	end; 

	lista = ^nodo;
	nodo = record 
		data:proyecto;
		sig:lista;
	end; 

procedure cargarlaboratorio(var v:vlabs); // se dispone 

procedure armarlista (var L:lista; r:proyecto);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux; 
end;

procedure leer (var r:leer);
begin 
	with r do begin 
		readln()
		readln()
		readln()
		readln()
		readln()
		readln()
	end; 
end;

procedure cargarproyecto(L:lista);
var 
	r:proyecto;
begin 
	while (r.codigo_proyecto <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end; 
end;

procedure punto1(horas:integer; var codigo:integer; var min:integer; max:integer; var c1,c2:integer);
begin 
  	if (horas > max) then begin 
		max:= horas;
		c1:= codigo;
	end 
	else if (horas < min) then begin 
		min:= horas;
		c2:= codigo; 
	end;
end;

function cumple3 (codigo:integer):boolean;
var 
	impar:= 0;
	par:= 0;
begin 
	while (codigo > 0) do begin 
		if ((codigo mod 10) mod 2 = 0) then 
			par:= par +1;

		codigo:= codigo div 10;
	end;

	cumple3:= (par = 0);
end; 

procedure procesardatos(v:vlabs; L:lista);
var 
  min,max:integer; c1,c2:integer;
begin
  min:= 9999; max:= -1; c1:= 0; c2:= 0;

  while (L <> nil) do begin 
	
   	for i:=1 to 100 do begin 
     	punto1(L^.data.cantHoras,v[i].codigo);

		if (v[i].capacida > 30) and ((L^.data.año_realizo - v[i].año_inauguaracion) > 5) then 
			cant2:= cant2 + 1;
	end; 

	if (cumple3(L^.data.dni)) then 
		writeln(L^.data.codigo_proyecto);

  end; 
end; 

var 
	L:lista; v:vlabs;
begin 
	L:= nil; 
	cargarlaboratorio(v); // SE DISPONE
	cargarproyecto(L);
	procesardatos(v,L);
end. 
