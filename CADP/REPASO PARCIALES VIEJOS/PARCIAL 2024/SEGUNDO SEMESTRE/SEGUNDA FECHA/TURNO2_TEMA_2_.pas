{Un comercio necesita un programa para administrar la información de las ventas
 realizadas durante 2024. Se dispone de la información de las ventas. 
 De cada venta se conoce: número, fecha e información de los productos vendidos
 (de cada producto: código (1...150) y cantidades de unidades vendidas). Además, 
 se dispone de una tabla donde se almacena el precio unitario
 de cada uno de los 150 productos que vende el comercio.  

Se pide:  
**A.** Armar una estructura de datos que almacene número de venta y monto total, 
de cada venta con menos de 4 productos.  
**B.** Calcular e informar los números de las dos ventas más baratas.  
**C.** Calcular e informar el monto total promedio de las ventas con
número compuesto por, a lo sumo, dos dígitos impares.  

**Nota:** resolver A, B y C haciendo un solo recorrido de la estructura de ventas disponible.  }

program TURNO2_TEMA2;

const
  productos = 150;

type
  rango_productos = 1..productos;

  producto = record
    codigo: rango_productos;
    cantVendidas: integer;
  end;

  vProductos = array[rango_productos] of producto;

  venta = record
    numero: integer;
    fecha: integer;
    productos: vProductos;
    cantProductos: integer; // Número de productos vendidos en esta venta
  end;

  vPrecios = array[rango_productos] of real;

  lista = ^nodo;
  nodo = record
    data: venta;
    sig: lista;
  end;

var
  precios: vPrecios;

procedure cargarDatos(var L: lista); 
begin
  // Aquí iría la carga de datos.
end;

procedure armarLista(var L: lista; numVenta: integer; total: real);
var
  aux: lista;
begin
  new(aux);
  aux^.data.numero := numVenta;
  aux^.data.cantProductos := 0; // No necesitamos más datos para esta lista
  aux^.sig := L;
  L := aux;
end;

procedure calcularTotal(v: venta; precios: vPrecios; var total: real);
var
  i: integer;
begin
  total := 0;
  for i := 1 to v.cantProductos do
    total := total + (v.productos[i].cantVendidas * precios[v.productos[i].codigo]);
end;

procedure ventasMasBaratas(v: venta; total: real; var min1, min2: real; var p1, p2: integer);
begin
  if total < min1 then
  begin
    min2 := min1;
    p2 := p1;
    min1 := total;
    p1 := v.numero;
  end
  else if total < min2 then
  begin
    min2 := total;
    p2 := v.numero;
  end;
end;

function cumpleCondicion(num: integer): boolean;
var
  impares: integer;
begin
  impares := 0;
  while num <> 0 do
  begin
    if (num mod 10) mod 2 <> 0 then
      impares := impares + 1;
    num := num div 10;
  end;
  cumpleCondicion := impares <= 2;
end;

procedure procesarDatos(L: lista);
var
  total, sumaProm: real;
  min1, min2: real;
  p1, p2, cantProm: integer;
  nuevaLista: lista;
begin
  nuevaLista := nil;
  min1 := 99999;
  min2 := 99999;
  p1 := 0;
  p2 := 0;
  sumaProm := 0;
  cantProm := 0;

  while L <> nil do
  begin
    calcularTotal(L^.data, precios, total);

    // Punto A: Ventas con menos de 4 productos
    if L^.data.cantProductos < 4 then
      armarLista(nuevaLista, L^.data.numero, total);

    // Punto B: Ventas más baratas
    ventasMasBaratas(L^.data, total, min1, min2, p1, p2);

    // Punto C: Promedio de ventas con números compuestos por a lo sumo 2 dígitos impares
    if cumpleCondicion(L^.data.numero) then
    begin
      sumaProm := sumaProm + total;
      cantProm := cantProm + 1;
    end;

    L := L^.sig;
  end;

  writeln('Números de las dos ventas más baratas: ', p1, ' y ', p2);
  if cantProm > 0 then
    writeln('Monto promedio de las ventas con condición: ', sumaProm / cantProm:0:2)
  else
    writeln('No hay ventas que cumplan la condición.');
end;

begin
  cargarDatos(L);
  procesarDatos(L);
end.
