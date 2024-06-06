

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
		capacidad:integer;
	end;

	ventas = record 
		codigo:integer;
		numero:integer;
		DNI:integer;
		cant_entradas:integer;
	end;
	vector = array [eventos] of evento;
	vpuntoA = array [eventos] of real;

	lista = ^nodo;
	nodo = record 
		data:ventas;
		sig:lista;
	end;
	
	
procedure cargar_evento (var vp2:vpuntoA);
var 
	i:integer;
begin 
	for i:=1 to eventos do begin 
		readln(vp2[i].nombre);
		readln(vp2[i].tipo);
		readln(vp2[i].lugar);
		readln(vp2[i].cant_personas);
		readln(vp2[i].costo);
	end;
end;



procedure leer_ventas (var r:ventas);
begin 
	with r do begin 
		readln(codigo);
		readln(DNI);
		readln(numero);
		readln(cant_entradas);
	end;
end;


procedure crearLista (var L: Lista; r:ventas);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.data:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure cargardatos(var L:lista);
var 
	i:integer;
begin 
	leer_ventas(r);
	while (r.codigo <> -1) do begin 
		armarlista(L,r);
		leer_ventas(r);
	end;
end;

procedure puntoA (vp2:vpuntoA; min1,min2:real; a1,a2,e1,e2:string);
var 
	i:integer;
begin 
	for i:=1 to 100 do begin 
		if (vp2[i].costo < min1) then begin 
			min2:= min1;
			a2:= a1;
			e2:= e1;
			min1:= vp2[i].costo;
			a1:= vp2[i].nombre;
			e2:= vp2[i].lugar;
		end
		else if (min1 < min2) then begin 
			min2:= vp2[i].costo;
			a2:= vp2[i].nombre;
			e2:= vp2[i].lugar;
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
	

procedure procesardatos(L:lista; v:vector);
var 
	min1,min2:real; a1,a2,e1,e2:string; cantB:integer; 
	vp2:vpuntoA; 
	i:integer;
	cantC:integer;
	costo:real;
begin 
	cantB:= 0; costo:= 0;
	cantC:= 0;
	for i:=1 to eventos do 
		vp2[i]:= 0; 
		
	a1:= ''; a2:= ''; e1:= ''; e2:= ''; min1:= 999; min2:= 999;  
	while (L <> nil) do begin 
	
		//punto A
		costo:= v[L^.data.numero].costo * L^.data.cant_entradas;
		vp2[L^.data.numero]:= vp2[L^.data.numero] + costo; 
		
		//punto B
		if (v[L^.data.numero].tipo = 3) and (cumplePar(L^.data.DNI)) then 
			cantB:= cantB + L^.data.cant_entradas;
		
		//punto C
		if (L^.data.numero = 50) then  
		cantC:= cantC +1;
	end;
		puntoA(vp2, min1,min2,a1,a2,e1,e2);
		writeln('punto B', cantB);
		
		if (v[50].capacidad < cantC) then 
			writeln('no alcanzo')
		else 
			writeln('supero');
end;

var 
	L:lista; vp2:vpuntoA; r:ventas; v:vector;
begin 
	L:= nil;
	cargar_evento(v);
	cargardatos(L);
	procesardatos(L,v);
end.

