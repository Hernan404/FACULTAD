{La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes
realizados por una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el
código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1.
colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en
cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una
estructura de datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe
procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte}


program EJ14P6;
type 
	viaje = record 
		codigo:integer;
		dia:1..31;
		facultad:string;
		medio:1..5;
	end;

	lista = ^nodo;
	nodo = record
		data:viaje;
		sig:lista;
	end;

	vector = array [1..5] of integer;
	vdia = array [1..31] of integer;

procedure leer(var r:viaje);
begin 
	with r do begin 
		writeln('codigo');
		readln(codigo);
		if (r.codigo <> -1) then begin 
			writeln('dia del mes');
			readln(dia);
			writeln('facultad a la que pertenece');
			readln(facultad);
			writeln('medio de transporte');
			readln(medio);
		end;
	end;
end;

procedure armarnodo(var L:lista; r:viaje);
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
	r:viaje;
begin 
	leer(r);
	while (r.codigo <> -1) do begin 
		armarnodo(L,r);
		leer(r);
	end;
end;

procedure inivector (var v:vector; var vd:vdia; var vt:vector);
var 
	i:integer;
begin 
	for i:=1 to 5 do begin
		v[1]:= 90;
		v[2]:= 150;
		v[3]:= 30;
		v[4]:= 200;
		v[5]:= 300;
	end;

	for i:=1 to 31 do begin 
		vd[i]:= 0;
	end;

	for i:=1 to 5 do begin 
		vt[i]:= 0
	end;
end;

procedure mayor (vt:vector; var max1,max2,p1,p2:integer);
var 
	i:integer;
begin 
	for i:= 1 to 5 do begin 
		if(vt[i] > max1) then begin 
			max2:= max1;
			p2:= p1;
			max1:= vt[i];
			p1:= i;
		end
		else if (max1 > max2) then begin 
			max2:= vt[i];
			p2:= i;
		end;
	end;
end;

procedure procesardatos(L:lista);
var 
	v:vector; vt:vector; vd:vdia;
	ant:viaje;
	cantA,cantB,max1,max2,p1,p2,cantC:integer;
	i:integer;

begin
	cantA:= 0; cantB:= 0; cantC:= 0; max1:= -1; max2:= -1; p1:= 0; p2:= 0;
	inivector(v,vd,vt);
	ant.codigo:= 0;
	
	while(L <> nil) do begin 
		//PUNTO A
		vd[L^.data.dia]:= vd[L^.data.dia] +1;
		
		//PUNTO B
		if (v[L^.data.medio] > 80) then 
			cantB:= cantB +1;
			
		vt[L^.data.medio]:= vt[L^.data.medio] +1;
		
		//PUNTO C
		mayor(vt,max1,max2,p1,p2);
		
		//PUNTO D
		if (ant.codigo <> 0) and (L^.data.medio <> 5) and (ant.medio = 5) then
			cantC:= cantC +1;
			
		ant:= L^.data;
		L:=  L^.sig;
	end;
	
	
	for i:=1 to 31 do begin 
		if (vd[i] > 6) then
			cantA:= cantA +1;
	end;
	writeln('La cantidad de alumnos que realizan más de 6 viajes por día: ', cantA);
	writeln('La cantidad de alumnos que gastan en transporte más de $80 por día: ', cantB);
	writeln('Los dos medios de transporte más utilizados: ',p1,p2);
	writeln('La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte. ', cantC);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
