{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.}

program EJ8P4;
const 
  dimf = 400;
  anioActual = 2020;
type 
  alumno = record 
    numero: integer;
    dni: integer;
    apellido: string;
    nombre: string;
    nacimiento: integer;
  end;

  vector = array [1..dimf] of alumno;

procedure leer(var v: vector);
var 
  i: integer;
begin 
  for i := 1 to dimf do begin 
    writeln('Ingrese el número de inscripción del alumno ', i);
    readln(v[i].numero);
    writeln('Ingrese el DNI del alumno ', i);
    readln(v[i].dni);
    writeln('Ingrese el apellido del alumno ', i);
    readln(v[i].apellido);
    writeln('Ingrese el nombre del alumno ', i);
    readln(v[i].nombre);
    writeln('Ingrese el año de nacimiento del alumno ', i);
    readln(v[i].nacimiento);
  end;
end;

function cumplePar(num: integer): boolean;
begin 
  cumplePar := true;
  while (num > 0) and cumplePar do begin
    if (num mod 10) mod 2 <> 0 then
      cumplePar := false;
    num := num div 10;
  end;
end;

procedure puntoB(v: vector; var max1, max2: integer; var a1, a2, n1, n2: string);
var 
  i, edad: integer;
begin 
  for i := 1 to dimf do begin 
    edad := anioActual - v[i].nacimiento;
    if (edad > max1) then begin 
      max2 := max1;
      a2 := a1;
      n2 := n1;
      max1 := edad;
      a1 := v[i].apellido;
      n1 := v[i].nombre;
    end
    else if (edad > max2) then begin 
      max2 := edad;
      a2 := v[i].apellido;
      n2 := v[i].nombre;
    end;
  end; 
end;

procedure procesar(var v: vector); 
var 
  cantA, i: integer;
  porcentaje: real;
  max1, max2: integer; 
  a1, a2, n1, n2: string;
begin 
  cantA := 0;
  max1 := -1; max2 := -1;
  a1 := ''; a2 := ''; n1 := ''; n2 := '';

  for i := 1 to dimf do begin 
    if cumplePar(v[i].dni) then 
      cantA := cantA + 1;
  end;

  porcentaje := (cantA / dimf) * 100;
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares es: ', porcentaje:0:2, '%');

  puntoB(v, max1, max2, a1, a2, n1, n2);
  writeln('Los dos alumnos de mayor edad son: ', a1, ' ', n1, ' y ', a2, ' ', n2);
end;

var 
  v: vector;
begin 
  leer(v);
  procesar(v);
end.
