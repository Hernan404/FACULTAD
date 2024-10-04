{La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}
program EJ6P6;
const 
  categorias = 7
type 
  rango_categorias = 1..7;

  sonda = record 
    nombre:string;
    duracion:integer;
    costo_con:real;
    costo_man:real;
    rango:rango_categorias;
  end;

  lista = ^nodo;
  nodo = record 
    data:sonda;
    sig:lista;
  end;

  vector = array [rango_categorias] of integer;

procedure cargardatos(L:lista);
var 
  s:sonda;
begin 
  leer(s);
  repeat 
    leer(s);
    agregaradelante(L,s);
  until (s.nombre = 'GAIA');
end;

procedure puntoA(var max:real; var p1:string; costoTotal:real; nombre:string);
begin 
  if (costoTotal > max) then 
    max:= costoTotal;
    p1:= nombre;
end;

procedure calcularpromedio(promedioDuracion,promedioCostos:real; cantC:integer; L:lista);
begin 
  while (L <> nil) do begin 
  
      if (L^.data.costo_con > promedio) then
          writeln('PUNTO D', L^.data.nombre);
      if (L^.data.duracion > promedioDuracion) then 
          cantC:= cantC +1;
  end;
end; 

procedure procesardatos(L:lista);
var 
  v:vector;
  promedio:real;
  costoTotal:real; duracionTotal:real; cantC:integer;
  promedioDuracion,promedioCostos:real;
  cant:integer; max:real; p1:string;
begin
  p1:= '';
  max:= -1; cant:= 0;
  costoTotal:= 0; duracionTotal:= 0; cantC:= 0;
  promedioDuracion:= 0; 
  inivector(v);

  while (L <> nil) do begin 
      
      //PUNTO A
      costoTotal:= L^.data.costo_man + L^.data.costo_con;
      puntoA(max,p1,costoTotal,L^.data.nombre);

      //PUNTO B
      v[L^.data.rango]:= v[L^.data.rango] +1;

      //CONTADOR PARA PROMEDIOS
      cant:= cant +1;

      //PUNTO C 
      duracionTotal:= duracionTotal + L^.data.duracion;
  end;
  promedioCostos:= costoTotal/cant;
  promedioDuracion:= duracionTotal/cant;

  calcularpromedio(promedioDuracion,promedioCostos,cantC,L);

  writeln('El nombre de la sonda más costosa ',p1);
  for i:=1 to categorias do 
    writeln('La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.', v[i]);
  writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.', cant);
end;

var 
  L:lista;
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
end;

