La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrera.
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor)



program EJ11P6;
type 
	datos = record 
		codigo:integer;
		apellido:string;
		promedio:real;
	end;

	lista = ^nodo; 
	nodo = record 
		data:datos;
		sig:lista;
	end;

procedure leer(var r:datos);
begin 
	with r do begin
		writeln('codigo');
		readln(codigo);
		if (codigo <> 0) then begin  
			writeln('apellido');
			readln(apellido);
			writeln('promedio');
			readln(promedio);
		end;
	end;
end;

procedure armarnodo(L:lista; r:datos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;  
end;

Procedure insertarordenado ( var pri: lista; var r:datos);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data:= r;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.promedio > r.promedio) do //De mayor a menor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure cargardatos(L:lista);
var 
	r:datos;
begin 
	leer(r);
	while (r.codigo <> 0) do begin 
		armarnodo(L,r);
		leer(r);
	end;
end;


procedure procesardatos(L:lista);
var 
	r:datos;
	L2:lista;
	max:real;
	cant:integer;
begin
	L2:= nil;
	max:= -1;
	cant:= 0;
	while (L <> nil) do begin 
		
		if (L^.data.promedio > max) and (cant >= 10) then begin 
 			max:= L^.data.promedio;
			insertarordenado(L2,L^.data);
			cant:=cant +1;
			L:=L^.sig;
		end;
	end;
	while (L2 <> nil) do begin 
		writeln('EGRESADOS CON MEJOR PROMEDIO');
		writeln('NUMERO: ', L2^.data.codigo);
		writeln('APELLIDO: ', L2^.data.apellido);
		L2:= L2^.sig;
	end;
end;

var 
	L:lista;
begin 
	L:=nil;
	cargardatos(L);
	procesardatos(L);
end.
 
