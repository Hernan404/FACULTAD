{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando
se completa el vector. Una vez finalizada la carga de datos se pide:
a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar
un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión
lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa}

program EJ10P4;
const 
  dimf = 300;
type 
  vector = array [1..dimf] of real;

procedure cargar(var v: vector; var diml: integer);
var 
  salario: real;
begin
  diml := 0; // Inicializamos la dimensión lógica
  writeln('Ingrese el salario del empleado (0 para finalizar):');
  readln(salario);
  
  while (diml < dimf) and (salario <> 0) do begin
    diml := diml + 1;
    v[diml] := salario;
    writeln('Ingrese el salario del empleado (0 para finalizar):');
    readln(salario);
  end;
end;

procedure incrementarSalarios(var v: vector; diml: integer; porcentaje: real);
var 
  i: integer;
begin
  for i := 1 to diml do begin
    v[i] := v[i] * (1 + porcentaje / 100); // Aumentar el salario en el porcentaje indicado
  end;
end;

procedure mostrarPromedio(v: vector; diml: integer);
var 
  i: integer;
  suma: real;
begin
  suma := 0;

  for i := 1 to diml do begin
    suma := suma + v[i]; // Sumar los salarios
  end;
  
  writeln('El salario promedio es: ', suma / diml:0:2)
end;

var 
  v: vector;
  diml: integer;
begin
  cargar(v, diml);
  incrementarSalarios(v, diml, 15); // Aumentar salarios en un 15%
  mostrarPromedio(v, diml);         // Mostrar el promedio de salarios
end.
