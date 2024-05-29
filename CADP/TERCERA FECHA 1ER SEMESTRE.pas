PARCIAL TERCERA FECHA 1ER SEMESTRE 2023
una revista deportiva dispone de informacin de los jugadores de futbol participantes de la liga 
profesional 2022. de cada jugador se conoce: codigo de jugador, apellido y nombre, codigo
de equipo (1..28), año de nacimiento y la calificacion obtenida para cada una de las 27 fechas 
del torneo finalizado. la calificacion es numerica de 0 a 10, donde el valor 0 significa que el jugador
no ha participado en la fecha.

A. informar para cada equipo la cantidad de jugadores mayores a 35 años 
B. informar los codigos de los 2 jugadores con mejor calificacion en los partidos en los que 
solo participo. solo debe considerarse los jugadores que participen en mas de 14 fechas.
C. implementar e invocar a un modulo que genere una lista con los jugadores cuyo codigo posee
exactamente 3 digitos impares y haya nacido entre 1983 y 1990. la lista debe estar ordenada por codigo de jugador

program tercerafecha;
const 
	equipos = 28;
	fechas = 27;
type 
	rango_equipos = 1..28;
	rango_fechas = 1..27;
	
	jugador = record 
		codigo:integer;
		nomyape:string;
		equipo:rango_equipos;
		nacimiento:integer;
	end;	

	lista = ^nodo 
	nodo = record 
		data:jugador;
		sig:lista;  
	end;
	 
	vpuntuacion = array [rango_fechas] of integer;
	vequipos = array [rango_equipos] of integer;
	
procedure cargardatos(var L:lista); // se dispone

procedure inivector(var vE:vequipos);
var 
	i:rango_equipos;
begin
	for i:=1 to equipos do 
		v[i]:= 0;
end;

procedure puntoB (vP:vpuntuacion; var promedio:real; fechas:integer);
var 
	i:rango_fechas;
	suma:integer;
begin 
	suma:= 0;
	fechas:= 0;
	for i:=1 to fechas do begin 
		if (v[i] <> 0)  then begin 
			suma:= suma + v[i];
			fechas:= fechas +1;
		end;
	end;
	promedio:= suma/fechas;
end;

procedure mayoresB (codigo:integer; var max1,max2:real; var c1,c2:integer);
begin 
	if (promedio > max1) then begin 
		max2:= max1;
		c2:= c1;
		max1:= promedio;
		c1:= codigo;
	end
	else if (max1 > max2) then begin
		max2:= promedio;
		c2:= codigo;
	end;
end;

function cumplepares (cod:integer):boolean
var 
	impar:integer;
begin 
	impar:= 0;
	while (cod > 0) do begin 
		cod:= cod mod 10;
		if (cod mod 2 <> 0) then 
			impar:= impar +1
	
		cod:= cod div 10;
	end;
	cumplepares:= (impar = 3);
end;

procedure armarlistaC (L:lista; var L2:lista);
begin
	while (L <> nil) do begin 
		if (cumplepares(L^.data.codigo)) and (L^.data.nacimiento >= 1983) and (L^.data.nacmiento <= 1990) then 
			armarlistaC(L2,L^.data);
		L:=L^.sig;
	end;
end;
procedure imprimir (vE:vequipos);
var 
	i:rango_equipos;
begin 
	for i:=1 to equipos do 
		writeln(v[i], i);
end;

procedure procesardatos(L:lista);
var 
	vE:vequipos; c1,c2,max1,max2:real;
	promedio:real; cant_fechas:integer;
begin 

	inivector(vE,vF);
	while (L <> nil) do begin 
		if (L^.data.anio - 2023) then 
			vE[L^.data.equipo]:= vE[L^.data.equipo] +1;
			
		puntoB(L^data.calificacion, promedio, cant_fechas);
		if (cant_fechas > 14) then 
			mayoresB(L^.data.codigo, max1,max2,c1,c2,promedio);
			
	L:= L^.sig;
	end;
	imprimir(vE);
var 
	L,L2:lista;
begin 
	L:= nil;
	L2:= nil;
	cargardatos(L); // se dispone
	procesardatos(L);
	armarlistaC(L,L2);
	
end;
