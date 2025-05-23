{El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
anterior, se han determinado los siguientes criterios:
- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
desde la superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
H2020. Para ello, utilice el módulo realizado en b}

program EJ6Y7P6;
const 
  categorias = 7;
type 
  rango_categorias = 1..7;

  sonda = record 
    nombre: string;
    duracion: integer;
    costo_con: real;
    costo_man: real;
    rango: rango_categorias;
  end;

  lista = ^nodo;
  nodo = record 
    data: sonda;
    sig: lista;
  end;

  vector = array [rango_categorias] of integer;

// Inicializar vector a cero
procedure inivector(var v: vector);
var
  i: integer;
begin
  for i := 1 to categorias do
    v[i] := 0;
end;

procedure agregaradelante(var L: lista; s: sonda);
var 
  aux: lista;
begin 
  new(aux);
  aux^.data := s;
  aux^.sig := L;
  L := aux;
end;

procedure leer(var s: sonda); 
begin 
  with s do begin
    readln(nombre);
    readln(duracion);
    readln(costo_con);
    readln(costo_man);
    readln(rango);
  end;
end;

procedure cargardatos(var L: lista);
var 
  s: sonda;
begin 
  leer(s);
  repeat 
    agregaradelante(L, s);
    leer(s);
  until (s.nombre = 'GAIA');
end;

procedure puntoA(var max: real; var p1: string; costoTotal: real; nombre: string);
begin 
  if (costoTotal > max) then begin
    max := costoTotal;
    p1 := nombre;
  end;
end;

procedure calcularpromedio(promedioDuracion, promedioCostos: real; var cantC: integer; L: lista);
begin 
  while (L <> nil) do begin 
    if (L^.data.costo_con > promedioCostos) then
      writeln('PUNTO D ', L^.data.nombre);
    if (L^.data.duracion > promedioDuracion) then 
      cantC := cantC + 1;
    L := L^.sig;
  end;
end; 

procedure procesardatos(L: lista);
var 
  v: vector;
  promedio: real;
  costoTotal, duracionTotal: real;
  cantC, cant: integer;
  promedioDuracion, promedioCostos, max: real;
  p1: string;
  i: integer;
begin
  p1 := '';
  max := -1;
  cant := 0;
  costoTotal := 0;
  duracionTotal := 0;
  cantC := 0;
  inivector(v);

  while (L <> nil) do begin 
    // PUNTO A
    costoTotal := L^.data.costo_man + L^.data.costo_con;
    puntoA(max, p1, costoTotal, L^.data.nombre);

    // PUNTO B
    v[L^.data.rango] := v[L^.data.rango] + 1;

    // CONTADOR PARA PROMEDIOS
    cant := cant + 1;

    // PUNTO C 
    duracionTotal := duracionTotal + L^.data.duracion;

    L := L^.sig;
  end;
  promedioCostos := costoTotal / cant;
  promedioDuracion := duracionTotal / cant;

  calcularpromedio(promedioDuracion, promedioCostos, cantC, L);

  writeln('El nombre de la sonda más costosa: ', p1);
  for i := 1 to categorias do 
    writeln('Cantidad de sondas en rango ', i, ': ', v[i]);
  writeln('Cantidad de sondas que superan la duración promedio: ', cantC);
end;

procedure incisos7(L: lista; var L2, L3: lista);
var 
  cantTotal: integer; 
  costoTotal, costo: real;
begin 
  cantTotal := 0;
  costo := 0;

  while (L <> nil) do begin 
    if (L^.data.costo_man <= L^.data.costo_con) and (L^.data.rango <> 1) then begin 
      writeln('SONDA CUMPLE');
      agregaradelante(L2, L^.data);
    end else begin 
      writeln('SONDA NO CUMPLE');
      agregaradelante(L3, L^.data);
      cantTotal := cantTotal + 1;
      costoTotal := L^.data.costo_con + L^.data.costo_man;
      costo := costo + costoTotal;
    end;
    L := L^.sig;
  end;
end;

var 
  L, L2, L3: lista;
begin 
  L := nil;
  L2 := nil;
  L3 := nil;

  cargardatos(L);
  procesardatos(L);
  incisos7(L, L2, L3);
end.
