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
    dni: integer;
    numero: integer;
  end;

  lista = ^nodo;
  nodo = record
    data: cliente;
    sig: lista;
  end;

procedure armarlista(var L: lista; c: cliente);
var
  nuevo, aux: lista;
begin
  new(nuevo);
  nuevo^.data := c;
  nuevo^.sig := nil;

  if L = nil then
    L := nuevo
  else begin
    aux := L;
    while aux^.sig <> nil do
      aux := aux^.sig;
    aux^.sig := nuevo;
  end;
end;


procedure cargardatos(var L: lista);
var
  c: cliente;
  num: integer;
begin
  num := 0;
  readln(c.dni);
  while (c.dni <> 0) do begin
    num := num + 1;
    c.numero := num;
    armarlista(L, c);
    leer(c);
  end;
end;

procedure RecibirCliente(dni: integer; var L: lista);
var
  num: integer;
  c: cliente;
begin
  num := 0;
  while (L <> nil) do begin
    num := L^.data.numero;
    L := L^.sig;
  end;
  c.dni := dni;
  c.numero := num + 1;
  armarlista(L, c);
end;

procedure AtenderCliente(var L: lista);
var
  aux: lista;
begin
  if (L <> nil) then begin
    writeln('Atendiendo NUMERO: ', L^.data.numero, ' con DNI: ', L^.data.dni);
    aux := L;
    L := L^.sig;
    dispose(aux);
  end
  else
    writeln('No hay clientes en espera.');
end;

var
  L: lista;
  dni: integer;
begin
  L := nil;
  cargardatos(L);

  writeln('Ingrese DNI del cliente a registrar (0 para no registrar más): ');
  readln(dni);
  while (dni <> 0) do begin
    RecibirCliente(dni, L);
    readln(dni);
  end;

  writeln('Atendiendo a los clientes: ');
  while (L <> nil) do
    AtenderCliente(L);
end.




