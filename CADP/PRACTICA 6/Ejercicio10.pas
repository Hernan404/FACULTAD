{Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.}

program EJ10P6;
type 
	cliente = record 
		dni:integer;
		numero:integer;
	end; 

	lista = ^nodo;
	nodo = record 
		data:cliente;
		sig:lista;
	end;

procedure armarlista(var L:lista; r:cliente);
var 
	act,nue:lista;
begin 
	new(nue);
	nue^.data:= r;
	nue^.sig:= nil;

	if (L <> nil) then begin 
		act:= L;
		while (act^.sig <> nil) do begin 
			act:= act^.sig;
		act^.sig:= nue;
		end
		else 
			L:= nue;
	end;
end; 

procedure RecibirCliente(L:lista);
var 
	r:cliente;
	num:integer;
begin 
	num:= 0;
	readln(r.dni);
	while (r.dni <> 0) do begin 
		num:= num +1
		r.numero:= num; 
		armarlista(L,r);
		readln(r.dni);
	end;
end; 


procedure AtenderCLiente (L:lista);
var 
	aux:lista;
begin 
	while (L <> nil) do begin 
		writeln('CLIENTE A SER ATENDIDO: NUMERO:', L^.data.numero,'DNI: ', L^.data.dni)
		aux:= L;
	L:= L^.sig;
	dispose(aux);
	end;
end;

var 
	L:lista;
begin 
	L:= nil; 
	RecibirCliente(L);
	AtenderCLiente(L);
end.
