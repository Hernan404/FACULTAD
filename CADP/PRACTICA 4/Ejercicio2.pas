program Vectores;
const
cant_datos = 150;
type
vdatos = array[1..cant_datos] of real;


procedure cargarVector(var v:datos; var dimL : integer);
var
    i,valor:integer;
begin
    i:= 1;
    while (i < dimf) do begin
        readln(a[i]);
        i:= i+1;


    end;

end;




procedure modificarVectorySumar(var v:datos;dimL : integer; n: real; var suma: real);
var
    i:integer;
begin
    while (i <= dimf) do begin
        i:=i+1

end;



var
datos : vdatos;
i, dim : integer;
num, suma : real;

begin
dim := 0;
sumaTotal := 0;
cargarVector(datos,diml); { completar }

    writeln(‘Ingrese un valor a sumar’);
    readln(num);

    modificarVectorySumar(datos);{completar}

writeln(‘La suma de los valores es: ’, suma);
writeln(‘Se procesaron: ’,dim, ‘ números’)
end.
