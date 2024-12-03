{TEMA 2: 
un fabricante de dispositivos electronicos desea procesar informacion de los repuestos que compro.
de cada repuesto conoce su codigo, precio, codigo de marca (entre 1 y 130) y nombre del pais del que proviene.
el fabricante dispone de una estructura de datos con la informacion de los repuestos, ordenados por nombre de
pais.
Realizar un progrma que:
	A. Lea el codigo y el nombre de las 130 marcas con las que trabaja, y las almacene en una estructura de 
	datos. la informacion se ingresa sin ningun orden particular.
	B. una vez completada la carga, procese la informacion de los repuestos e informe: 
		1. la cantidad de paises a los que se le compro mas de 100 repuestos
		2. para cada marca, nombre de la marca y el precio del producto mas barato
		3. la cantidad de repuestos que no poseen ningun cero en su codigo.}
	



program TEMA2;
const 
	marcas = 130;
type 
	rango_marcas = 1..marcas;
	
	repuesto = record 
		codigo:integer;
		precio:real;
		cod_marca:rango_marcas;
		nombre:string;
	end;

	trabaja = record 
		codigo:string;
		nombre:string;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:repuesto;
		sig:lista;
	end;
	
	vMarcas = array [rango_marcas] of trabaja;
	vPrecios = array [rango_marcas] of real;

procedure cargardatos(L); // se dispone

procedure inivector(vc:vCant);
var 
	i:integer;
begin 
	for i:=1 to marcas do begin 
		vc[i]:= 0;
	end;
end;


procedure leer(var cod:integer; var nom:string;);
begin 
	readln(cod);
	readln(nom);
end;

procedure cargarmarca(var L:lista); 
var 
	vm:vMarcas;
	cod,i:integer;
	nom:string;
begin 
	for i:=1 to marcas do begin 
		leer(cod,nom);
		vm[cod]:= nom;  // guardo en [cod] y no en [i] porque no tiene que estar ordenado
	end;
end;

procedure inivector(vp:vprecio);
var 
	i:integer;
begin 
	for i:=1 to marcas do 
		vp[i]:= 999;
end;

procedure punto2(var min:real; valorNUE:real);
begin 
	if (valorNUE < min) then 
		min:= valorNUE;
end;	

procedure cumple3(cod:integer):boolean;
var 
	cero:boolean;
begin 
	cero:= true;
	while (cod <> 0) and (cero = true) do begin 
		if ((cod mod 10) = 0) then
			cero:= false;
		cod:= cod div 10;
	end;
	cumple3:= (not cero);
end;

procedure procesardatos(L:lista);
var 
	vm:vMarcas; vc:vCant; vp:vprecios; cant3:integer;
	cant_repuesto:integer;

begin 
	cant3:= 0; max:= -1; p1:= 0;
	inivector(vc);
	while (L <> nil) do begin 
		paisACT:= L^.data.codigo;
		cant_repuesto:= 0;
		while (L <> nil) and (L^.data.codigo = paisACT) do begin 

			cant_repuesto:= cant_repuesto +1;

			punto2(vp[L^.data.cod_marca], L^.data.precio);

	  	 	if (cumple3(L^.data.codigo)) then 
				cant3:= cant3 +1;

		L:= L^.sig;
		end;
		if (cant_repuesto > 100) then 
			cant1:= cant1 +1;
	end;
	writeln('punto 1 ', punto1);
	
	writeln('punto 3 ', punto3);	

	for i:=1 to marcas do 
		writeln('punto 2 ', vm[i], vp[i]) // vm actua como posicion, vp actua como el puntero
end;


var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L); // se dispone;
	cargardatosmarca(L);
	procesardatos(L);
end.



