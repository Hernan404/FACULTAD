
{Una empresa organizadora de competencias de videojuegos dispone de una estructura donde tiene almacenada toda la información de cada partida registrada durante el año 2023.

De cada partida se conoce: nombre del jugador, código del videojuego (1..8), puntaje inicial, puntaje final, DNI del jugador, ciudad de origen del jugador, ciudad donde se jugó la partida, fecha de la partida y cantidad de rondas jugadas.
Esta información se encuentra ordenada por nombre del jugador de manera ascendente.

Además, la empresa dispone de una tabla con el puntaje otorgado por ronda para cada código de videojuego.

A partir de la información de las partidas se pide:

a. Generar una nueva estructura que contenga, para cada jugador, el total de puntos obtenidos durante todo el 2023. Esta información debe quedar ordenada por nombre en forma ascendente.

b. Informar el nombre del jugador que obtuvo la mayor cantidad de puntos durante el año 2023.

c. Informar el porcentaje de partidas en las que el jugador tenía una ciudad de origen distinta a la ciudad donde se jugó la partida.

d. Informar el mes en que se registraron menos partidas.}


procedure procesardatos(L:lista);
var 

begin 
	inivector(vm);

	while (L <> nil) do begin 
		jugadorACT:= 0;
		obtenido:= 0; 

		while (L <> nil) and (L^.data.nombre = jugadorACT) then begin 

			//puntaje por ronda 
			obtenido:= vp[L^.data.puntaje_final] * L^.data.cant_rondas;
			
			//puntaje por partida
			total:= total + (L^.data.puntaje_inicial - L^.data.puntaje_final);
			
		

		L:= L^.sig; 
		end;
		armarlista(L2,total,jugadorACT);

		if (obtenido > max) then begin 
			max:= obtenido;
			p1:= L^.data.nombre;
		end;

		cantpartidas:= cantpartidas +1; 

		if (L^.data.cuidad_origen <> L^.data.ciudad_destino) then 
			cantpromedio:= cantpromedio +1; 

		vm[L^.data.mes]:= cantpartidas + vm[L^.data.mes];

	end;
		writeln()
end;



procedure insetar (var L:lista; r:registro);
var 
	ant,act,nue:lista;
begin
	new(nue);
	nue^.data:= r;
	ant:= L;
	act:= L;

	while (act <> nil) and (act^.data.dni < r.dni) do begin 
		ant:= act;
	act:= act^.sig;
	end;

	if (ant = act) then 
		L:= nue;
	else 
		ant^.sig:= nue;
	nue^.sig:= act; 
end; 



procedure eliminar (var L:lista; r:registro; exito:boolean);
var 
	ant,act:lista;
begin 
	exito:= false;
	act:= L;

	while (act <> nil) and (act^.data.dni <> r.dni) do begin 
		ant:= act;
	act:= act^.sig;
	end;

	if (act <> nil) then begin 
		exito:= true;
		if (act = L) then 
			L:= act^.sig;
		else 
			ant^sig:= act^.sig;
		disepose(act);

	end;

end;



program EJ12P7_ALT;
const 
	cursos = 4;
type 
	rango_cursos = 1..cursos;

	alumno = record 
		nombre:string;
		dni:integer;
		edad:integer;
		plan:rango_cursos;
	end;

	lista = ^nodo;
	nodo = record 
		data:alumno;
		sig:lista;
	end;

	vector = array [rango_cursos] of integer;
	vcosto = array [rango_cursos] of real;

procedure leer(var r:alumno);
procedure armarlista(var L:lista;r:alumno);

procedure cargardatos(L:lista);
var 
	r:alumno;
begin 
	leer(r);
	while(r.dni <> 0) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

procedure puntoB(v:vector; max1,max2,p1,p2:integer)
var 
	i:integer;
begin 
	for i:=1 to cursos do begin 
		if (v[i] > max1) then
			max2:= max1;
			p2:= p1;
			max1:= v[i];
			p1:= i;
		else if (v[i] > max2) then 
				max2:= v[i];
				p2:= i; 
	end;
end;

procedure procesardatos(L:lista);
var
	L2:= lista;
	vc:vcosto;
	v:vector;
begin
	L2:= Nil;
	inivector(v);

	while (L <> nil) do begin 
		ganancia:= vc[L^.data.plan] + ganancia;

		v[L^.data.plan]:= v[L^.data.plan] + cant_alumnos;

		if (L^.data.edad > 40) and ((L^.data.plan = 3) or (L^.data.plan = 4)) then 
			armarlista2(L2,L^.data);
	end;
	puntoB(v,max1,max2,p1,p2);
	writeln(p1,p2);
	writeln(ganancia);
end;


var 
	L:lista;
begin 
	L:= nil;
begin 
	cargardatos(L);
	procesardatos(L);
end,
