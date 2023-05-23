Se leen datos de empleados de una empresa multinacional. 
De cada empleado se conoce su codigo  (1..2000)
Codigo pais donde trabaja (1..25)
antiguedad de años y sueldo bruto en dolares
finaliza al ingresar codigo 1 que se procesa solo.

informar 
A) -el pais con mayor cantidad de empleados
B) -cantiad de empleados de mas de 10 años cuyo sueldo
 no alcance los 1500 dolares
C) -los codigos que cobran mejor sueldo en cada pais 


program 4x4

{declaramos un const de los rangos que nos dieron}
const 
    cant_empleados = 2000;
    cant_paises = 25;

{armamos los subrangos}
type
    codigos_empleados = 1..cant_empleados;
    codigo_paises = 1..cant_paises;


{registro para el punto C}
    info_sueldo = record 
        codigo: codigo_empleados;
        sueldo: real;
    end;

    vector_sueldos = array [codigo_paises] of info_sueldo;


{hacemos el registro de todos los datos}
    empleado = record
        codigo:codigo_empleados;
        pais: codigos_paises;
        antiguedad: integer;
        sueldo:real;
    end;

{necesito un vector para el punto A}
        vector_paises = array [codigo_paises] of integer;







var 
    empleadosPais: vector_paises;
    mejoresSueldso: vector_sueldos;
    cantEmpleados: integer;
begin 
    inicializarVectores(empleadosPais, mejoresSueldos)



end;
