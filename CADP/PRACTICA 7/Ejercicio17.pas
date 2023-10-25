
program EJ17P7;
const 
    especie = 6;
    partos = 10;
type 
    rango_especie = 1..6;
    rango_partos = 1..10;

    conejas = record 
        codigo:integer;
        nacimineto:integer;
        especie:rango_especie;
        nombre:string;
        cantpartos:rango_partos;
        cantcrias:integer;
    end;

    lista = ^nodo
    nodo = record 
        data:conejas;
        sig:lista;
    end;

    vector = array [rango_especie] of integer;
    vector2 = array [rango_partos] of integer;

function puntoA (L:lista; r:conejas):integer;
var 
    max,p1:integer;
begin 
    max:= -1;
    p1:= 0;

    while (L <> nil) do begin 
        if (cantconejas > max) then begin 
            max:= cantconejas;
            p1:= v[L^.data.especie] + 1;
        end;
    end;
    puntoA:= p1;
end;

procedure puntoB (L2:lista; r:conejas);
begin 
    if (r.cantcrias > 35) then 
        armarlista(L2,r);
end;

function puntoC (L2:lista; r:conejas):boolean
var 
    digito,par,impar:integer;
begin
    par:= 0;
    impar:= 0;
    cumpleC:= false;

    while (L2 <> nil) do begin 
        if (L2^.data.nacimiento < 2020) then begin 
            while (digito > 0) do begin 
                digito:= r.codigo mod 10;

                if ((digito mod 2) = 0) then begin 
                    par:= +1;
                end 
                else 
                    impar:= impar +1;
            end;
            if (impar <> 0) and (par = 0) then 
                puntoC:= true;
        end;
    end;
end;

procedure procesarDatos(L:lista);
var 
    r:conejas;
    v:vector;
    v2:vector2;
    cumpleC:string;
begin

    while (L <> nil) do begin 
        puntoA(L,r);

        puntoB(L2,r);

        if puntoC(L2,r) then
            cumpleC:= L^.data.nombre; 

    end;

end;


var 
    L:lista;
begin 
    L:= NIL;
    cargardatos(L);
    procesarDatos(L);
end.

program EJ16P7; 
const 
    tipo = 5;
type 
    rango_tipo = 1..5;

    clientes = record 
        codigo:integer;
        tipo:rango_tipo;
        cantKW:real;
    end;

    lista = ^nodo
    nodo = record 
        data:clientes;
        sig:lista;
    end;

    vector = array [rango_tipo] of integer;

procedure puntoA (L:lista; var v:vector; var cumpleA:integer);
begin 
    while (L <> nil) do begin 
        v[L^.data.tipo]:= v[L^.data.tipo] +1;
    L:= L^.sig;
    end;
    cumpleA:= v[L^.data.tipo]
end;

procedure puntoB (L:lista; var v:vector; var cumpleB:string);
var 
    max,p1:integer;
begin 
    max:= -1
    p1:= 0;

    while (L <> nil) do begin 
        if (L^.data.cantKW > max) then 
            max:= 
    end;
end;


procedure procesarDatos (L:lista);
var 
    v:vector;
    r:clientes;
    cumpleA:integer;
begin 
    cumpleA:= 0;
    while (L <> nil) do begin 
        puntoA(L,v,cumpleA);
        puntoB(L,v,cumpleB);
    end;
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end.
