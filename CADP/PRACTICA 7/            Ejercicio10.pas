{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la
ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se
registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de
meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se
ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa
se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de
empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al
total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program EJ10P7;
const 
	cultivos = 20;
type 

	infoCultivo = record 
		tipo:string;
		cantHE:integer;
		cantMeses:integer;
	end;

	vector = array [1..cultivos] of infoCultivo;


	empresa = record 
		codigo:integer;
		nombre:string;
		EoP:string;
		ciudad:string;
		cultivos:integer;
		info:vector;
	end;

	lista = ^nodo;
	nodo = record 
		data:empresa;
		sig:lista;
	end;


procedure leer(var r:empresa);
var 
	i:integer;
begin 
	with r do begin 
		readln(codigo);
		if (codigo <> -1) then begin 
			readln(nombre);
			readln(EoP);
			readln(ciudad);
			readln(cultivos);
			for i:=1 to cultivos do begin 
				readln(info[i].tipo);
				readln(info[i].cantHE);
				if (info[i].cantHE <> 0) then  
					readln(info[i].cantMeses);
			end;
		end;
	end;
end;

procedure armarlista(var L:lista; r:empresa);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;


procedure cargardatos(L:lista);
var 
	r:empresa;
begin 
	leer(r);
	while(r.codigo <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

function cumpleA(r:empresa):boolean;
var 
	cantCeros:integer;
begin 
	cantCeros:= 0;


		while (r.codigo > 0) do begin 
			if (r.codigo mod 10 = 0) then 
				cantCeros:= cantCeros +1;
			
			r.codigo:= r.codigo div 10;
		end;
	
	cumpleA:= (r.ciudad = 'San Miguel del monte') and (cantCeros = 2);
end;

function cumpleE(r:empresa; i:integer):boolean;
begin 
	cumpleE:= (r.info[i].tipo = 'girasol') and (r.info[i].cantHE < 5) and (r.EoP <> 'Estatal')
end;

procedure puntoD(nombre:string; cantmeses:integer; var max:integer; var p1:string);
begin 
	if (cantMeses > max) then 
		max:= cantMeses;
		p1:= nombre;
end;

procedure procesardatos(L:lista);
var 
	cantSoja:real; max:integer;
	p1:string;
	totalHEC:integer;
	i:integer;
begin 
	max:= -1;
	p1:= '';
	cantSoja:= 0;
	totalHEC:= 0;

	while (L <> nil) do begin 

		for i:=1 to L^.data.cultivos do begin 

			if (cumpleA(L^.data) and (L^.data.info[i].tipo = 'trigo')) then 
				writeln(L^.data.nombre);
		
		
			if (L^.data.info[i].tipo = 'soja') then 
				cantSoja:= L^.data.info[i].cantHE + cantSoja;
		
		
			if (L^.data.info[i].tipo = 'maiz') then 
				puntoD(L^.data.nombre,L^.data.info[i].cantmeses,max,p1);

			if (cumpleE(L^.data,i)) then 
				L^.data.info[i].cantMeses:= L^.data.info[i].cantMeses +1;

			totalHEC:= totalHEC + L^.data.info[i].cantHE;
		end;
		L:= L^.sig;
	end;
	writeln('cantidad de soja', cantSoja);
	writeln('la soja representa', (cantSoja/totalHEC)*100:2:0, '%');
	writeln('empresa que dedica mas tiempo a maiz', p1);
end;


var 
	L:lista;
begin 
	L:= nil;

	cargardatos(L);
	procesardatos(L);
end.



