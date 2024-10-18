{Una empresa de distribución de electricidad necesita procesar la información de sus clientes. La
empresa dispone de una estructura con la información de sus clientes. De cada cliente tiene el código,
localidad, tipo (1: hogar, 2: club, 3: comercio, 4: centro educativo y 5: centro cultural) y cantidad de kW de
electricidad consumida en cada uno de los últimos 6 meses. La información está organizada por localidad.
Implementar un programa con:
a) Un módulo que reciba la estructura con la información de los clientes y retorne en otra
estructura la cantidad de clientes que hay para cada tipo.
b) Un módulo que reciba la estructura con la información de los clientes y retorne la localidad con
mayor cantidad de clientes.
c) Un módulo que reciba la estructura con la información de los clientes y retorne en otra
estructura adecuada los clientes que consumieron más de 1000 kW en los últimos 6 meses.
d) Un módulo que reciba la estructura generada en b) y que informe el domicilio de cada cliente
cuyo código tiene igual cantidad de dígitos pares que impares.}

program EJ16P7;
const 
  tipos = 5;
type 
  rango_tipos = 1..5;
  
  cliente = record 
    codigo: integer;
    localidad: string;
    tipo: rango_tipos;
    cantKW: real;
    domicilio: string;
  end;
  
  lista = ^nodo;
  nodo = record 
    data: cliente;
    sig: lista;
  end;
  
  vector = array [rango_tipos] of integer;
  
procedure insertar(var pri: lista; r: cliente);
var 
  ant, act, nue: lista;
begin 
  // Lógica de inserción en la lista enlazada
end;

procedure cargardatos(var L: lista); // se dispone
begin 
  // se dispone 
end;

procedure armarlista2(var L2: lista; r: cliente);
var 
  aux: lista;
begin 
  new(aux);
  aux^.data := r;
  aux^.sig := L2;
  L2 := aux;
end;

procedure inivector(var v: vector);
var 
  i: integer;
begin 
  for i := 1 to tipos do 
    v[i] := 0;
end;

procedure clientesTipo(r: cliente; var v: vector);
begin 
  v[r.tipo] := v[r.tipo] + 1;
end;

procedure generarListaMayorLocalidad(L: lista; var L2: lista);
var 
  localidadActual: string;
  max, cantCLientes: integer;
  aux: lista;
begin 
  max := -1;
  while (L <> nil) do 
  begin
    localidadActual := L^.data.localidad;
    cantCLientes := 0;
    aux := L;
    // Contar clientes en la localidad actual
    while (aux <> nil) and (aux^.data.localidad = localidadActual) do
    begin
      cantCLientes := cantCLientes + 1;
      aux := aux^.sig;
    end;
    
    // Si es la localidad con más clientes, se actualiza max y se crea la lista L2
    if (cantCLientes > max) then 
    begin
      max := cantCLientes;
      L2 := nil; // Reiniciamos la lista
      aux := L;
      while (aux <> nil) and (aux^.data.localidad = localidadActual) do
      begin
        armarlista2(L2, aux^.data);
        aux := aux^.sig;
      end;
    end;
    
    // Saltar a la siguiente localidad
    while (L <> nil) and (L^.data.localidad = localidadActual) do
      L := L^.sig;
  end;
end;

function cumplePares(cod: integer): boolean;
var 
  par, impar: integer;
begin 
  par := 0; 
  impar := 0;
  
  while (cod > 0) do 
  begin
    if (cod mod 2 = 0) then 
      par := par + 1
    else 
      impar := impar + 1;
    cod := cod div 10;
  end;
  cumplePares := (impar = par);
end;

procedure procesardatos(L: lista);
var 
  v: vector; 
  L2: lista;
begin 
  inivector(v);
  L2 := nil;
  
  // a)
  while (L <> nil) do 
  begin 
    clientesTipo(L^.data, v);
    L := L^.sig;
  end;
  
  // b) Generar estructura (lista) con clientes de la localidad con más clientes
  generarListaMayorLocalidad(L, L2);
  
  // d) Trabajar con la lista generada
  while (L2 <> nil) do 
  begin 
    if (cumplePares(L2^.data.codigo)) then 
      writeln(L2^.data.domicilio);
    L2 := L2^.sig;
  end;
end;

var 
  L: lista;
begin 
  L := nil; 
  cargardatos(L);
  procesardatos(L);
end.

