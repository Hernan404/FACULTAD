<{mplementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}


program EJ2P7;
type 
	poliza = 1..6;
	cliente = record 
		codigo:integer;
		DNI:integer;
		apellido:string;
		nombre:string;
		cod_poliza:poliza;
		monto:real;
	end;

	lista = ^nodo; 
	nodo = record
		data:cliente;
		sig:lista;
	end;

	vector = array [poliza] of integer;

procedure inivector (var v:vector);
begin 
	// se dispone por la talba de valor adicional;
end;

procedure leer(var r:cliente);
begin 
	with r do begin 
		readln(codigo);
		readln(DNI);
		readln(apellido);
		readln(nombre);
		readln(cod_poliza);
		readln(monto);
	end;
end;

procedure armarnodo (var L:lista; r:cliente);
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
	r:cliente;
begin 
	leer(r);
	repeat 
		armarnodo(L,r);
		leer(r);
	until (r.codigo = 1122);
end;

procedure imprimirA(montoAD:real; r:cliente);
begin 
	writeln('nombreA: 'r.nombre ,'apellido A', r.apellido ,'DNI A', r.DNI , 'MONTO ADICIONAL A', montoAD);
end;

procedure imprimirB(r:cliente);
begin 
	writeln('APELLIDO B', r.apellido , 'NOMBRE B', r.nombre);
end;

function cumpleB(dni:integer):boolean;
var 
	dig9:integer;
begin 
	dig9:= 0;

	while (dni > 0) do begin 
		dni:= dni mod 10;
		if (dni = 9) then 
			dig9:= dig9 +1;

		dni:= dni div 10;
	end;

	cumpleB:= (dig9 >= 2);

end;

procedure eliminar (var pri:lista; var exito:boolean);
var 
	ant, act: lista;
	cod:integer;
begin 
	exito:= false;
	writeln('ingrese codigo a eliminar');
	readln(cod);

    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.data.codigo <> cod) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesardatos(L:lista);
var 
	v:vector; montoAD:real;  exito:boolean;
begin 

	inivector(v);
	while (L <> nil) do begin 
		montoAD:= L^.data.monto + v[L^.data.cod_poliza];
		imprimirA(montoAD,L^.data);

		if (cumpleB(L^.data.DNI)) then 
			imprimirB(L^.data);

		
	L:=L^.sig;
	end;
	eliminar(L,exito);
end;


var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
