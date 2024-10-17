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
  // Definimos el registro para almacenar los datos de un cliente
  cliente = record
    dni: integer;   // DNI del cliente
    numero: integer;  // Número asignado en la lista de espera
  end;

  // Definimos una lista enlazada para almacenar la lista de espera de los clientes
  lista = ^nodo;
  nodo = record
    data: cliente;  // Datos del cliente
    sig: lista;     // Siguiente nodo en la lista
  end;

// Procedimiento para agregar un cliente al final de la lista
procedure armarlista(var L: lista; c: cliente);
var
  nuevo, aux: lista;
begin
  new(nuevo);           // Crear un nuevo nodo
  nuevo^.data := c;     // Asignar los datos del cliente
  nuevo^.sig := nil;    // El nuevo nodo apunta a nil, ya que será el último

  if L = nil then       // Si la lista está vacía, el nuevo nodo será el primero
    L := nuevo
  else begin            // Si la lista no está vacía, recorremos hasta el final
    aux := L;
    while aux^.sig <> nil do
      aux := aux^.sig;
    aux^.sig := nuevo;  // Insertar el nuevo nodo al final
  end;
end;

// Procedimiento para cargar datos de los clientes ingresados hasta que se lee un DNI 0
procedure cargardatos(var L: lista);
var
  c: cliente;
  num: integer;
begin
  num := 0;             // Iniciar el número de cliente en 0
  readln(c.dni);        // Leer el primer DNI
  while (c.dni <> 0) do begin  // Repetir hasta que se ingrese un DNI 0
    num := num + 1;     // Incrementar el número de espera
    c.numero := num;    // Asignar el número al cliente
    armarlista(L, c);   // Agregar el cliente a la lista
    readln(c.dni);      // Leer el siguiente DNI
  end;
end;

// Procedimiento para registrar un nuevo cliente en la lista de espera
procedure RecibirCliente(dni: integer; var L: lista);
var
  num: integer;
  c: cliente;
  aux: lista;
begin
  num := 0;
  aux := L;
  // Recorrer la lista para encontrar el último número asignado
  while (aux <> nil) do begin
    num := aux^.data.numero;
    aux := aux^.sig;
  end;
  c.dni := dni;         // Asignar el DNI del cliente
  c.numero := num + 1;  // Asignar el siguiente número en la lista de espera
  armarlista(L, c);     // Agregar el cliente a la lista
end;

// Procedimiento para atender al primer cliente en la lista de espera
procedure AtenderCliente(var L: lista);
var
  aux: lista;
begin
  if (L <> nil) then begin    // Verificar que la lista no esté vacía
    writeln('Atendiendo NUMERO: ', L^.data.numero, ' con DNI: ', L^.data.dni);
    aux := L;                 // Guardar referencia del nodo a eliminar
    L := L^.sig;              // Avanzar al siguiente cliente en la lista
    dispose(aux);             // Eliminar el nodo atendido
  end
  else
    writeln('No hay clientes en espera.');  // Mensaje cuando la lista está vacía
end;

var
  L: lista;
  dni: integer;
begin
  L := nil;              // Inicializar la lista como vacía
  cargardatos(L);        // Cargar los clientes iniciales

  // Registrar nuevos clientes hasta ingresar DNI 0
  writeln('Ingrese DNI del cliente a registrar (0 para no registrar más): ');
  readln(dni);
  while (dni <> 0) do begin
    RecibirCliente(dni, L);   // Llamar al procedimiento para registrar clientes
    readln(dni);
  end;

  // Atender a los clientes uno por uno
  writeln('Atendiendo a los clientes: ');
  while (L <> nil) do
    AtenderCliente(L);        // Atender clientes hasta que la lista esté vacía
end.



