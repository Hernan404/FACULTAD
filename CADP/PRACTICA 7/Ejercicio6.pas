
El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos 
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7), 
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su 
descubrimiento. 

A. Desarrolle un programa que lea y almacene la información de los objetos que han sido 
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe 
procesarse). La estructura generada debe mantener el orden en que fueron leídos los datos.

B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:

1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que 
impares


program EJ6P7;

type
  rangoCategoria = 1..7;

  objetos = record
    codigo: integer;
    categoria: rangoCategoria;
    nombre_planeta: string;
    distancia: integer;
    nombre_descubridor: string;
    aniodesc: integer;
  end;

  vector = array [rangoCategoria] of integer;

  lista = ^nodo;
  nodo = record
    datos: objetos;
    sig: lista;
  end;

procedure leer(var o: objetos);
begin
  with o do
  begin
    readln(codigo);
    readln(categoria);
    readln(nombre_planeta);
    readln(distancia);
    readln(nombre_descubridor);
    readln(aniodesc);
  end;
end;

procedure armarnodo(var pri: lista; o: objetos);
var
  act, aux: lista;
begin
  new(aux);
  aux^.datos := o;
  aux^.sig := nil;
  if (pri <> nil) then
  begin
    act := pri;
    while (act^.sig <> nil) do
      act := act^.sig;
    act^.sig := aux;
  end
  else
    pri := aux;
end;

procedure inivector(var v, vc: vector);
var
  i: rangoCategoria;
begin
  for i := 1 to 7 do
  begin
    v[i] := 0;
    vc[i] := 0;
  end;
end;

procedure cargarlista(var L: lista);
var
  o: objetos;
begin
  leer(o);
  while (o.codigo <> -1) do
  begin
    armarnodo(L, o);
    leer(o);
  end;
end;

procedure punto1(var o: objetos; var cumplemax2, cumplemax1: integer; var max1, max2: integer);
begin
  if (o.distancia > max1) then
  begin
    max2 := max1;
    cumplemax2 := cumplemax1;
    cumplemax1 := o.codigo;
    max1 := o.distancia;
  end
  else if (o.distancia > max2) then
  begin
    max2 := o.distancia;
    cumplemax2 := o.codigo;
  end;
end;

function cumple2(o: objetos): boolean;
begin
  cumple2 := (o.nombre_descubridor = 'galileo galilei') and (o.aniodesc < 1600);
end;

function punto4(o: objetos): boolean;
var
  digitos, par: integer;
begin
  par := 0;

  while (o.codigo <> 0) do
  begin
    digitos := o.codigo mod 10;
    if (digitos mod 2 = 0) then
      par := par + 1;
    o.codigo := o.codigo div 10;
  end;

  punto4 := (par > (8 - par));
end;

procedure procesarLista(L: lista);
var
  vc: vector;
  v: vector;
  {o: objetos;}
  max1, max2: integer;
  cantcumple2: integer;
  cumple4: string;
  cumplemax1: integer;
  cumplemax2: integer;
  i: integer;
begin
  cantcumple2 := 0;
  max1 := -1;
  max2 := -1;
  cumplemax1 := 0;
  cumplemax2 := 0;

  inivector(v, vc);
  while (L <> nil) do
  begin
    vc[L^.datos.categoria] := vc[L^.datos.categoria] + 1;

    punto1(L^.datos, cumplemax1, cumplemax2, max1, max2);

    if (cumple2(L^.datos)) then
      cantcumple2 := cantcumple2 + 1;

    if (punto4(L^.datos)) then
      cumple4 := L^.datos.nombre_planeta;

    L := L^.sig;
  end;

  writeln('Los códigos de los dos objetos más lejanos son: ', cumplemax1, ' ', cumplemax2);
  writeln('La cantidad de planetas descubiertos por Galileo Galilei antes del año 1600 es: ', cantcumple2);
  for i := 1 to 7 do
    writeln('La cantidad de objetos en la categoría ', i, ': ', vc[i]);
  writeln('El nombre de las estrellas con más dígitos pares que impares: ', cumple4);
end;

var
  L: lista;
begin
  L := nil;
  cargarlista(L);
  procesarLista(L);
end.

