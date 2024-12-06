
{La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial. Para ello, 
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

  vasistencia = array [rango_clases] of boolean;

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


  vt:vturno = array [rango_turnos] of integer;

procedure cargardatos(L:lista); //se dispone 

procedure armarlista2(var L2:lista; r:alumno);
var 
  aux:lista;
begin 
  new(aux); 
  aux^.data:= r;
  aux^.sig:= L2;
  L2:= aux;
end; 

procedure evaluarAsistencia(L,L2:lista);
var 
  va:vasistencia; cantAsis:integer; 
begin 
    cantAsis:= 0;
    while (L <> nil) do begin 
      for i:=1 to clases do begin 
        if (L^.data.presente[i] = true) then 
          cantAsis:= cantAsis +1;
      end; 

      if (cantAsis >= 8) then 
        armarlista2(L2,L^.data);
    L:= L^.sig;
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
  while (dni > 0) and (not cero) do begin 
    if (num mod 10 = 0) then 
      ceros = true;
    dni:= dni div 10;
  end; 
  cumple:= not(ceros);
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


