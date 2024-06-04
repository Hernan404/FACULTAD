{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2:
planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados.
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). La
estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares}

program EJ6P7;
const 
	categorias = 7;
type 
	rango_categorias = 1..7;
	
	objeto = record 
		codigo:integer;
		categoria:rango_categorias;
		nombre:string;
		distancia:integer;
		nombre_descubridor:string;
		anio:integer;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:objeto;
		sig:lista;
	end;
	
	vector = array [rango_categorias] of integer;

procedure leer(var r:objeto);
begin 
	with r do begin 
		readln(codigo);
		readln(categoria);
		readln(nombre);
		readln(distancia);
		readln(nombre_descubridor);
		readln(anio);
	end;
end;

procedure armarlista(var pri:lista; r:objeto); 
var  
   act, nue : lista;
begin 
   new (nue);
   nue^.data:= r;
   nue^.sig := NIL;
   if pri <> Nil then 
   begin
       act := pri ;
       while  (act^.sig <> NIL ) do 
           act := act^.sig ;
       act^.sig := nue ;
   end
   else
       pri:= nue;
end;

procedure inivector (var v:vector); 
var 
	i:rango_categorias;
begin 
	for i:=1 to categorias do v[i]:= 0;
end;



procedure cargardatos (var L:lista);
var 
	r:objeto;
begin 
	leer(r);
	while (r.codigo <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

procedure punto1(var max1,max2,c1,c2:integer; r:objeto);
begin 
	if (r.distancia > max1) then begin 
		max2:= max1;
		c2:= c1;
		max1:= r.distancia;
		c1:= r.codigo;
	end
	else if (max1 > max2) then begin 
			max2:= r.distancia;
			c2:= r.codigo;
	end;
end;

function cumple3(cod:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0; impar:= 0;
	while(cod > 0) do begin 
		if (((cod mod 10) mod 2) = 0) then 
			par:= par +1
		else 
			impar:= impar +1;
		cod:= cod div 10;
	end;
	cumple3:= (par > impar);
end;

function cumple2(nombre:string; anio:integer):boolean;
begin 
	cumple2:= (nombre = 'Galileo Galilei') and (anio < 1600);
end;

procedure procesardatos(L:lista);
var 
	v:vector; max1,max2,c1,c2,cantB,i:integer;
begin 
	max1:= -1; max2:= -1; c1:= 0; c2:= 0; cantB:= 0;
	
	inivector(v);
	while (L <> nil) do begin 
		punto1(max1,max2,c1,c2,L^.data);
		
		if (cumple2(L^.data.nombre_descubridor,L^.data.anio)) then
			cantB:= cantB +1;
			
		v[L^.data.categoria]:= v[L^.data.categoria] +1;
		
		if (cumple3(L^.data.codigo)) and (L^.data.categoria = 1) then 
			writeln('Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares. ', L^.data.nombre);
	
		
	L:= L^.sig;
	end;
		writeln('Los códigos de los dos objetos más lejanos de la tierra que se hayan observado. ', c1,c2);
		writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600. ', cantB);
		for i:=1 to categorias do 
			writeln('La cantidad de objetos observados por cada categoría. ', v[i], i);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.



