{La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial,
en la que corredores de todos los países participantes salen a correr en el mismo momento en distintos
puntos del planeta. La app registra, para cada corredor, el nombre y apellido, la distancia recorrida (en
kilómetros), el tiempo (en minutos) durante el que corrió, el país y la ciudad desde donde partió, y la
ciudad donde finalizó su recorrido. Realizar un programa que permita leer y almacenar toda la
información registrada durante la competencia. La lectura finaliza al ingresar la distancia -1. Una vez
que se han almacenado todos los datos, informar:
● La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos
los corredores.
● El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de
kilómetros recorridos por los corredores de esa ciudad.
● La distancia promedio recorrida por corredores de Brasil.
● La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
● El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston}

program EJ16P6;
type 
	corredor = record 
		nomyape:string;
		distancia:real;
		tiempo:real;
		pais:string;
		ciudad:string;
		ciudad_fin:string;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:corredor;
		sig:lista;
	end;
	
procedure leer (var r:corredor);
begin 
	with r do begin 
		writeln('NOMBRE Y APELLIDO');
		readln(nomyape);
		writeln('DISTANCIA RECORRIDA');
		readln(distancia);
		writeln('tiempo');
		readln(tiempo);
		writeln('PAIS');
		readln(pais);
		writeln('CIUDAD');
		readln(ciudad);
		writeln('CIUDAD DESTINO');
		readln(ciudad_fin);
	end;
end;

procedure crearLista (var L: Lista; r:corredor);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.data.pais < r.pais) do
          begin
              if (act^.data.pais = r.pais) then
                begin
                  while (act <> nil) and (act^.data.pais = r.pais) and (act^.data.ciudad < r.ciudad) do
                    begin
                      ant:= act;
                      act:= act^.sig;
                    end;
                end
              else
                begin
                  ant:= act;
                  act:= act^.sig;
                end;
          end;
        
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure cargardatos(var L:lista);
var 
	r:corredor;
begin 
	leer(r);
	while (r.distancia <> -1) do begin 
		armarnodo(L,r);
		leer(r);
	end;
end;

procedure puntoB (r:corredor; max:integer; suma_corredores:integer; var c1:string; var cantB:real);
begin 
	if (suma_corredores > max) then begin 
		max:= suma_corredores;
		c1:= ciudadACT;
		cantB:= suma_distancia;
	end;
end;

procedure procesardatos(L:lista);
var 
	total_corredores,total_distancia,total_tiempo:real;
	promedioC,promedioE,max,suma_corredores,suma_minutos,suma_distancia:real;
	c1:string;
	ciudadSF,ciudadACT,paisACT:string;
	cantB:integer;
	

begin 
	while (L <> nil) do begin 
		ciudadACT:= L^.data.ciudad; 
		paisACT:= L^.data.pais;

		while (L <> nil) and (ciudadACT = L^.data.ciudad) do begin 
			//PUNTO A
			suma_minutos + L^.data.tiempo;
			//PUNTO B
			suma_corredores:= suma_corredores +1;
			suma_distancia:= suma_distancia + L^.data.distancia;
			//PUNTO D 
			if (L^.data.ciudad <> L^.data.ciudad_fin) then 
				ciudadSF:= ciudadSF +1;

			L:=L^.sig;
		end;
		//PUNTO A
		total_distancia:= total_distancia + suma_distancia;
		total_corredores:= total_corredores + suma_corredores;
		total_tiempo:= total_tiempo + suma_minutos;

		//PUNTO B
		puntoB(L^.data,max,suma_corredores,c1,cantB);

		//PUNTO C 
		if (paisACT = 'brasil') then 
			promedioC:= suma_distancia/suma_corredores;

		//PUNTO E
		if (ciudadACT = 'boston') then 
			promedioE:= suma_distancia/suma_minutos;
	end;
	writeln('La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores: ', total_corredores, total_distancia, total_tiempo);
	writeln('El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de kilómetros recorridos por los corredores de esa ciudad: ', c1, cantB);
	writeln('La distancia promedio recorrida por corredores de Brasil: ', promedioC:2:0);
	writeln('La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad: ', ciudadSF);
	writeln('El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston: ', promedioE:2:0);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
