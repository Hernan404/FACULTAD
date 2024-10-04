
{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
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

{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
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


procedure agregaradelante(var L:lista; s:sonda);
var 
  aux:lista;
begin 
  new(aux);
  aux^.data:= s;
  aux^.sig:= L;
  L:= aux;
end;

procedure leer(var s:sonda); 
begin 
  with s do begin
    readln(nombre);
    readln(duracion)
    readln(costo_con);
    readln(costo_man);
    readln(rango);
  end;
end;

procedure cargardatos(L:lista);
var 
  s:sonda;
begin 
  leer(s);
  repeat 
    agregaradelante(L,s);
    leer(s);
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

procedure incisos7(L:lista);
var 
  cantTotal:integer; 
  costoTotal:real; costo:real;
begin 
  cantTotal:= 0; costo:= 0; cantTotal:= 0;

  while (L <> nil) do begin 
      if (L^.data.costo_man < L^.data.costo_con) and (L^.data.sonda <> 1) then begin 
        writeln('SONDA CUMPLE')
        agregaradelante(L2,L^.data);
   
      else 
        writeln('SONDA NO CUMPLE')
        agregaradelante(L3,L^.data);
        cantTotal:= cantTotal +1;
        costoTotal:= L^.data.costo_con + L^.data.costo_man;
        costo:= costo + costoTotal;
  end;
end;

var 
  L:lista;
begin 
  L:= nil;
  L2:=nil;
  L3:=nil;

  cargardatos(L);
  procesardatos(L);
  incisos7(L,L2,L3);
end.

