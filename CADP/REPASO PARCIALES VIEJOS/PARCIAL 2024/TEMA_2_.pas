{un fabricante de dispositivos electronicos desea procesar informacion de los repuestos que compro.
de cada repuesto conoce su codigo, precio, codigo de marca (entre 1 y 130) y nombre del pais del que proviene.
el fabricante dispone de una estructura de datos con la informacion de los repuestos, ordenados por nombre de
pais.
Realizar un progrma que:
	A. Lea el codigo y el nombre de las 130 marcas con las que trabaja, y las almacene en una estructura de 
	datos. la informacion se ingresa sin ningun orden particular.
	B. una vez completada la carga, procese la informacion de los repuestos e informe: 
		1. la cantidad de paises a los que se le compro mas de 100 repuestos
		2. para cada marca, nombre de la marca y el precio del producto mas barato
		3. la cantidad de repuestos que no poseen ningun cero en su codigo.}


program TEMA2;
const
  marcas = 130;

type
  rango_marcas = 1..marcas;
  
  repuesto = record
    codigo: integer;
    precio: real;
    cod_marca: rango_marcas;
    nombre_pais: string;
  end;
  
  lista = ^nodo;
  nodo = record
    data: repuesto;
    sig: lista;
  end;
  
  vMarcas = array[rango_marcas] of string;
  vCant = array[rango_marcas] of integer;
  vPrecios = array[rango_marcas] of real;

var
  L: lista;

procedure cargardatos(var L: lista); // Se dispone
begin
  // Implementación no provista
end;

procedure leer(var vm: vMarcas);
var
  i: integer;
begin
  for i := 1 to marcas do
  begin
    readln(vm[i]);
  end;
end;

procedure inivector(var vc: vCant);
var
  i: integer;
begin
  for i := 1 to marcas do
    vc[i] := 0;
end;

procedure cargarmarca(var L: lista; var vm: vMarcas);
begin
  leer(vm);
end;

function cumple3(cod: integer): boolean;
var
  cero: boolean;
begin
  cero := false;
  while (cod <> 0) do
  begin
    if ((cod mod 10) = 0) then
      cero := true;
    cod := cod div 10;
  end;
  cumple3 := not cero;
end;

procedure procesardatos(L: lista; var vm: vMarcas);
var
  vc: vCant;
  vp: vPrecios;
  cant3, i, paises100: integer;
  marcaActual: rango_marcas;
begin
  cant3 := 0;
  paises100 := 0;
  inivector(vc);
  for i := 1 to marcas do
    vp[i] := MaxInt;

  while (L <> nil) do
  begin
    marcaActual := L^.data.cod_marca;
    vc[marcaActual] := vc[marcaActual] + 1;

    if (vc[marcaActual] = 101) then
      paises100 := paises100 + 1;

    if (L^.data.precio < vp[marcaActual]) then
    begin
      vp[marcaActual] := L^.data.precio;
    end;

    if cumple3(L^.data.codigo) then
      cant3 := cant3 + 1;

    L := L^.sig;
  end;

  writeln('Cantidad de países con más de 100 repuestos:', paises100);
  for i := 1 to marcas do
    if vp[i] < MaxInt then
      writeln('Marca ', vm[i], ' - Precio más barato: ', vp[i]:0:2);
  writeln('Cantidad de repuestos sin ceros en su código:', cant3);
end;

begin
  L := nil;
  cargardatos(L); // Se dispone
  cargarmarca(L, vMarcas);
  procesardatos(L, vMarcas);
end.
