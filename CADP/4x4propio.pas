{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce 
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la 
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de 
empleado 1, el cual debe procesarse.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no 
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}

program EJadicional;
type 
    empleado = record 
        codigo: 1..2000;
        pais: 1..25;
        antiguedad:integer;
        sueldo:1..25;
    end;
    vector = array [1..2000] of integer;
    vector2 = array [1..25] of string;
    vector3 = array [1..25] of real;

procedure InicializarVector (v:vector; v2:vector2; v3:vector3);
var 
    i,f:integer;
begin 
    for i:=1 to 2000 do begin 
        v[i]:= 0;
    end;

   

    for f:= 1 to 25 do begin 
        v3[f]:= 0;
    end;
end; 

procedure cargarSueldo (v3:vector3; d:empleado);
var 
    f:integer;
begin 
    for f:=1 to 25 do begin 
        v3[f]:= d.sueldo;
    end;
end;

procedure leer (d:empleado; var v3:vector3);
begin 
    with d do begin 
        readln(codigo);
        readln(pais);
        readln(antiguedad);
        readln(sueldo);
        cargarSueldo(v3,d);
    end;
end;

procedure paismayor (var d:empleado; var v:vector; var max:integer; mayor_cantidad:integer);
var 
	i:integer;
begin 
    for i:=1 to 25 do begin 
        if (v[i] > max) then
            max:= v[i];
            mayor_cantidad:= d.pais
    end;
end;

procedure empleadoscant (var d:empleado; var mejorsueldo:integer);
begin 
    if (d.antiguedad > 10) and (d.sueldo >= 15) then begin 
        mejorsueldo:= mejorsueldo +1;
    end;
end;

procedure empleadoMejorP (var v:vector; var v3:vector3; var d:empleado; var maxSueldo:integer);
var 
    i,f:integer;
begin 
   
    for i:=1 to 2000 do begin
        for f:= 1 to 25 do begin  
            if (v[i] > v3[sueldo]) then 
                v3[sueldo]:= v[i];
            
        end;
    end;
end; 

procedure procesarDatos (var d:empleado; var max:integer; var mejorsueldo:integer; var maxSueldo:integer);
begin 
    repeat
        leer(d);
        paismayor(d,max);
        empleadoscant(d,mejorsueldo);
        empleadoMejorP(d,maxSueldo);    
    until (d.codigo = 1);
end;

var
    maxSueldo:integer;
    d:empleado;
    v:vector;
    max:integer;
    masTiempo:integer;
    mejorsueldo:integer;
    codigoMejor:integer;
    mayor_cantidad:integer;
begin 
    maxSueldo:= -1;
    mejorsueldo:= 0;
    max:= -1;
    InicializarVector(v,v2);
    procesarDatos(d,max,mejorsueldo,maxSueldo);

    writeln('pais con mayor cantidad de empleados ', mayor_cantidad);
    writeln('cantidad de empleados de mas de 10 años con sueldo de 1500: ', mejorsueldo);
    writeln('codigos de los empleados que cobran mejor sueldo' v3[sueldo]);
end;
