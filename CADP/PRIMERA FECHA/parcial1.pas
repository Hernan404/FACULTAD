Un restaurante necesita un programa para administrar la informacion de los platos que ofrece.
se dispone de una estructura con la informacion de los platos. de cada plato se conoce: 
nombre,precio,categoria(1:entrada, 2:princpal, 3:postre, 4:minuta),
cantidad de ingredientes y nombre de cada uno de los ingredientes (a lo sumo 10)

a) generar una nueva estructura con nombre y precio de cada plato que posea "perejil" entre sus ingredientes
b) informar las dos categorias con mayor cantidad de platos ofrecidos.
c) informar el precio promedio de los platos con mas de 5 ingredientes.


program parc
type 
    platos = record 
        nombre:string;
        precio:real;
        categoria:1..4;
        cant_ingredientes:integer;
        nombre_ingredientes:integer;
    end;

    platosA = record 
        nombre:string;
        precio:real;
    end;
    
    lista = ^nodo;
    nodo = record 
        data:platos;
        sig:lista;
    end;

    vector = array [1..4] of integer;

procedure puntoA (r:plato; rA:platoA);
begin 
    if (r.nombre = 'perejil') then 
        rA.nombre:= r.nombre;
        rA.precio:= r.precio;
        armarlista2(L2,rA)
end;

procedure puntoB (r:plato; v:vector);
begin 
    for i:=1 to 4 do begin 
        if (v[i] > max1) then begin 
            max2:= max1;
            p2:= p1;
            max1:= v[i];
            p2:= i;
        end 
        else begin 
            if (max2 > max1) then 
                max2:= v[i];
                p2:= i;
        end;
    end;
end;

procedure puntoC(r:plato; var promedio:real); 
begin 
    if (r.cant_ingredientes > 5) then 
        ingredientes5:= ingredientes5 + 1;
end;

procedure procesardatos (L:lista);
var 
    r:platos;
    rA:platosA;
    promedio:real;
begin 
    inivector(v);
    while (L <> nil) do begin 
        puntoA(r,ra);
        puntoB(r,v);
        puntoC(r,promedio);
    
    L:= L^.sig;
    end;
    writeln(p1,p2);
    writeln((promedio/ingredientes5)*100)
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
