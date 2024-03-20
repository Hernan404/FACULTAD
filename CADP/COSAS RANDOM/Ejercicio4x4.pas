
{1. primero el registro y los vectores
 2. luego el codigo principal.
 3. luego inicializo los vectores
 4. luego puedo hacer un procesarDatos para llamar a leer
 5. hago el leer 
 6. }

const 
    cant_empleados = 2000;
    cant_paises = 25;

type 
    codigo_empleados = 1..cant_empleados;
    codigos_paises = 1..cant_paises

    empleado = record 
        codigo: codigo_empleados;
        pais: codigo_paises;
        antiguedad: integer;
        sueldo: real;
    end;

    info_sueldo = record 
        codigo:codigo_empleados;
        sueldo:real;
    end;
vector_sueldos = array [codigo_paises] of info_sueldo;

vector_paises = array [codigos_paises] of integer;

procedure inicializarVectores(var v:vector_paises; var sueldos:vector_sueldos);
var 
    i:codigo_paises;
begin 
    for i:=1 to cant_paises do begin 
        v[i]:= 0;
        sueldos[i].sueldo:= -1;
    end;
end;

procedure leer (var e:empleado);
begin 
    with e do begin 
        readln(codigo);
        readln(pais);
        readln(antiguedad);
        readln(sueldo);
    end;
end;

function cumple (e:empleado):boolean
begin 
    cumple:= (e.antiguedad > 10) and (e.sueldo < 1500);
end;

procedure actualizarMaximo(var max:info_sueldo; cod:codigos_empleados:sueldo: real);
begin 
    if (max.sueldo = sueldo) then begin 
        max.sueldo:= sueldo;
        max.codigo:= cod;
end;

function maxPais(v:vector_paises):codigo_paises;
var 
    i,max_cod_pais:codigo_paises
    max_cant:integer;
begin 
    max_cant:= 1;
    for i:= 1 to codigo_paises do begin 
        if (v[i] > max_cant) then begin 
            max_cant := v[i];
            max_cod_pais:= 1;
        end;
    end;
    maxPais:= max_cod_paisM
end;

procedure procesarDatos (var v:vector_paises; var sueldos:vector_sueldos; var cantEmp:integer);
var 
    e:empleado;

end; 

begin 
    repeat 
        leer(e);
        v[e.pais] := v[e.pais] +1;
        if (cumple(e)) then
            cantEmp := cantEmp + 1;
    until
end;

procedure imprimirCodigosPorPais (v:vector_sueldos);
var 
    i:codigo_paises;
begin 
    for i:=1 to cant_paises do 
        writeln(i , v[i].codigo)
end;


var 
    empleadosPais: vector_paises;
    mejoresSueldos: vector_sueldos;
    cantEmpleados: integer;
begin 
    inicializarVectores(empleadoPais, mejoresSueldos);
    cantEmpleados:= 0;
    procesarDatos(empleadoPais, mejoresSueldos, cantEmpleados);
    writeln('el pais con mayor empleado es ', maxPais(empleadoPais);
    imprimirCodigosPorPais(mejoresSueldos);
    writeln('la cant. de empleados con mas de 10 años de antiguedad cuyo ', cantEmpleados);
end;
