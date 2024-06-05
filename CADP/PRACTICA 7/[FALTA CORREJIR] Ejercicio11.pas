

program EJ11P7;
type 
	eventos = 1..100;
	tipos = 1..5;
	
	evento = record 
		nombre:string;
		tipo:tipos;
		lugar:string;
		cant_personas:integer;
		costo:real;
	end;

	ventas = record 
		codigo:integer;
		numero:integer;
		DNI:integer;
		cant_entradas:integer;
	end;
	vector = array [eventos] of integer;
	vector2 = array [eventos] of evento;

	lista = ^nodo;
	nodo = record 
		data:ventas;
		sig:lista;
	end;
	
	
procedure inivector (var v:vector; var v2:vector2);
begin 

end;

procedure puntoA (v2:vector2; min1,min2:real; a1,a2,e1,e2:string);
var 
	i:integer;
begin 
	for i:=1 to 100 do begin 
		if (v2[i].costo < min1) then begin 
			min2:= min1;
			a2:= a1;
			e2:= e1;
			min1:= v2[i].costo;
			a1:= v2[i].nombre;
			e2:= v2[i].lugar;
		end
		else if (min1 < min2) then begin 
			min2:= v2[i].costo;
			a2:= v2[i].nombre;
			e2:= v2[i].lugar;
		end;
	end;
end;

function cumplePar(dni:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0;
	impar:= 0;
	while (dni > 0) do begin 
		dni:= dni mod 10;
		if (dni mod 2 = 0) then begin 
			par := par +1;
		end
		else 
			impar:= impar +1;
	end;	
	
	cumplePar:= (par > impar);
end;
	

procedure procesardatos(L:lista);
var 
	min1,min2:real; a1,a2,e1,e2:string; cantB:integer; maximoC:boolean;
	v:vector; v2:vector2;
	i:integer;
begin 
	cantB:= 0;
	a1:= ''; a2:= ''; e1:= ''; e2:= ''; min1:= 999; min2:= 999; maximoC:= false; 
	inivector(v,v2);
	while (L <> nil) do begin 
		
		puntoA(v2, min1,min2,a1,a2,e1,e2);
		//punto B
		if (v2[L^.data.numero].tipo = 3) and (cumplePar(L^.data.DNI)) then 
			cantB:= cantB + L^.data.cant_entradas;
			
		if (L^.data.numero = 50) and (v2[50].cant_personas < L^.data.numero) then 
			maximoC:= true;
	end;
		for i:=1 to 100 do 
			writeln('punto A', a1,a2,e1,e2);
			
		writeln('punto B', cantB);
		
		if (maximoC) then
			writeln('puntoC cumple ');
end;

var 
	L:lista;
begin 
	L:= nil;
	cargareventos(L); 
	cargarventas(L);
	procesardatos(L);
end.

