
El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos 
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7), 
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su 
descubrimiento. 

A. Desarrolle un programa que lea y almacene la información de los objetos que han sido 
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe 
procesarse). La estructura generada debe mantener el orden en que fueron leídos los datos.

B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:

1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que 
impares


procedure EJ6P7;
type 
    objetos = record 
        codigo:integer;
        categoria:1..7;
        nombre:string;
        distancia:integer;
        nombreDescubri:string;
        anioDescubri:integer;
    end;

    lista = nodo 
    nodo = record 
        datos:objetos;
    end;

    vCategoria = array [1..7] of integer;


procedure iniVector(v:vector);
var 
    i:integer;
begin 
    for i:=1 to 7 do begin 
        v[i]:= 0;
    end;
end;

procedure leer ();

procedure cargarVector();
begin 
    for i:=1 to 7 do begin 
        v[i]:= L^.datos.categoria;
    end;
end;    
procedure cargarLista (d:objetos);
begin 
    leer();
    while (d.codigo <> -1) do begin 
        armarnodo();
        leer();
    end;
end;

procedure punto1 (var cumpleA:integer; var max:integer; d:objetos);
begin 
    if (d.distancia > max) then begin
        max:= d.distancia;
        cumpleA:= d.codigo;
    end;
end;

procedure punto2 (L:lista; d:objetos; var planetas:integer);
var 
    i:integer;
begin 
        if (L^.datos.nombreDescubri = 'galileo galilei') and (L^.datos.anioDescubri < 1600) then begin 
            planetas := planetas +1;  
        end;
end; 

procedure punto3 (L:lista; cate:integer);
var 
    i:integer;
begin 
    cate:= L^.datos.categoria;
        v[cate]:= v[cate]+1
end;

procedure punto4 (L:lista; d:objetos);
var 
    digitos,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;
    digitos:= 0;

    digitos:= L^.datos.codigo mod 10

    if (digitos mod 2 = 0) then begin 
        par:= par+1
    else 
        impar:= impar +1;
    end;
    
    if (par > impar) then 
        writeln(L^.datos.nombre);
end;

procedure procesarDatos ();
begin 
    iniVector();
    while (L <> nil) do begin 
        cargarVector();
        punto1();
        punto2();
        punto3();       
    end;
end;    

var 
    v:vCategoria;
    d:objetos;
    L:lista;

begin
    cargarLista(d);
    procesarDatos()

    writeln(cumpleA);
    writeln(planetas);

end;
