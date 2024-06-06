{PARCIAL PRACTICA.
un cine posee la lista de peliculas que proyectara durante el mes de febrero
de cada pelicula se tiene codigo de pelicula, nombre de pelicula, codigo genero (1..8)
y puntaje promedio otorgado por las criticas. dicha estructura no posee ningun orden

se pide:
A. actualizar (en la lista que se dispone) el puntaje promedio otorgado por las criticas
para ello se debe leer desde teclado las criticas que han realizado criticos de cine. de 
cada critica se lee DNI del critico, apellido y nombre del critico, codigo de pelicula y 
puntaje otorgado. la lectura finaliza cuando se lee el codigo de pelicula -1 y la informacion
viene ordenada por codigo de pelicula

B. informar el codigo de genero que mas puntaje obtuvo entre todas las criticas

C. informar el apellido y nombre de aquellos criticos que posean la misma cantidad de digitos
pares e impares en su DNI

D. realizar un modulo que elimine de la lista que se dispone una pelicula cuyo codigo
se recibe como parametro (el mismo puede no existir)}




{Una tienda virtual necesita un programa para administrar la informacion de sus clientes
de cada cliente se lee: numero, DNI, apellido y nombre, fecha de nacimiento (dia,mes,año)
nivel(1..5) y puntaje. la lectura finaliza cuando se lee el cliente con dni 33444555 que debe procesarse

se pide: 
A) generar una estructura que contenga numero, apellido y nombre de aquellos clientes con dni 
compuestos unicamente por digitos impares
B) informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000
C) implementar un modulo que elimine de la estructura generada la informacion relacionada a un 
numero de cliente recibido por parametro, tener en cuenta que dicho numero puede no existir.}

program PARCIAL_TIENDA;
const 
	niveles = 5;
type 
	rango_niveles = 1..5;
	
	fechas = record 
		dia:integer;
		mes:1..12;
		anio:integer;
	end;
	
	cliente = record 
		numero:integer;
		dni:integer;
		apeynom:string;
		fecha:fechas;
		nivel:rango_niveles;
		puntaje:real;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:cliente;
		sig:lista;
	end;
		
	clienteA = record 
		numero:integer;
		apeynom:string;
	end;

	lista2 = ^nodo2;
	nodo2 = record 
		data:clienteA;
		sig:lista2;
	end;
	
	vector = array [rango_niveles] of real;

procedure leer(var r:cliente);
begin 
	with r do begin 
		readln(numero);
		readln(dni);
		if (dni <> 3344) then begin 
			readln(apeynom);
			readln(fecha.dia);
			readln(fecha.mes);
			readln(fecha.anio);
			readln(nivel);
			readln(puntaje);
		end;
	end;
end;

procedure armarlista(var L:lista; r:cliente);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;

procedure inivector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to niveles do v[i]:= 0;
end; 

procedure cargardatos(var L:lista);
var 
	r:cliente;
begin 
	repeat 
		leer(r);
		armarlista(L,r);
	until (r.dni = 3344); {uso un numero mas corto porque 33444555 me da error al copilar}
end;

procedure armarlista2(var L2:lista2; ra:clienteA);
var 
	aux:lista2;
begin 
	new(aux);
	aux^.data:= ra;
	aux^.sig:= L2;
	L2:= aux;
end;

procedure puntoB(v:vector; var max,min:real; p1,m1:real);
var 
	i:integer;
begin 
	for i:=1 to niveles do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			p1:= i;
		end;
		if (v[i] < min) then begin 
			min:= v[i];
			m1:= i;
		end;
	 end;
end;

function cumpleimpar(dni:integer):boolean;
var 
	impar:boolean;
begin 
	impar:= true;
	while (dni <> 0) do begin 
		dni:= dni mod 10; 
		if (dni mod 2 = 1) then 
			impar:= false;
		dni:= dni div 10;
		
	end;
	cumpleimpar:= (impar = false);
end;

procedure procesardatos(L:lista; L2:lista2);
var 
	v:vector; min,max:real; p1,m1:real; ra:clienteA;
begin
	min:= 999; max:= -1; p1:= 0; m1:= 0;
	inivector(v);
	while (L <> nil) do begin 
		if (cumpleImpar(L^.data.dni)) then begin 
			ra.numero:= L^.data.numero;
			ra.apeynom:= L^.data.apeynom;
			armarlista2(L2,ra);
		end;
		
		if (L^.data.fecha.anio < 2000) then 
			v[L^.data.nivel]:= v[L^.data.nivel] + L^.data.puntaje;
	
	L:= L^.sig;		
	end;
	puntoB(v,max,min,p1,m1);
	writeln(p1,m1);
	
end;

Procedure eliminar (var pri:lista2; num:integer; var r:cliente; var exito: boolean);
var 
	ant, act: lista2;
begin 
	
    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.data.numero <> num) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

var 
	L:lista; L2:lista2;
	r:cliente;
	num:integer;
	exito:boolean;
begin 
	L:= nil; L2:= Nil;
	cargardatos(L);
	procesardatos(L,L2);
	readln(num);
	eliminar(L2,num,r,exito);
end.
