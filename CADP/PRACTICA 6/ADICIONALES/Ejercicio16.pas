program EJ16P6;
type 
    corredores = record 
        nombreYapellido:string;
        distancia:real;
        tiempo:real;
        PYC_inicio:string;
        PYC_fin:string;
    end;

    lista = ^nodo;
    nodo = record 
        data:corredores;
        sig:lista;
    end;

procedure armarlista (L:lista; c:corredores);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= c;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargarlista (L:lista,c:corredores);
begin 
    while (c.distancia <> -1) do begin 
        leer(c);
        cant:= cant +1;
        distanciaTotal:= distanciaTotal + a.distancia
        armarlista(L,c);
    end;
end;

function puntoB (cant:integer):boolean;
var 
    max:integer;
begin 
    max:= -1;
    if (cant > max) then 
        max:= cant 
        puntoB:= true;
end;

procedure procesarDatos (L:lista);
var 
    cant,cantcumpleD:integer;
    promedioC,promedioE,distanciaTotal,tiempoTotal:real;
    cumpleB:string;

begin 
    cant:= 0;
    distanciaTotal:= 0;
    tiempoTotal:= 0;
    promedio:= 0;
    promedioC:= 0;
    promedioE:= 0;

    while (L <> nil) do begin 
        cant:= cant +1;
        distanciaTotal:= distanciaTotal + L^.data.distancia
        tiempoTotal:= tiempoTotal + L^.data.tiempo;
        
        if puntoB(cant) then 
            cumpleB:= L^.data.PYC_inicio;
        
        if (L^.data.PYC_inicio = 'brasil') then 
            promedioC:= promedioC + L^.data.distancia;
        
        if (L^.data.PYC_inicio <> L^.data.PYC_fin) then 
            cantcumpleD:= cantcumpleD +1;
        
        if (L^.data.PYC_inicio = 'boston') then 
            promedioE:= promedioE + L^.data.tiempo;
        
    end;    
    writeln ('punto A: ', cant , distanciaTotal, tiempoTotal);
    writeln ('punto B: ', cumpleB)
    writeln ('punto C: ', promedioC/distanciaTotal);
    writeln ('punto D: ', cantcumpleD);
    writeln ('punto E: ', promedioE/tiempoTotal);
end;

var 
    cant:integer;
    c:corredores;
    L:lista;
begin 
    cant:= 0;
    L:= nil;
    cargarlista(L);
    procesarDatos(L);
end.


{6. La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial,
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

procedure armarnodo(var L:lista; r:corredor);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
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

procedure puntoB (r:corredor; var max:real; var n1:string; var canttotalB:real; var cant_total,distancia_total:integer);
begin 
		if (cant_total > max) then begin  
			max:= cant_total;
			n1:= r.ciudad;
			canttotalB:= distancia_total;
		end;
end;

procedure procesardatos(L:lista);
var 
	cant_total:integer; distancia_total,tiempo_total:real; max,canttotalB:real; promedioC:real; 
	cantD:integer; promedioE:real; n1:string; ciudadANT:corredor; cant:integer; cantboston,cantbrasil:integer;
begin 
	cantboston:= 0; cantbrasil:= 0;
	ciudadANT.ciudad:= '';
	cant_total:= 0; distancia_total:= 0; tiempo_total:= 0; max:= -1; canttotalB:= 0;
	promedioC:= 0; cantD:= 0; promedioE:= 0; 
	while (L <> nil) do begin 
		
		//PUNTO A
		cant_total:= cant_total +1;
		distancia_total:= distancia_total + l^.data.distancia;
		tiempo_total:= tiempo_total + L^.data.tiempo;
		
		//PUNTO B
			puntoB(L^.data,max,n1,canttotalB,cant);
		
		//PUNTO C
		if (L^.data.pais = 'brasil') then begin 
			promedioC:= L^.data.distancia + promedioC;
			cantbrasil:= cantbrasil +1;
		end;
		
		//PUNTO D	
		if (L^.data.ciudad <> L^.data.ciudad_fin) then 
			cantD:= cantD +1;
			
		//PUNTO E
		if (L^.data.ciudad = 'boston') then begin 
			promedioE:= promedioE + L^.data.tiempo;
			cantboston:= cantboston +1;
		end;
			
		ciudadANT:= L^.data;
		L:= L^.sig;
				
	end;
	writeln('La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores: ', cant_total, distancia_total, tiempo_total);
	writeln('El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de kilómetros recorridos por los corredores de esa ciudad: ', n1, canttotalB);
	writeln('La distancia promedio recorrida por corredores de Brasil: ', promedioC/cantbrasil:2:0);
	writeln('La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad: ', cantD);
	writeln('El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston: ', promedioE/cantboston:2:0);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
