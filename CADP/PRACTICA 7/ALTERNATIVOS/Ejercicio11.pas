
{Realizar un programa para una empresa organizadora que necesita gestionar 100 torneos de videojuegos. De cada torneo se dispone la siguiente información:

    nombre del torneo,

    categoría del torneo (1: FPS, 2: MOBA, 3: Lucha, 4: Deportes, 5: Estrategia),

    sede del torneo,

    cantidad máxima de jugadores permitidos para participar en el torneo,

    y costo de inscripción por jugador.

Se pide:
a. Generar una estructura con las inscripciones para dichos torneos. De cada inscripción se debe guardar:

    código de inscripción,

    número de torneo (1..100),

    DNI del jugador,

    y cantidad de inscripciones (por si un mismo jugador inscribe a varios equipos).
    La lectura de las inscripciones finaliza con código de inscripción -1.

Una vez leída y almacenada la información de las inscripciones, calcular e informar:
a. El nombre y sede de los dos torneos con menor recaudación.
b. La cantidad de inscripciones en las que el DNI del jugador contiene más dígitos pares que impares, y que sean para torneos de categoría “Lucha”.
c. Informar si la cantidad total de inscripciones del torneo número 50 alcanzó la cantidad máxima de jugadores permitidos.}

{Realizar un programa para una empresa organizadora que necesita gestionar 100 torneos de videojuegos. De cada torneo se dispone la siguiente información:

    nombre del torneo,

    categoría del torneo (1: FPS, 2: MOBA, 3: Lucha, 4: Deportes, 5: Estrategia),

    sede del torneo,

    cantidad máxima de jugadores permitidos para participar en el torneo,

    y costo de inscripción por jugador.

Se pide:
a. Generar una estructura con las inscripciones para dichos torneos. De cada inscripción se debe guardar:

    código de inscripción,

    número de torneo (1..100),

    DNI del jugador,

    y cantidad de inscripciones (por si un mismo jugador inscribe a varios equipos).
    La lectura de las inscripciones finaliza con código de inscripción -1.

Una vez leída y almacenada la información de las inscripciones, calcular e informar:
a. El nombre y sede de los dos torneos con menor recaudación.
b. La cantidad de inscripciones en las que el DNI del jugador contiene más dígitos pares que impares, y que sean para torneos de categoría “Lucha”.
c. Informar si la cantidad total de inscripciones del torneo número 50 alcanzó la cantidad máxima de jugadores permitidos.}


program EJ11_ALTERNATIVO;
const 
	torneos = 100;
	categorias = 5;
type 
	rango_categorias = 1..categoria;
	rango_torneos = 1..torneos;

	torneo = record 
		nombre:string;
		categoria:rango_categoria;
		sede:string;
		cant_jugadores:integer;
		costo:real;
	end;

	vector = array [rango_torneos] of torneo;

	inscripccion = record 
		codigo:integer;
		numero:rango_torneos;
		dni:integer;
		cant_inscripcciones:integer;
		
	end; 

	lista = ^nodo;
	nodo = record 
		data:inscripccion;
		sig:lista;
	end; 

procedure cargartoreo(v:vector) // se dispone;

procedure cargarinscripccion(L:lista);
var 
	r:inscripccion;
begin 
	leer(r);
	while(r.codigo <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

procedure puntoA(v:vector; var min1,min2:real; nom1,nom2,sed1,sed2:string)
var 
	i:integer; r:torneo;
begin 
	for i:=1 to torneos do 
		if (v[i].costo < min1) then begin 
			min2:= min1;
			nom2:= nom1;
			sed2:= sed1;
			min1:= v[i].costo;
			nom1:= v[i].nombre;
		else if (v[i].costo < min2) then begin 
			min2:= v[i].costo;
			nom2:= v[i].nombre;
			sed2:= v[i].sede;
		end;
	end;
end;

function cumplePar(dni:integer):boolean;
var 
	par: integer;
	impar:integer;
begin 
	par:= 0; impar:= 0; 

	while (dni > 0) do begin 
		if (dni mod 10 mod 2 = 0) then 
			par:= par +1;
		else 
			impar:= impar +1; 
	
	dni:= dni div 10; 
	end; 

	cumplePar:= (par > impar); 

end;

procedure procesardatos(L:lista);
var 

begin 
	costo:= 0;
	while (L <> nil) do begin 
		costo:= v[L^.data.numero].costo * L^.data.cant_inscripcciones,

		if (v[L^.data.numero].tipo = 3) and (cumplePar(L^.data.dni)) then 
			cantB:= cantB + L^.data.cant_inscripcciones;

		if (L^.data.numero = 50) then 
			cant:= cant +1;
			
		L:= L^.sig;
	end; 
	puntoA(v,min1,min2,nom1,nom2,sed1,sed2);
	writeln(nom1,nom2,sed1,sed2);

	if (v[50].cant_jugadores < cant) then 
		writeln('no alcanzo')

end; 


var 
	L:lista;
	v:vector;
begin 
	L:= nil;
	cargartorneo(v); // se dispone
	cargarinscripccion(L);
end.
