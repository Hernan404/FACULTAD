
{Modificar la solución del punto anterior considerando que el programa lea y almacene la información
de a lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}



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

procedure leer(var v: vector; var diml: integer);
var 
  dni: integer;
begin 
  diml := 0;  // Inicializamos la dimensión lógica en 0
  writeln('Ingrese el DNI del alumno (-1 para finalizar): ');
  readln(dni);
  while (diml < dimf) and (dni <> -1) do begin 
    diml := diml + 1;
    v[diml].dni := dni;
    writeln('Ingrese el número de inscripción del alumno: ');
    readln(v[diml].numero);
    writeln('Ingrese el apellido del alumno: ');
    readln(v[diml].apellido);
    writeln('Ingrese el nombre del alumno: ');
    readln(v[diml].nombre);
    writeln('Ingrese el año de nacimiento del alumno: ');
    readln(v[diml].nacimiento);

    writeln('Ingrese el DNI del próximo alumno (-1 para finalizar): ');
    readln(dni);
  end;
end;

{ El porcentaje de alumnos con DNI compuesto solo por dígitos pares }
function cumplePar(num: integer): boolean;
begin 
  cumplePar := true;
  while (num > 0) and cumplePar do begin
    if ((num mod 10) mod 2 <> 0) then
      cumplePar := false;
    num := num div 10;
  end;
end;

{ Apellido y nombre de los dos alumnos de mayor edad }
procedure puntoB(v: vector; diml: integer; var max1, max2: integer; var a1, a2, n1, n2: string);
var 
  i, edad: integer;
begin 
  for i := 1 to diml do begin 
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

procedure procesar(var v: vector; diml: integer); 
var 
  cantA, i: integer;
  porcentaje: real;
  max1, max2: integer; 
  a1, a2, n1, n2: string;
begin 
  cantA := 0;
  max1 := -1; max2 := -1;
  a1 := ''; a2 := ''; n1 := ''; n2 := '';
  
  for i := 1 to diml do begin 
    if cumplePar(v[i].dni) then 
      cantA := cantA + 1;
  end;

  porcentaje := (cantA / diml) * 100;
  

  writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares es: ', porcentaje:0:2, '%');

  puntoB(v, diml, max1, max2, a1, a2, n1, n2);
  writeln('Los dos alumnos de mayor edad son: ', a1, ' ', n1, ' y ', a2, ' ', n2);
end;

var 
  v: vector; diml: integer;
begin 
  diml := 0;
  leer(v, diml);
  procesar(v, diml)
 
end.
