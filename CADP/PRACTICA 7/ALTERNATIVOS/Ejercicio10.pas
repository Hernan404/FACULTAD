Una empresa de servicios informáticos desea procesar la información de las compañías a las que 
les desarrolla software. De cada compañía se conoce su ID, nombre, 
si es pública o privada, el nombre de la ciudad donde está radicada y
los proyectos de software que tiene contratados (a lo sumo 20). 
Para cada proyecto se registra: tipo de software (ERP, CRM, e-commerce, logística, etc.), 
cantidad de usuarios que lo utilizan y la duración del proyecto en meses.

a. Realizar un programa que lea la información de las compañías y sus proyectos.
Dicha información se ingresa hasta que llegue una compañía con ID -1 (la cual no debe procesarse).
Para cada compañía se leen todos sus proyectos, hasta que se ingrese un proyecto con 0 usuarios 
(que no debe procesarse).

Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las compañías radicadas en "Villa María" que tienen proyectos 
del tipo ERP y cuyo ID posee al menos dos cifras 7.

c. La cantidad total de usuarios de proyectos del tipo CRM y qué porcentaje 
representa con respecto al total de usuarios registrados en todos los proyectos.

d. La compañía que tiene el proyecto de tipo "e-commerce" con mayor duración (en meses).

e. Realizar un módulo que incremente en 1 mes la duración de todos los proyectos de tipo logística que 
tienen menos de 10 usuarios, solo en compañías privadas.


program EJ10_ALTERNATIVO;
const 
	proyectos = 20;
type 
	rango_proyectos = 1..proyectos;
	contratado = record 
		tipo:string;
		cant_usuarios:integer;
		duracion:integer;
	end;


	compañia = record 
		id:integer;
		nombre:string;
		estado:string;
		ciudad:string;
		contratado:contratado;
	end;


	vector = array [rango_proyectos] of contratado;

	lista = ^nodo;
	nodo = record 
		data:compañia;
		sig:lista;
	end; 

procedure leer(var r:compañia; var v:vector; var diml:integer);
begin 
		with r do begin 
			readln(id)
			readln(nombre)
			readln(ciudad)
			readln(estado)
			readln(contratado.cant_usuarios)

			while (diml < 20) and (contratado.cant_usuarios <> 0) do begin 
				diml:= diml +1;
				v[diml]:= contratado.cant_usuarios; 
				readln(contratado[i].tipo);
				readln(contratado[i].cant_usuarios);
				readln(contratado[i].duracion);
			end;
		 
		end;
end;

procedure cargardatos(L:lista; var diml:integer); 
var 
	r:compañia; v:vector;
begin 
	diml:= 0;
	leer(r,v,diml);
	while (r.id <> -1) do begin 
		armarlista(L,r);
		leer(r,v,diml);
	end;
end; 

function cumpleB (ciudad:string; v:vector; id:integer; diml:integer):boolean;
var 
	tiene:boolean;
	i,siete:integer;
begin 
	siete:= 0; 
	tiene:= false;
	while (id > 0) do begin 
		if (id mod 10 = 7) then 
			siete:= siente + 1;
		id:= id div 10;
	end;

	for i:= 1 to diml do 
		if (v[i].tipo = 'ERP') then 
			tiene:= true;

	cumpleB:= (siete = 2) and (nombre = 'Villa Maria') and (tiene);
end;

procedure procesardatos(L:lista; diml:integer);
var 


begin 
	while (L <> nil) do begin 
		if (cumpleB(L^.data.ciudad,v,L^.data.id)) then 
			writeln(L^.data.nombre)

		
end;

var 
	L:lista;
	diml:integer;
begin 
	L:= nil; 
	cargardatos(L);
	procesardatos(L);
end.

