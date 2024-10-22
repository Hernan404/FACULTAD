{Un criadero de conejos está analizando ciclos de reproducción. El criadero cuenta con conejas
reproductoras y dispone de una estructura con la información de todas las conejas. De cada coneja se
tiene su código, año de nacimiento, especie (del 1 al 6), nombre, cantidad de partos (entre 1 y 10) y
cantidad de crías que tuvo en cada parto.
a) Realice una función que reciba la información de todas las conejas y retorne el número de especie que
tiene la mayor cantidad de conejas.
b) Realice un módulo que reciba la información de todas las conejas y retorne en una estructura
adecuada las conejas que tuvieron en total más de 35 crías.


Realice un módulo que reciba la estructura generada en b) e informe los nombres de las conejas con
código impar, nacidas antes del año 2020}



program EJ17P7;
const 
    especies = 6;
    partos = 10;
type 
    rango_especie = 1..especies;
    rango_partos = 1..partos;

    coneja = record 
        codigo: integer;
        nacimiento: integer;
        especie: rango_especie;
        nombre: string;
        cantPartos: rango_partos;
        cantCrias: array[1..partos] of integer; // Almacena la cantidad de crías por parto
    end;

    vespecie = array [rango_especie] of integer;

    lista = ^nodo;
    nodo = record 
        data: coneja;
        sig: lista;
    end;

procedure cargardatos(var L: lista); // se dispone
begin 
    // se dispone
end;

procedure armarlista2(var L2: lista; r: coneja);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L2;
    L2 := aux;
end;

function mayorCantidad(v: vespecie): integer;
var 
  i, max, p1: integer;
begin 
  max := -1;
  p1 := 0;
  for i := 1 to especies do 
  begin 
     if (v[i] > max) then 
     begin
        max := v[i];
        p1 := i;
     end;
  end;
  mayorCantidad := p1;
end;

function totalCrias(r: coneja): integer;
var
    i, total: integer;
begin
    total := 0;
    for i := 1 to r.cantPartos do
        total := total + r.cantCrias[i];
    totalCrias := total;
end;

procedure variaCrias(r: coneja; var L2: lista);
begin 
    if (totalCrias(r) > 35) then 
        armarlista2(L2, r);
end;

function cumple(codigo, nacimiento: integer): boolean;
begin 
    cumple := ((codigo mod 2) <> 0) and (nacimiento < 2020);
end;

procedure procesardatos(L: lista; var L2: lista);
var 
    v: vespecie;
    p1: integer;
begin 
    // Inicializar el vector de especies
    for p1 := 1 to especies do
        v[p1] := 0;

    while (L <> nil) do 
    begin 
        // a) Contar la cantidad de conejas por especie
        v[L^.data.especie] := v[L^.data.especie] + 1;

        // b) Armar la lista con conejas que tuvieron más de 35 crías en total
        variaCrias(L^.data, L2);

        L := L^.sig;
    end;

    // Imprimir la especie con mayor cantidad de conejas
    writeln('Especie con mayor cantidad de conejas: ', mayorCantidad(v));

    // Imprimir nombres de conejas que cumplen la condición
    while (L2 <> nil) do 
    begin 
        if (cumple(L2^.data.codigo, L2^.data.nacimiento)) then 
            writeln(L2^.data.nombre);
        L2 := L2^.sig;
    end;
end;

var 
    L, L2: lista;
begin 
    L := nil; 
    L2 := nil;
    cargardatos(L); // se dispone
    procesardatos(L, L2);
end.
