{Se desea realizar un sistema para manejar los álbumes de figuritas (copa mundial de Fútbol) pertenecientes a 15 chicos. 
De cada chico se conoce: apellido, nombre, una estructura para simular un álbum de 638 figuritas que permita marcar 
si se tiene o no cada figurita, más los datos de cada figurita y otra estructura para almacenar las figuritas repetidas. 
De cada figurita se conoce: Nro. figurita (1...638), apellido y nombre jugador, código de selección (1...32).

A) Realizar un módulo que cargue la información de los 15 chicos en una estructura. El álbum de cada chico arranca vacío (las 638 figuritas deben quedar marcadas como que no las tienen y sin datos de las figuritas), y su estructura de figuritas repetidas arranca vacía.
B) Realizar un módulo que reciba una posición X (1...15) y una estructura que represente un paquete con 6 figuritas. 
El módulo debe acceder al chico de la posición X y simular el pegado de las 6 figuritas en su álbum 
(cuando una figurita no está en el álbum debe actualizar el dato que indica que la tiene y guardar la figurita;
si ya la tiene debe almacenarla en la estructura de las figuritas repetidas).
C) Realizar el módulo que reciba la estructura generada en A y retorne el apellido, nombre del chico con menos figuritas en el álbum.
D) Realizar un módulo que reciba la estructura generada en A, y retorne cuál es el código de selección que tiene más figuritas repetidas entre los 15 chicos.}

program AlbumFiguritas;
const
  chicos = 15;
  figuritas = 638;
  seleccion = 32;
type
  rango_chicos = 1..chicos;
  rango_figuritas = 1..figuritas;
  rango_seleccion = 1..seleccion;

  figurita = record
    numero: rango_figuritas;
    apeynom: string;
    codigo: rango_seleccion;
  end;

  lista = ^nodo;
  nodo = record
    data: figurita;
    sig: lista;
  end;

  chico = record
    apellido: string;
    nombre: string;
    album: array[rango_figuritas] of boolean;
    repetidas: lista;
  end;

  vchico = array[rango_chicos] of chico;
  paquete = array[1..6] of figurita;
  vseleccion = array[rango_seleccion] of integer;

procedure cargardatos(var vc: vchico);
var
  i, j: integer;
begin
  for i := 1 to chicos do
  begin
    readln(vc[i].apellido);
    readln(vc[i].nombre);
    for j := 1 to figuritas do
      vc[i].album[j] := false;
    vc[i].repetidas := nil;
  end;
end;

procedure agregarRepetida(var L: lista; f: figurita);
var
  nuevo: lista;
begin
  new(nuevo);
  nuevo^.data := f;
  nuevo^.sig := L;
  L := nuevo;
end;

procedure pegarfigurita(posX: rango_chicos; p: paquete; var vc: vchico);
var
  i: integer;
begin
  for i := 1 to 6 do
  begin
    if not vc[posX].album[p[i].numero] then
      vc[posX].album[p[i].numero] := true
    else
      agregarRepetida(vc[posX].repetidas, p[i]);
  end;
end;

procedure menosfiguritas(vc: vchico; var apellido, nombre: string);
var
  i, j, min, cant: integer;
begin
  min := figuritas + 1; // Inicializamos con un valor mayor al máximo posible
  for i := 1 to chicos do
  begin
    cant := 0;
    for j := 1 to figuritas do
      if vc[i].album[j] then
        cant := cant + 1;
    if cant < min then
    begin
      min := cant;
      apellido := vc[i].apellido;
      nombre := vc[i].nombre;
    end;
  end;
end;

procedure masfiguritas(vc: vchico; var maxCod: rango_seleccion);
var
  i: integer;
  vsele: vseleccion;
  aux: lista;
begin
  for i := 1 to seleccion do
    vsele[i] := 0;
  for i := 1 to chicos do
  begin
    aux := vc[i].repetidas;
    while aux <> nil do
    begin
      vsele[aux^.data.codigo] := vsele[aux^.data.codigo] + 1;
      aux := aux^.sig;
    end;
  end;
  maxCod := 1;
  for i := 2 to seleccion do
    if vsele[i] > vsele[maxCod] then
      maxCod := i;
end;

var
  vc: vchico;
  p: paquete;
  apellido, nombre: string;
  maxCod: rango_seleccion;
begin
  cargardatos(vc);
  pegarfigurita(1, p, vc);
  menosfiguritas(vc, apellido, nombre);
  masfiguritas(vc, maxCod);
end.
