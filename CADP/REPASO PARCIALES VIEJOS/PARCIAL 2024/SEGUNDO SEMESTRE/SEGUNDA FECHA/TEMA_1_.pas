{se desea realizar un sitema para manejar albumes de figuritas (copa mundial de futbol) pertenecientes a 10 chicos. 
 de cada chico se conoce: apellido, nombre, una estructura para simular un album de 638 figuritas que permita 
 marcar si se tiene o no cada figurita, mas los datos de cada figurita y otra estructura para almacenar figuritas repetidas.
 de cada figurita se conoce: Numero de figurita (1..639), apellido y nombre de jugador, codigo de seleccion(1..32)

 A) realizar un modulo que cargue la informacion de los 10 chicos en una estructura. el album de cada chico arranca vacio
 (las 638 figuritas deben quedar marcadas como que no las tienen y sin datos de las figuritas), y su estructura de figuritas arranca vacia

 B) realizar un modulo que reciba una posicion X (1..10) y una estructura que represente un paquete con 5 figuritas. el modulo debe acceder 
 al chico de la posicion X y simular el pegado de las 5 figuritas en su album (cuando una figurita no esta en el album debe actualizar el dato que indica 
   que la tiene y guardar la figurita, si ya la tiene debe almacenarla en la estructura de las figuritas). 

 C) Realizar un modulo que reciba la estructura generada en A y retorne apellido, nombre del chico con mas figuritas repetidas. 

 D) realizar un modulo que reciba la estructura generada en A, y retorne cual es el codigo de seleccion que tiene menos figuritas repetidas entre los 10 chicos}




program AlbumFiguritas;

const
  chicos = 10;
  figuritas = 638; // El álbum tiene figuritas numeradas de 1 a 638
  seleccion = 32;  // Hay 32 selecciones

type
  rango_chicos = 1..chicos;
  rango_figuritas = 1..figuritas;
  rango_seleccion = 1..seleccion;

  figurita = record
    numero: rango_figuritas;
    apellidoYnombre: string;
    codigo: rango_seleccion;
  end;

  vtiene = array[rango_figuritas] of boolean; // Indica si se tiene o no cada figurita
  vfiguritas = array[1..5] of figurita;       // Paquete de 5 figuritas

  lista = ^nodo;
  nodo = record
    data: figurita;
    sig: lista;
  end;

  chico = record
    apellido: string;
    nombre: string;
    album: vtiene;
    repetidas: lista;
  end;

  vchicos = array[rango_chicos] of chico;

  vseleccion = array [rango_seleccion] of integer;

var
  vc: vchicos; // Vector de chicos

// Procedimiento para inicializar la estructura de datos de los chicos
procedure cargardatos(var vc: vchicos);
var
  i, j: integer;
begin
  for i := 1 to chicos do
  begin
    readln(vc[i].apellido);
    readln(vc[i].nombre);

    // Inicializar el álbum como vacío
    for j := 1 to figuritas do
      vc[i].album[j] := false;

    // Inicializar la lista de repetidas como NIL
    vc[i].repetidas := nil;
  end;
end;

// Procedimiento para agregar una figurita a la lista de repetidas
procedure agregarRepetida(var L: lista; f: figurita);
var
  aux: lista;
begin
  new(aux);
  aux^.data := f;
  aux^.sig := L;
  L := aux;
end;

procedure pegarfiguritas(num: rango_chicos; vp: vfiguritas; var vc: vchicos);
var
  i: integer;
begin
  for i := 1 to 5 do begin
    if (vc[num].album[vp[i].numero] = true) then begin
      L:= vc[num].repetidas;
      agregarRepetida(L, vp[i]);
    end
    else begin
      vc[num].album[vp[i].numero] := true;
    end;
  end;
end;

procedure chicoConMasRepetidas(vc: vchicos; var apellido, nombre: string);
var
  i, cant, max: integer;
  L: lista;
begin
  max := -1;

  for i := 1 to chicos do begin
    cantRepes := 0;
    L := vc[i].repetidas;

    while (L <> nil) do begin
      cantRepes := cantRepes + 1;
      L := L^.sig;
    end;

    if (cantRepes > max) then begin
      max := cantRepes;
      apellido := vc[i].apellido;
      nombre := vc[i].nombre;
    end;
  end;
end;

procedure seleccionConMenosRepetidas(vc: vchicos; vs:vseleccion; var codigo_min: rango_seleccion);
var
  i: integer;
  L: lista;
begin
  inivectorSele(vs);

  // Contar las repetidas por selección
  for i := 1 to chicos do begin
    L := vc[i].repetidas;

    while L <> nil do begin
      vs[L^.data.codigo] := vs[L^.data.codigo] + 1;

    L := L^.sig;
    end;
  end;

  // Encontrar el código de selección con menos repetidas
  min := 1;
  for i := 2 to seleccion do begin

    if (vs[i] < vs[min]) then
        min := i;
  end;
end;

var
  apellido, nombre: string;
  vs:vseleccion; vc:vchicos;
  codigo_min: rango_seleccion;
begin
  cargardatos(vc);

  chicoConMasRepetidas(vc, apellido, nombre);

  seleccionConMenosRepetidas(vc,vs, codigo_min);
end.





