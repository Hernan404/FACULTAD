{{LA CATEDRA DE CADP NECESITA UN PROGRAMA PARA GENERAR EL LISTADO DE ALUMNOS INGRESANTES
QUE RENDIRAN EL PARCIAL PARA ELLO, LA CATEDRA DISPONE DE UN LISTADO CON TODOS LOS ALUMNOS QUE INGRESARON
ESTE AÑO A LA FACULTAD. DE CADA ALUMNO SE CONOSE SU DNI, NOMBRE Y APELLIDO, 
NOTA OBTENIDA EN CURSOS DE INGRESO (4..10), TURNOS (1..4) Y SI ESTUVO PRESENTE O AUSENTE
EN CADA UNA DE LAS 12 CLASES DE PRACTICA.

A) realizar un modulo que reciba la informacion de los alumnos y retorne una nueva 
estructura de datos que contega solo aquellos alumnos que podran rendir el parcial, para poder rendir
el parcial, los alumnos deben contar con almenos 8 asistencias en las 12 clases de practica.

B) realizar un modulo que reciba la estructura de datos generada en el inciso anterior e imprima en pantalla
	1. apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso
	2. turno con mayor cantidad de alumnos en condiciones de rendir el examen
	3. cantidad de alumnos que no posean ningun digito cero en su DNI.
	
}


program SADS;
const 
	notas = 10;
	turnos = 4;
	clases = 12;
type 
	rango_turnos = 1..4;
	rango_clases = 1..12;

	alumnos = record 
			DNI:integer;
			nya:string;
			nota:integer;
			turno:rango_turnos;
			presente:rango_clases;
	end;

	lista = ^nodo;
	nodo = record 
		data:alumnos;
		sig:lista;
	end;

	vturno = array [rango_turnos] of integer;
	vclase = array [rango_clases] of string;



procedure cargardatos(var L:lista); // se dispone;

procedure iniclases(var vc:vclase); // se dispone 

procedure initurnos(var vt:vturno); // se dispone

procedure puntoB(vt:vturno; max:integer; p1:rango_turnos);

procedure armarlista2(var L2:lista; r:alumnos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L2;
	L2:= aux;
end;

procedure armarlista(var L:lista; r:alumnos);  // se dispone


function cumpleC(dni:integer):boolean;
var 
	haycero:boolean;
begin 
	haycero:= false;
	while (dni > 0) do begin 
		dni:= dni mod 10;
		if (dni = 0) then 
			haycero:= true;
	end;
	cumpleC:= (not haycero);
end;


procedure evaluarasistencia (L:lista; var L2:lista);
var 
	asistencias:integer; vc:vclase;
begin 
	asistencias:= 0;
	iniclases(vc);
	if (vc[L^.data.presente] = 'presente') then begin
		asistencias:= asistencias +1;
	L:= L^.sig;
	end;
	if (asistencias > 8) and (asistencias <= 12) then 
		armarlista2(L2,r)
end;

procedure procesardatos(L2:lista);
var 
	max,t1,cantC:integer;
	vt:vturno;
begin 
	max:= -1; t1:= 0; cantC:= 0;
	initurnos(vt);
	while (L2 <> nil) do begin 
		
		//punto A
		if (L2^.data.nota >= 8) then 
			writeln(L2^.data.nya,L2^.data.dni);

		//PUNTO B
		vt[L2^.data.turno]:= vt[L2^.data.turno] +1;

		//punto C
		if (cumpleC(L2^.data.DNI)) then 
			cantC:= cantC +1;
		L:= L^.sig;
		
	end;
	puntoB(vt,max,t1);
end;


	
var 
	L2,L:lista;
begin 
	L:= nil; L2:= nil;
	cargardatos(L); // se dispone
	evaluarasistencia(L,L2);
	procesardatos(L2);
end.
