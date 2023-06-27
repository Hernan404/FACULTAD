12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que 
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla 
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se 
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una 
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:

- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit
o a Todas las clases. Esta lista debe estar ordenada por DNI

program EJ12P7;
type 

    clientes = record 
        nombre:string;
        dni:integer;
        edad:integer;
        tipo_sub:1..4;
    end;

    lista = ^nodo; 
    nodo = record 
        datos:clientes;
    end;

    vector = array [1..4] of string;
    vmonto = array [1..4] of real;

procedure inivector ();
var 
    i:integer;
begin 
    for i:= 1 to 4 do begin 
        v[i]:= 0;
    end;
end;

procedure cargarVector ();
var 
    i:integer;
begin 
    v[1]:= 'musculacion';
    v[2]:= 'Spinning';
    v[3]:= 'cross fit';
    v[4]:= 'todas las clases';

    for i:=1 to 4 do 
        v[i]:= v[i] +1;
end;
procedure puntoA ();
begin 
    for i:=1 to 4 do begin 



    end; 

end;

procedure puntoB();
begin 
    for i:=1 to 4 do begin 
        if (v[i] > max);
    end;
end;
var 
    gananciatotal:real;

begin 

end;
