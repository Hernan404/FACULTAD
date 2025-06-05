program SEGUNDA_FECHA_T2;
const 
  libros = 150;
type 
  rango_libros = 1..libros;

  vlibro = array [rango_libros] of integer;  // Moved before prestamo record

  prestamo = record 
    numero:integer;
    fecha:integer;
    info:vlibro;
  end;

  lista = ^nodo;
  nodo = record 
    data:prestamo;
    sig:lista;
  end;

  lista2 = ^nodo2;
  nodo2 = record 
    numero:integer;
    total:real;
    sig:lista2;  // Changed to lista2
  end; 

  vvalor = array [rango_libros] of real; 

procedure cargardatos(var L:lista); // se dispone 
begin
  // Implementation not provided
end;

function cumpleDistintos(v:vlibro):boolean;
var 
  i, cant:integer;
begin 
  cant:= 0;
  for i:=1 to libros do 
    if (v[i] > 0) then
      cant:= cant +1; 
  cumpledistintos:= (cant < 4);
end;

procedure calcularTotal(v:vlibro; vv:vvalor; var total:real);  // Added parameters
var 
  i:integer;
begin 
  total := 0;  // Initialize total
  for i:=1 to libros do 
    total:= total + (v[i] * vv[i]);  // Multiply quantity by value
end;

procedure armarlista2 (var L2:lista2; numero:integer; total:real);  // Added var
var 
  aux:lista2;
begin 
  new(aux);
  aux^.numero:= numero;
  aux^.total:= total;
  aux^.sig:= L2;  // Fixed assignment
  L2:= aux; 
end;

procedure puntoB(vv:vvalor; numero:integer; var min1,min2:real; var p1,p2:integer);
begin 
  if (numero < min1) then begin 
    min2:= min1;
    p2:= p1;
    min1:= numero;
    p1:= numero;
  end 
  else if (numero < min2) then begin  
    min2:= numero;
    p2:= numero;
  end; 
end;

function cumplePar(numero:integer):boolean;
var 
  impar:integer;
begin 
  impar:= 0;
  while (numero > 0) do begin 
    if (numero mod 10 mod 2 = 1) then 
      impar:= impar +1;
    numero:= numero div 10;
  end;
  cumplePar:= (impar <= 2);
end;

procedure calculoprom(vv:vvalor; var prom:real; var cant:integer);  // Added cant parameter
var 
  i:integer;
begin 
  prom := 0;
  for i:=1 to libros do 
    prom:= prom + vv[i];
  if libros > 0 then
    prom := prom / libros;
  cant := cant + 1;
end;

procedure procesardatos(L:lista; vv:vvalor);  // Added vv parameter
var 
  L2:lista2;
  total:real;
  min1, min2:real;
  p1, p2:integer;
  prom, promedio:real;
  cantpromedio:integer;
begin 
  L2 := nil;
  min1 := MaxInt;
  min2 := MaxInt;
  p1 := 0;
  p2 := 0;
  cantpromedio := 0;
  promedio := 0;
  
  while (L <> nil) do begin 
    if cumpleDistintos(L^.data.info) then begin 
      calcularTotal(L^.data.info, vv, total); 
      armarlista2(L2, L^.data.numero, total);
    end; 

    puntoB(vv, L^.data.numero, min1, min2, p1, p2);
    
    if (cumplePar(L^.data.numero)) then 
      calculoprom(vv, prom, cantpromedio);

    L:= L^.sig;
  end;

  if cantpromedio > 0 then
    promedio := promedio / cantpromedio;

  writeln('Los dos préstamos con menor valor son: ', p1, ' y ', p2);
  writeln('El promedio es: ', promedio:0:2);
end;

var 
  L:lista;
  vv:vvalor;
begin 
  L:= nil; 
  // Initialize vv with book values (should be done here or in another procedure)
  
  cargardatos(L); // se dispone
  procesardatos(L, vv);
end.
