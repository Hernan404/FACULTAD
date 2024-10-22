{El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece:
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con
información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el
nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción.
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI}

program EJ12P7;
const 
	tipo = 4;
type 
	rango_tipo = 1..4;
	
	cliente = record 
		nombre:string;
		dni:integer;
		edad:integer;
		subscripcion:rango_tipo;
	end;
	
	
	lista = ^nodo;
	nodo = record 
		data:cliente;
		sig:lista;
	end;

	
		
	vector = array [rango_tipo] of integer;
	vcostos = array [rango_tipo] of real;
	

procedure armarlista(var L:lista; r:cliente);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;

procedure leer(var r:cliente);
begin 
	with r do begin 
		readln(nombre);
		readln(dni);
		readln(edad);
		readln(subscripcion);
	end;
end;

procedure cargardatos (var L:lista);
var 
	r:cliente;
begin 
	leer(r);
	while (r.dni <> 0) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

procedure armarlista2(var pri:lista; nombre:string; dni:integer);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data.nombre := nombre;
    nue^.data.dni:= dni;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.dni < dni) do //De menor a mayor
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

procedure masclientes(v:vector; var max1,max2,p1,p2:integer);
var 
	i:integer;
begin 
	for i:=1 to tipo do begin 
		if (v[i] > max1) then begin 
			max2:= max1;
			p2:= p1;
			max1:= v[i];
			p1:= i;
		end
		else if (max1 > max2) then begin 
				max2:= v[i];
				p2:= i;
		end;
	end;
end;

procedure cargarvector(var vc:vcostos); // se dispone
begin 
	// esta es la tabla que se dispone
end;

procedure inivector(var v:vector);
var 
	i:Integer;
begin 
	for i:=1 to tipo do begin 
		v[i]:= 0;
	end;
end;



procedure procesardatos(L,L2:lista);
var 
	v:vector; vc:vcostos; 
	ganancia_total:real; max1,max2,p1,p2:integer; 
begin 
	ganancia_total:= 0; max1:= -1; max2:= -1; p1:= 0; p2:= 0;
	cargarvector(vc); //se dispone
	inivector(v);
	while (L <> nil) do begin 
	
		ganancia_total:= vc[L^.data.subscripcion] + ganancia_total;
		
		v[L^.data.subscripcion]:= v[L^.data.subscripcion] +1;
		
		if (L^.data.edad > 40) and ((L^.data.subscripcion = 3) or (L^.data.subscripcion = 4)) then 
			armarlista2(L2,L^.data.nombre,L^.data.dni);
		
		L:= L^.sig;
	end;	
	masclientes(v,max1,max2,p1,p2);
	writeln('La ganancia total de Fortaco’s ', ganancia_total);
	writeln('Las 2 suscripciones con más clientes. ', p1, p2); 
	
end;

var 
	L2,L:lista;
begin 
	L:= nil;
	L2:= nil;
	cargardatos(L);
	procesardatos(L,L2);
end.
