
{El Club de Ajedrez “Peón Inteligente” desea procesar la información de los socios que finalizaron el Curso Avanzado de Estrategia. Para ello se deberá leer la información de cada socio, a saber:
número de socio, apellido, nombres, dirección de correo electrónico, año de inscripción, año de finalización del curso y los puntajes obtenidos en cada uno de los 16 desafíos que aprobó (los desafíos desaprobados no se registran).

    Realizar un módulo que lea y almacene la información de los socios hasta que se ingrese el socio con número de socio -1, el cual no debe procesarse.
    Los 16 puntajes correspondientes a cada socio deben quedar ordenados de forma descendente.

    Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
    a. El promedio de puntajes obtenido por cada socio.
    b. La cantidad de socios inscriptos en 2020 cuyo número de socio está compuesto únicamente por dígitos pares.
    c. El apellido, nombres y dirección de correo electrónico de los dos socios que más rápido finalizaron el curso (o sea, que tardaron menos años).

    Realizar un módulo que, dado un número de socio leído desde teclado, lo busque y elimine de la estructura generada en el inciso 1. El socio puede no existir.
}
program EJ7P7_ALTERNATIVO;
const 
	desafios = 16;
type 
	rango_puntajes = 1..desafios;

	socios = record 
		numero:integer;
		apellido:string;
		nombres:string;
		mail:string;
		año_inscripcion:integer;
		año_finalizacio:integer;
		puntaje:vector;
	end; 

	lista = ^nodo;
	nodo = record 
		data:socios;
		sig:lista;
	end; 

	vector = array [rango_puntajes] of integer;

procedure leer(var r:socios);
var 
	i:integer;
begin 
	with r do begin 
		readln(numero);
		readln(apellido);
		readln(nombres);
		readln(mail);
		readln(año_inscripcion);
		readln(año_finalizacio);
		for i:=1 to desafios do 
			readln(puntaje[i]);
			ordenarDescendente(puntaje,desafios)
	end;
end; 

procedure armarlista(L:lista; r:socios)

procedure cargardatos(L:lista);
var 
	r:socios;
begin 
	while (r.numero <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end; 

procedure promedioPuntajes(vpuntaje:vector; var totalpromedio:integer);
var 
	i:integer;
begin 
	for i:=1 to desafios do begin 
		if (vpuntaje[i] > 0) then 
			totalpromedio:= totalpromedio + vpuntaje[i];
	end; 
end;

function cumplePar(numero:integer):boolean;
var 
	impar:integer;
begin 
	impar:= 0;
	while (numero > 0) do begin 
		if (num mod 10 mod 2 = 1) then 
			impar:= impar +1;
		
	numero:= numero div 10;
	end;
	cumplePar:= (impar = 0);
end;

procedure eliminar (var L:lista; num:integer; exito:boolean);
var 
	ant,act:lista;
begin 
	exito:= false;
	act:= L;

	while (act <> nil) and (act^.data.numero <> num) do begin 
		ant:= act;
		act:= act^.sig;
	end;

	if (act <> nil) do begin 
		exito:= true;
		if (act = L) then 
			L:= act^.sig;
		else 
			ant^sig:= act^.sig;
		dispose(act);
	end; 

end;

procedure puntoB(r:socios; duracion:integer; var max1,max2:integer; var nom1,mail1,nom2,mail2:string)
begin 
	if (duracion > max1) then begin 
		max2:= max1;
		nom2:= nom1;
		mail2:= mail1;
		max1:= duracion;
		nom1:= r.nombre;
		mail1:= r.mail; 
	end 
	else if (max2 > max1) then begin 
			max2:= duracion;
			nom2:= r.nombre;
			mail2:= r.mail;
	end; 
end;

procedure procesardatos(L:lista);
var 
    L: lista;
    totalpromedio: real;
    cantB: integer;
    max1, max2: integer;
    ap1, nom1, mail1, ap2, nom2, mail2: string;
    duracion: integer;
    num: integer; 
    exito: boolean;
begin 
    L := nil;
    totalpromedio := 0;
    cantB := 0;
    max1 := MaxInt;
    max2 := MaxInt;
    ap1 := '';
    nom1 := '';
    mail1 := '';
    ap2 := '';
    nom2 := '';
    mail2 := '';
    duracion := 0;
    num := 0;
    exito := false;

	while (L <> nil) do begin 
		//punto 2.A 
		promedioPuntajes(L^.data.puntaje, totalpromedio)

		//punto 2.B
		if (L^.data.año_inscripcion = 2020) and (cumplePar(L^.data.numero)) then 
			cantB:= cantB +1; 

		//punto 2.C 
		duracion:= L^.data.año_finalizacio - L^.data.año_inscripcion;
		puntoC(L^.data,duracion,max1,max2,nom1,mail1,nom2,mail2);
	end; 

	writeln(totalpromedio/puntajes:2:0);
	writeln(nom1,mail1,nom2,mail2);
	writeln(cantB);

	// punto 3
	readln(num);
	eliminar(L,r,exito)
end; 

var 
	L:lista;
begin 
	cargardatos(L);
	procesardatos(L);
end. 
