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


program EJ13P7;
const 
    areas = 35;
type 
    rango_areas = 1..35;

    libro = record 
        titulo:string;
        nombre:string;
        cantpaginas:integer;
        anio_edicion:integer;
        cantventas:integer;
        codigo:rango_areas;
    end; 

    lista =  ^nodo 
    nodo = record 
        data:libro;
        sig:lista
    end; 

    vector = array [rango_areas] of integer; 

procedure leer(var r:libro);
begin 
    with r do begin 
        readln(titulo);
        readln(nombre);
        readln(cantpaginas);
        readln(anio_edicion);
        readln(cantventas);
        readln(codigo);
    end;
end;

procedure armarlista (var L:Lista; r:libro);
var 
    aux:lista;
begin 
    new(aux);
    aux
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to areas do begin 
        v[i]:= 0;
    end;
end;
procedure cargardatos (L:lista);
var 
    r:libro;
begin 
    repeat 
        puntoA(r);
        armarlista(L,r);
    until (r.titulo = 'relato de un naufrago');
end;

procedure puntoA (r:libro);
begin 
    with r do begin 
        writeln('titulo');
        readln(titulo);
        writeln('nombre editorial');
        readln(editorial);
        writeln('cant paginas');
        readln(cantpaginas);
        writeln('anio de edicion'); 
        readln(anio_edicion);
        writeln('cantvendidos');
        readln(cantvendidos);
        writeln('codigo del area');
        readln(codigo);
    end;
end; 

procedure puntoB (L:lista);
begin 
    while (L <> nil) do begin 
        writeln('editorial', L^.data.nombre);

        if (L ^.data.cantventas > 250) then 
            writeln('titulos ', L ^.data.titulo);

    L:= L^.sig;
    end;
end;
