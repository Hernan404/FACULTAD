{Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program EJ5P6;
type 
  datos = record 
    codigo: integer;
    descripcion: string;
    stockACT: integer;
    stockMIN: integer;
    precio: real;
  end;
  
  lista = ^nodo; 
  nodo = record 
    data: datos;
    sig: lista;
  end;

procedure leer(var r: datos);
begin 
  with r do begin 
    writeln('Ingrese el CODIGO:');
    readln(codigo);
    if (codigo <> -1) then begin
      writeln('Ingrese la DESCRIPCION:');
      readln(descripcion);
      writeln('Ingrese el STOCK ACTUAL:');
      readln(stockACT);
      writeln('Ingrese el STOCK MINIMO:');
      readln(stockMIN);
      writeln('Ingrese el PRECIO:');
      readln(precio);
    end;
  end;
end;

procedure armarnodo(var L: lista; r: datos);
var 
  aux: lista;
begin 
  new(aux);
  aux^.data := r;
  aux^.sig := L;
  L := aux;
end;

procedure cargardatos(var L: lista);
var 
  r: datos;
begin 
  leer(r);
  while (r.codigo <> -1) do begin 
    armarnodo(L, r);
    leer(r);
  end;
end;

function pares(num: integer): boolean;
var 
  par: integer;
begin 
  par := 0;
  
  while (num > 0) do begin 
    if ((num mod 10) mod 2 = 0) then 
      par := par + 1;
    num := num div 10;
  end;
  pares := (par >= 3);  // Verificamos si hay al menos 3 dígitos pares
end;

procedure minimos(r: datos; var min1, min2: real; var cod1, cod2: integer);
begin 
  if (r.precio < min1) then begin 
    min2 := min1;
    cod2 := cod1;
    min1 := r.precio;
    cod1 := r.codigo;
  end
  else if (r.precio < min2) then begin 
    min2 := r.precio;
    cod2 := r.codigo;
  end;
end;

procedure procesardatos(L: lista);
var 
  porcenA: real; 
  cod1, cod2: integer; 
  min1, min2: real; 
  cantproductos, cantBajoStock: integer;
begin 
  porcenA := 0;
  cod1 := 0;
  cod2 := 0;
  min1 := 999999;  // Valores iniciales altos para asegurar la comparación
  min2 := 999999;
  cantproductos := 0;
  cantBajoStock := 0;
  
  while (L <> nil) do begin 
    cantproductos := cantproductos + 1;
    
    // A - Contar productos con stock bajo
    if (L^.data.stockACT < L^.data.stockMIN) then 
      cantBajoStock := cantBajoStock + 1;
    
    // B - Descripción de productos con código con al menos 3 dígitos pares
    if (pares(L^.data.codigo)) then 
      writeln('Descripción de producto con código compuesto por al menos tres dígitos pares: ', L^.data.descripcion);
    
    // C - Buscar los dos productos más económicos
    minimos(L^.data, min1, min2, cod1, cod2);
    
    L := L^.sig;
  end;
  
  // Calcular el porcentaje
  if (cantproductos > 0) then
    porcenA := (cantBajoStock / cantproductos) * 100
  else
    porcenA := 0;
  
  writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo: ', porcenA:0:2, '%');
  writeln('Código de los dos productos más económicos: ', cod1, ' y ', cod2);
end;

var 
  L: lista;
begin 
  L := nil;
  cargardatos(L);
  procesardatos(L);
end.

