{ TERCERA FECHA 2022

 Un supermercado necesita analizar la información de las compras realizadas en el último año para reposición de stock.

 a) Realizar un módulo que cargue en una estructura de datos adecuada la información de las compras. De cada compra se conoce 
 el monto abonado, el mes en que se realizó la compra, la cantidad de productos comprados y el nombre del proveedor. 
 Por cada proveedor puede haber más de una compra. La información de las compras debe quedar ordenada por nombre de proveedor.
 La lectura finaliza al ingresar la compra con monto -1 que no debe procesarse.

b) Realizar un programa que utilice la información generada en el inciso a) e informe:

i) Los nombres de los proveedores para los cuales el monto total facturado superó los 30.000 pesos.

ii) Los dos meses en los que se realizaron mayor cantidad de compras.

iii) El monto promedio de las compras realizadas durante el mes de julio}

program TERCERA_FECHA_2022;
const 
  meses = 12;
type 
  rango_meses = 1..meses;

  compra = record 
    monto:real;
    mes:rango_meses;
    cantProductos:integer;
    nombre:string;
  end; 


  lista = ^nodo;
  nodo = record 
    data:compra;
    sig:lista;
  end; 

  vmes = array [rango_meses] of real; 


Procedure armarlista (var pri: lista; r:compra);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := per;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.nombre < r.nombre) do
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end; 

procedure leer(var r:compra);
begin 
  with r do begin 
    readln(monto);
    readln(mes);
    readln(cantProductos);
    readln(nombre);
  end; 
end;

procedure cargardatos(L:lista);
var 
  r:compra;
begin 
  leer(r);
  while (r.monto <> -1) do begin 
      armarlista(L,r);
      leer(r);
  end;
end;

procedure datameses(vm:vmes; var max1,max2:real; var m1,m2:integer);
var 
  i:integer;
begin 
  for i:=1 to meses do begin 
    if (vm[i] > max) then begin 
        max2:= max1;
        m2:= m1;
        max1:= vm[i];
        m1:= i;
    end
    else if (vm[i] > max2) then begin 
        max2:= v[i];
        m2:= i;
    end; 
  end;
end; 

procedure procesardatos(L:lista);
var 
  total:real; vm:vmes; totalMonto,max1,max2:real; m1,m2,comprasJulio:integer;
begin 
  max1:= -1; max2:= -1; m1:= 0; m2:= 0;
  totalMonto:= 0; promedio:= 0; comprasJulio:= 0; 
  while (L <> nil) do begin 
    totalMonto:= L^.data.monto + totalMonto;

    if (L^.data.nombre > 30.000) then 
      writeln(L^.data.nombre);

    vm[L^.data.mes]:= vm[L^.data.mes] +1; 

    if (L^.data.mes = 6) then 
      comprasJulio:= comprasJulio + L^.data.monto:
  
  L:= L^.sig; 
  end; 
  mesMascompras(vm,max1,max2,m1,m2);
  writeln(m1,m2);
  promedio:= totalMonto/comprasJulio:2:0;
  writeln(promedio);
end;

var 
  L:lista;
begin 
  L:= niL;
  cargardatos(L);
  procesardatos(L);
end. 


{ DESCONOCIDO

La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial. Para ello, 
la cátedra DISPONE de un listado con todos alumnos que ingresaron este año a la facultad. De cada alumno se conoce su DNI, nombre y apellido, 
nota obtenida en curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y si estuvo presente o ausente en cada una de las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de datos que contenga sólo aquellos alumnos que podrán rendir el parcial.
Para poder rendir el parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.

b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla:

1. Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso

2. Turno con mayor cantidad de alumnos en condiciones de rendir el examen.

3. Cantidad de alumnos que no posean ningún dígito cero en su DNI.

NOTA: Implementar el programa principal}

program INGRESANTES;
const 
  notas = 10;
  turnos = 4;
  clases = 12;
type 
  rango_notas = 1..notas;
  rango_turnos = 1..turnos;
  rango_clases = 1..clases;

  alumno = record 
    dni:integer;
    nombreYapellido:string;
    nota:rango_notas;
    turno:rango_turnos;
    presente:rango_clases;
  end;

  lista = ^nodo;
  nodo = record 
    data:alumno;
    sig:lista;
  end; 

  vasistencia = array [rango_clases] of boolean;

  vt:vturno = array [rango_turnos] of integer;

procedure cargardatos(L:lista); //se dispone 

procedure armarlista2(var L2:lista; r:alumno);
var 
  aux:lista;
begin 
  new(aux); 
  aux^.data:= r;
  aux^.sig:= L;
  L:= aux;
end; 

procedure evaluarAsistencia(L,L2:lista);
var 
  va:vasistencia; cantAsis:integer; 
begin 
    cantAsis:= 0;
    while (L <> nil) do begin 
      for i:=1 to asistencias do begin 
        if (L^.data.presente[i] = true) then 
          cantAsis:= cantAsis +1;
      end; 

      if (cantAsis >= 8) then 
        armarlista2(L2,L^.data);
    end;
end;

procedure masEstudiantes(vt:vturno; var max,p1:integer)
var 
  i:rango_turnos;
begin 
  for i:= 1 to turnos do begin 
    if (vt[i] > max) then begin 
      max:= vt[i];
      p1:= i;
     end;
  end; 
end; 

function cumple (dni:integer):boolean;
var 
  ceros:boolean;
begin 
  ceros:= false;
  while (dni > 0) do begin 
    if (num mod 10 = 0) then 
      ceros = true;

    dni:= dni div 10;
  end; 

  cumple:= not(cero);
end; 

procedure procesardatos(L2:lista);
var 
  vt:vturno; i:integer; max,p1:integer; cantCeros:integer;
begin 
    cantCeros:= 0;
    max:= -1; p1:= 0;
    for i:=1 to turnos do vt[i]:= 0;

    while (L2 <> nil) do begin 
      if(L2^.data.nota >= 8) then begin 
        writeln(L2^.data.nombreYapellidnombre);
        writeln(L2^.data.dni);
      end; 

      vt[L2^.data.turno]:= vt[L^.data.turno] +1;

      if (cumple(L2^.data.dni)) then 
          cantCeros:= cantCeros +1; 
    L2:= L2^.sig;
    end;
    masEstudiantes(vt,max,p1);
    writeln(p1);

    writeln(cantCeros);
end; 

var 
  L,L2:lista;
begin 
  L:= nil;
  L2:= nil;

  cargardatos(L);
  evaluarAsistencia(L,L2);
  procesardato(L2);
end.






{DESCONOCIDO 
Una tienda virtual necesita un programa para administrar la informacion de sus clientes
de cada cliente se lee: numero, DNI, apellido y nombre, fecha de nacimiento (dia,mes,año)
nivel(1..5) y puntaje. la lectura finaliza cuando se lee el cliente con dni 33444555 que debe procesarse

se pide: 
A) generar una estructura que contenga numero, apellido y nombre de aquellos clientes con dni 
compuestos unicamente por digitos impares
B) informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000
C) implementar un modulo que elimine de la estructura generada la informacion relacionada a un 
numero de cliente recibido por parametro, tener en cuenta que dicho numero puede no existir.}

program CLIENTES;
const 
  niveles = 5;
type 
  rango_niveles = 1..niveles;

  nacimiento = record 
      dia:integer;
      mes:integer;
      año:integer;
  end; 

  cliente = record 
    numero:integer;
    dni:integer;
    apellidoynombre:string;
    fecha:nacimiento;
    nivel:rango_niveles;
    puntaje:real;
  end; 

  lista = ^nodo;
  nodo = record 
    data:cliente;
    sig:lista;
  end; 

  vniveles = array [rango_niveles] of real;

procedure leer(var r:cliente);
begin 
  with r do begin 

  end;
end; 

procedure armarlista(L:lista; r:cliente);
var 
  aux:lista;
begin 
  new(aux);
  aux^.data:= r;
  aux^.sig:= L;
  L:= aux;
end; 

procedure cargardatos(L:lista);
var 
  r:cliente;
begin 
  repeat 
    leer(r);
    armarlista(L,r);
  until (33444555);
end;

function cumpleImpares(dni:integer):boolean;
var 
  nopares:boolean;
begin 
  nopares:= false;
  while (dni > 0) and (not nopares) do begin 
    if (dni mod 10 mod 2 = 0) then 
        nopares:= true; 
  dni:= dni div 10;
  end;
  cumpleImpares:= (not nopares);
end; 

procedure armarlista2(L2:lista; r:cliente);
var 
  aux:lista;
begin 
  new(aux);
  aux^.data.numero:= r.cliente;
  aux^.data.apellidoynombre:= r.apellidoynombre;
  aux^.sig:= L;
  L:= aux;
end; 

procedure mayorYmenorNivel(vn:vniveles; var max,min:real; var p1,p2:integer);
var 
  i:rango_niveles;
begin 
  for i:=1 to niveles do begin 
    if (vn[i] > max) then begin 
      max:= vn[i]; 
      p1:= i;
    end;

    if (vn[i] < min) then begin 
      min:= vn[i];
      m1:= i;
    end;
  end; 
end; 

Procedure BorrarElemento (var pri:lista; numero:integer; var exito: boolean);
var
  ant, act: lista;
begin 
    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.datos.numero <> r.numero) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig;
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesardatos(L:lista);
var 
  L2:lista; vn:vniveles;
begin 
  L2:= nil;
  min:= 0; max:= 0; p1:= 0; m1:= 0; 
  totalPuntaje:= 0;
  while (L <> nil) do begin 
    if (cumpleImpares(L^.data.dni)) then 
      armarlista(L2,L^.data);

    totalPuntaje:= L^.data.puntaje + totalPuntaje; 
    vn[L^.data.nivel]:= vn[L^.data.nivel] + totalPuntaje;

    if (L^.data.fecha.año < 2000) then 
      mayorYmenorNivel(vn,max,min,p1,m1);

  L:= L^.sig;
  end;
end; 

var 
  L:lista; num:integer; exito:boolean; 
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
  readln(num);
  eliminar(L,exito);
end. 
	
{DECONOCIDO 
el productor musical bizarrap organiza sesiones musicales con diferentes artistas. se dispone
de una estructura de datos con la informacin de las seciones de bizarrap. de cada sesion se conoce:
titulo, nombre del artista, genero musical (1: trap latino, 2: reggaeton, 3:urban, 4:electronica,
5: pop rap), año de estreno y cantidad de reproducciones en spotify. la informacion no posee un orden especifico

A. informar los dos codigos de genero musical con menor cantidad de reproducciones en spotify
B. generar una lista ordenada por año que contenga las sesiones del genero "trap latino" y "urban" cuya suma de los 
digitos de la cantidad de reproducciones sea multiplo de 5.
C. realizar un modulo que reciba la lista generada en el punto anterior e informe para cada año la cantidad de sesiones realizadas
junto al total de reproducciones de spotify de esas sesiones}







{{ 2022 
LA CATEDRA DE CADP NECESITA UN PROGRAMA PARA GENERAR EL LISTADO DE ALUMNOS INGRESANTES
QUE RENDIRAN EL PARCIAL PARA ELLO, LA CATEDRA DISPONE DE UN LISTADO CON TODOS LOS ALUMNOS QUE INGRESARON
ESTE AÑO A LA FACULTAD. DE CADA ALUMNO SE CONOSE SU DNI, NOMBRE Y APELLIDO, 
NOTA OBTENIDA EN CURSOS DE INGRESO (4..10), TURNOS (1..4) Y SI ESTUVO PRESENTE O AUSENTE
EN CADA UNA DE LAS 12 CLASES DE PRACTICA.

A) realizar un modulo que reciba la informacion de los alumnos y retorne una nueva 
estructura de datos que contega solo aquellos alumnos que podran rendir el parcial, para poder rendir
el parcial, los alumnos deben contar con almenos 8 asistencias en las 12 clases de practica.

B) realizar un modulo que reciba la estructura de datos generada en el inciso anterior e imprima en pantalla
	1. apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso
	2. turno con mayor cantidad de alumnos en condiciones de rendir el examen
	3. cantidad de alumnos que no posean ningun digito cero en su DNI.

}


  {una tienda virtual necesita un programa para administrar la informacion de sus clientes. de cada cliente se lee 
numero, DNI, apellido y nombre, fecha de nacimiento (dia,mes y año)
nivel (1..5) y puntaje. la lectura finaliza cuando se lee el cliente con DNI 44555  

A) generar una estructura que contenga numero, apellido y nombre con los clientes cuyos DNI 
estan compuestos unicamente por digitos pares 

B) informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000

c) implementar un modulo que elimine, de la estructura generada, la informacion relacionada a un numero
de cliente recibido por parametro. tener en cuenta que dicho numero puede no existir en la estructura}



{TERCERA FECHA 2021
una revista dispone de informacion de los jugadores de basquet 
participantes de la liga profesional 2022 de cada jugador se conoce codigo de jugador 
apellido y nombre, codigo de equipo (1..20) año de nacimineto y la calificacion obtenida para cada
una de las 18 fechas del torneo ya finalizado. la calificacion es numerica de 0 a 10donde el valor 0 
significa que el jugador no ha participado de la fecha 

a. informar para cada equipo la cantidad de jugadores de 30 años 
b. informar los codigos de los 2 jugadores con menor calificacion promedio 
en los partidos en los que participo. solo deben considerarse los jugadores que participaron en 
mas de 9 fechas 
c. implementar e invocar a un modulo que genere una lista con los jugadores cuyo codigo posee 
exactamente 2 digitos pares y haya nacido entre 1987 y 1991. la lista debe estar ordenada por codigo de 
jugador }

program BASQUET;
const 
  equipos = 20;
  fechas = 18;
type 
  rango_equipos = 1..equipos;
  rango_fechas = 1..fechas;
  rango_calificacion = 1..calificacion;



  jugador = record 
    codigo:integer;
    apeynom:string;
    equipo:rango_equipos;
    nacimiento:integer;
    calificacion:vcali;
  end; 

  vcali = array [rango_fechas] of integer;

  lista = ^nodo;
  nodo = record 
    data:jugador;
    sig:lista;
  end; 

function participa (vc:vcali):boolean;
var 
  i:integer; cant:integer; participo:boolean;
begin 
  cant:= 0;
  participo:= false;
  for i:=1 to fechas do begin 
    if (calificacion[i] <> 0) then 
        cant:= cant +1; 
  end; 
  
  if (cant > 0) then 
    participo:= true;

  participa:= (participo);
end; 

procedure procesardatos(L:lista);
var 
  vc:vcali;
begin 
  while (L <> nil) do begin 
    if (participa(vc)) then 
      puntoB()
  L:= L^.sig; 
  end; 
end; 

var 
  L:lista;
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
end. 




{SEGUNDA FECHA 2023 
Un salon de eventos necesita un programa para administrar la informacion de las reservas
de diciembre de 2023 se dispone de una estructura con la informacion de las reservas. de cada reserva se conoce: numero de reserva,
DNI del cliente, dia del evento (1..31), hora de inicio, hora de fin y categoria de servicio (1..4). ademas, se dispone de una tabla
con el precio por hora de reserva de acuerdo a cada categoria de servicio.

a) generar una nueva estructura con numero y precio total de cada reserva. esta estructura con numero 
y precio total de cada reserva. esta estructura debe generarse ordenada por numero de reserva 

b) informar los dos dias del mes con mayor cantidad de reservas de clientes con DNI par    

c) informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena }








{PRIMERA FECHA 2023
{Un restaurante necesita un programa para administrar la informacion de los platos que ofrece.
se dispone de una estructura con la informacion de los platos. de cada plato se conoce: 
nombre,precio,categoria(1:entrada, 2:princpal, 3:postre, 4:minuta),
cantidad de ingredientes y nombre de cada uno de los ingredientes (a lo sumo 10)

a) generar una nueva estructura con nombre y precio de cada plato que posea "perejil" entre sus ingredientes
b) informar las dos categorias con mayor cantidad de platos ofrecidos.
c) informar el precio promedio de los platos con mas de 5 ingredientes.}

{PRIMERA FECHA PRIMER SEMESTRE 2023 
{una empresa de ventas de pasajeros en colectivo esta analizando la informacion de los viajes realizados a mar del plata en el ultimo año. para ello se dispone de una estructura de datos con la informacion de todos los viajes realizados. de cada viaje se conoce el codigo de viaje, el numero de coche (entre 1000 y 2500), el mes en que se realizo el viaje, la cnatida de pasajes vendidos y el dni del chofer. la informacion no se encuentra ordenada por ningun criterio.
ademas la empresa dispone de una estructura de datos con informacion sobre la capiacidad maxima de cada coche;

realizar un programa que procese la infromacion  de los viajes e: 
A. informar el numero de coche con le cual se realizaron mas viajes.
B. genere una lista con los viajes realizados en el mes 2 por un chofer con DNI multiplo de 10 donde la cantidad de pasajes vendidos no alcanza la capacidad maxima del coche;
C. para cada coche, informe el promedio de pasajeros que viajaron entre todos sus viajes.}










{2022
Una panaderia artesanal de la plata vende productos de elaboracion propia
la panaderia agrupa sus productos en 26 categorias, para cada categoria se conoce
su nombre y precio por kilo del productos

La panaderia dispone de la informacion de todas las compras realizadas en el ultimo año
de cada compra se conoce el DNI del cliente, la categoria del producto (1..26) y la cantidad
de kilos comprados. la informacion se encuentra ordenada por DNI del cliente
realizar un modulo que retorne la informacion de las categorias en una estructura de datos
adecuada. la informacion se lee por teclado y sin ningun orden en particular. de cada categoria se lee el nombre
el codigo (1..26) y el precio

b) realizar un modulo que reciba la informacion de todas las compras, la informacion de 
las categorias y retorne: 
1. DNI del cliente que mas compras ha realizados
2. monto total recaudado por cada categoria
3. cantidad de compras de clientes con DNI compuesto por al menos 3 digitos pares }








{2022 
una carniceria necesita analizar la informacion de las compras a frigorificos realizadas en el ultimo año
a) realizar un modulo que cargue en una estructura de datos adecuada la informacion de las compras
de cada compra se conoce el monto abonado, el mes en que se realizo la compra, la cantidad de kilos de carge comprados 
y el nombre del frigorifico. por cada frigorifico puede haber mas de una compra. la informacion de las compras debe 
quedar ordenada por nombre de frigorifico. la lectura finaliza al ingresar la compra con 100 kilos de carne que debe procesarse 

b) realizar un programa que utilice la informacion generada en el inciso a) e informe 
i) los nombres de los frigorificos para los cuales el monto total facturado supero los 45.0000
ii) los dos meses en los que se realizaron menor cantidad de compras 
iii) el monto promedio de las compras realizadas durante el mes de septiembre}







{Curso de Verano CADP 2020 – Parcial (10/3/2020)

Una empresa administra la información de sus empleados y necesita disponer de un programa que:
a) Lea y almacene la información de los empleados. De cada empleado se conoce: DNI, apellido, nombre, categoría (A, B, C, D o E), sueldo básico, montos de los premios obtenidos en el mes (como máximo 5) y antigüedad en la empresa.
La lectura de la información finaliza cuando se lee el DNI -1 (que no debe procesarse). La información debe ser almacenada de manera ordenada por DNI de menor a mayor.

Una vez leída y almacenada la información:
b) Obtener una lista de "Liquidaciones" con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se calcula de la siguiente manera:

    EMPLEADO Categoría A, B o C → Sueldo básico + premios.
    EMPLEADO Categoría D, E → Sueldo básico + premios + 1000 pesos por cada año de trabajo en la empresa.

c) Informar para cada categoría la cantidad de empleados.

d) Eliminar de la lista de "Liquidaciones" el empleado con DNI 555, de ser posible.}



{CADP 2018 - Parcial Parte 2 - Primera Fecha 15/6/2018
Tema 1

Se desea procesar la información de estancias del país. De cada estancia se lee:

    Código de estancia
    Localidad
    Código de provincia (1..23)
    Cantidad de cabezas de ganado

La lectura finaliza al ingresar el código de estancia 0, que no debe procesarse.

Se pide:

    Realizar un módulo para almacenar en una estructura la información leída.
    Realizar un módulo que reciba la estructura generada en 1) y retorne si se encuentra almacenada, o no, la estancia con código 234.
    Realizar un módulo que reciba la estructura generada en 1) y calcule los códigos de las 2 provincias con mayor cantidad de cabezas de ganado.

NOTA: Realizar el programa principal que invoca a los módulos implementados.}





{CADP 2018 - Parcial Parte 2 - Primera Fecha 15/6/2018
Tema 1

Se desea procesar la información de estancias del país. De cada estancia se lee:

    Código de estancia
    Localidad
    Código de provincia (1..23)
    Cantidad de cabezas de ganado

La lectura finaliza al ingresar el código de estancia 0, que no debe procesarse.

Se pide:

    Realizar un módulo para almacenar en una estructura la información leída.
    Realizar un módulo que reciba la estructura generada en 1) y retorne si se encuentra almacenada, o no, la estancia con código 234.
    Realizar un módulo que reciba la estructura generada en 1) y calcule los códigos de las 2 provincias con mayor cantidad de cabezas de ganado.

NOTA: Realizar el programa principal que invoca a los módulos implementados.}
