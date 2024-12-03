 {La COMBEBOL desea procesar informacion del torneo "copa america" entre paises
para ello, dispone de una estructura de datos con la informacion de cada pais 
que ha participado alguna vez del evento. de cada pais se conoce:
el nombre del pais, la cantidad de participantes en copas america e informacion 
de dichas participaciones (a lo sumo 10) de cada participacion se conoce
el año y en que instancia finalizo (1: fase de grupos, 2: cuartos de final, 3 semifinal, 4: final)

lea la informacion de un nuevo pais y la incorpore en la estructura de datos 
que se dispone. del nuevo pais se lee el nombre del pais, la cantidad de copas obtenidas, la 
cantidad de participaciones y la informacion de cada participacion (año y en que instancia finalizo en dicha participacion)

B. una vez cargado el nuevo pais procese los datos de todos los paises e informe 
1. para cada pais, la cantidad de participaciones realizadas en años anteriores al 1998 en las que 
superaron los octavos de final 
2. los nombres de los dos paises que llegaron mas veces a instancias de final 
3. el promedio de participantes en copas del mundo de todos los paises}

program copaAmerica;
const 
	maxParticipaciones = 10;
type 
	rango_instancias = 1..4;

	{tengo cantidad de participantes (a lo sumo 10) y la informacion de cada participante 
	hago un vector de registro para cada participante.
	}

	participacion = record 
		año:integer;
		instancia:rango_instancias;
	end;

	vector_participaciones = array [1..maxParticipaciones] of participacion; 
	
	pais = record 
		nombre:string;
		cantparticipaciones:integer;
		participacion:vector_participaciones;
	end;

	lista = ^nodo;
	nodo = record 
		data:pais;
		sig:lista;
	end;

procedure cargarpaises(L:lista); // se dispone

{leo los datos de participaciones y hago un for para saber
cuantas participaciones hay, porque son a lo sumo 10, }
procedure leerPais(r:pais);
var 
	i:integer;
begin 
	readln(r.nombre);
	readln(r.cantparticipaciones);
	for i:=1 to p.cantparticipaciones do begin 
		readln(r.participacion.año[i]);
		readln(r.participacion.instancia[i]);
	end; 
	{leo la info de participaciones la cantidad de veces que haya participacion}
end;

{agrego el pais leyendo los datos y agregando en la lista}
procedure agregarpais(var L:lista);
var 
	p:pais;
begin 
	leerPais(p);
	agregaradelante(L,p);
end;

procedure calcularParticipacion(var cant:integer; r:pais);  
var 
	cant,i:integer;
begin 
	cant:= 0;
	for i:=1 to r.cantparticipaciones do begin 
		if (r.participaciones[i].año < 2020) and (p.participaciones[i].instancia 1)
			cant:= cant +1;
	end;
end;

procedure procesardatos(L:lista);
var 
	cant:integer; cantB:integer;
	p1,p2:string;
	min1,min2:integer;
	cantPaises,cantparti:integer;
begin 
	p1:= ''; p2:= ''; 
	min1:= 9999; min2:= 9999; 
	cant:= 0; cantB:= 0;

	while (L <> nil) do begin 

		//PUNTO 1
		calcularParticipacion(cant,L^.data);
		writeln('EL pais ',L^.data.nombre, 'participo ',cant);

		//PUNTO 2 
		for i:=1 to L^.data.participantes do  begin
			if (L^.data.participantes[i].instancia = 4) then 
				cantB:= cantB +1;
		end;

		Minimos(cantB,L^.data.nombre,min1,min2,p1,p2);
  
		//PUNTO 3 
		cantPaises:= cantPaises +1;
		cantparti:= cantparti + L^.data.cantparticipaciones;
	end;
	writeln('PUNTO B ',p1,p2);
	writeln('PUNTO C ',cantparti/cantPaises);

end;
	
var 
	L:lista;
begin 
	cargarpaises(L); // se dispone 
	agregarpais(L);
	procesardatos(L);

end.
    
