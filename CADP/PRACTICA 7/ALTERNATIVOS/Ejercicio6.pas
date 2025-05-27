{Parque Nacional Iberá Relevamiento de Especies Animales

El Parque Nacional Iberá ha realizado un relevamiento sobre las distintas especies animales observadas durante el año 2015.
 Las especies se clasifican en 7 grupos:
1: mamíferos, 2: aves, 3: reptiles, 4: anfibios, 5: peces, 6: insectos, y 7: arácnidos.

Al registrar una especie, se anotan los siguientes datos:

    código de la especie

    grupo al que pertenece (1..7)

    nombre común de la especie

    distancia promedio recorrida desde su hábitat habitual (en km)

    nombre del investigador que la avistó

año en que fue registrada por primera vez

A. Desarrolle un programa que lea y almacene la información de las especies 
observadas. 
La información se lee hasta encontrar una especie con código -1 
(la cual no debe procesarse). 
La estructura generada debe mantener el orden en que fueron leídos los datos.

B. Una vez leídos y almacenados todos los datos,
se pide realizar un informe con la siguiente información:

    Los códigos de las dos especies que más lejos se encontraban de su hábitat.

    La cantidad de aves registradas por "Juan Pérez" antes del año 1980.

    La cantidad de especies observadas por cada grupo.

    Los nombres de los mamíferos cuyos códigos poseen más dígitos pares que impares.
}

program EJ6_ALT;
const 
	grupos = 7;
type 
	rango_grupos = 1..grupos;

	especie = record 
		codigo:integer;
		grupo:ranog_grupos;
    nombre_especie:string;
    distancia:real;
    nombre_investigador:integer;
    año:integer;
  end;

  lista = ^nodo;
  nodo = record 
    data:especie;
    sig:lista;
  end; 

  vector = array [rango_grupos] of integer;


procedure armarlista(var L:lista; r:especie);
var 
  act,nue:lista;
begin
  new(nue);
  nue^.data:= r;
  nue^.sig:= NIL; 

  if (L <> nil) then 
      act:= L;
      while (act^.sig <> nil) do 
        act:= act^.sig;
      act^.sig:= nue; 
  end
  else 
    L:= nue;
end; 

procedure cargardatos(L:lista);
var 
  r:especie;
begin 
  while (r.codigo <> -1) do begin 
      armarlista(L,r);
      leer(r);
  end; 
end;

procedure masespecies(distancia:real; codigo:integer; max1,max2:real; p1,p2:integer);
begin 
  if (distancia > max1) then begin 
    max2:= max1;
    p2:= p1;
    max1:= distancia;
    p2:= codigo;
  end
  else if (max1 > max2) then begin 
    max2:= distancia;
    p2:= codigo;
  end; 
end; 

function cumpleB(nombre:string; año:integer):boolean;
begin 
  cumpleB(nombre = "Juan Perez") and (año > 1980);
end;

function cumplePar(codigo:integer):boolean;
var 
  par,impar:integer;
begin 
  par:= 0; impar:= 0;
  while (codigo > 0) do begin 
    if (codigo mod 10 mod 2 = 0) then 
      par:= par +1;
    else 
      impar:= impar +1; 
  end;
  cumplePar:= (par > impar);
end; 

procedure procesardatos(L:lista);
var 
  v:vector; max1,max2:real; p1,p2:integer;
begin 
  max1:= -1; max2:= -1; p1:= 0; p2:= 0; cantB:integer; 
  while (L <> nil) do begin 

    masespecies(L^.data.distancia,L^.data.codigos; max1,max2,p1,p2);

    if (cumpleB(L^.data.nombre_investigador,L^.data.año)) then 
        cantB:= cantB +1; 

    v[L^.data.especie]:= v[L^.data.especie] +1;

    if (L^.data.grupo = 1) and (cumplePar(L^.data.codigo)) then 
      writeln(L^.data.nombre_especie);

  end; 
    writeln(p1,p2);
    writeln(cantB);

    for i:=1 to grupos do 
      writeln(v[i]);
end;

var 
  L:lista;
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
end. 

  
