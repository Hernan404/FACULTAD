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
        pais: string;
        antiguedad:integer;
        sueldo:1..25;
    end;
    vector = array [1..2000] of integer;
    vector3 = array [1..25] of integer;
    vector2 = array [1..25] of string;

procedure InicializarVector (var v2:vector2; var v:vector; var v3:vector3);
var 
    i,f,b:integer;
begin 
    for i:=1 to 2000 do begin 
        v[i]:= 0;
    end;
	for b:=1 to 25 do begin 
		v2[b]:= '';
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

procedure cargarPais (var v2:vector2; var d:empleado);
var 
	b:integer;
begin 
	for b:=1 to 25 do begin 
		v2[b]:= d.pais;
	end;
end;
procedure leer (var v2:vector2; d:empleado; var v3:vector3);
begin 
    with d do begin 
        writeln('pais');
        readln(pais);
        writeln('antiguedad');
        readln(antiguedad);
        writeln('sueldo');
        readln(sueldo);
        
    end;
end;

procedure paismayor (var d:empleado; var v3:vector3; var max:integer; mayor_cantidad:string);
var 
	b:integer;
begin 
    for b:=1 to 25 do begin 
        if (v3[b] > max) then
            max:= v3[b];
            mayor_cantidad:= d.pais;
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
            if (v[i] > v3[f]) then 
                v3[f]:= v[i];
            end;
    end;
end;
procedure procesarDatos (var v2:vector2; var v:vector; var v3:vector3; var d:empleado; var max:integer; var mejorsueldo:integer; var maxSueldo:integer; var mayor_cantidad:string);
begin 
	InicializarVector(v2,v,v3);
    repeat
		writeln('codigo');
		readln(d.codigo);
        leer(v2,d,v3);
        cargarSueldo(v3,d);
        cargarPais(v2,d);
        paismayor(d,v3,max,mayor_cantidad);
        empleadoscant(d,mejorsueldo);
        empleadoMejorP(v,v3,d,maxSueldo);    
    until (d.codigo = 1);
end;

var
    maxSueldo:integer;
    d:empleado;
    v:vector;
    v2:vector2;
    v3:vector3;
    max:integer;
    mejorsueldo:integer;
    mayor_cantidad:string;
    {f:integer;}
begin 
	mayor_cantidad:= '';
    maxSueldo:= -1;
    mejorsueldo:= 0;
    max:= -1;
    procesarDatos(v2,v,v3,d,max,mejorsueldo,maxSueldo,mayor_cantidad);

    writeln('pais con mayor cantidad de empleados: ', mayor_cantidad);
    writeln('cantidad de empleados de mas de 10 anios con sueldo de 1500: ', mejorsueldo);
    {writeln('codigos de los empleados que cobran mejor sueldo: ', v3[f]);}
    
end.
