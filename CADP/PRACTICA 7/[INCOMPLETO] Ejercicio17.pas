{Un criadero de conejos está analizando ciclos de reproducción. El criadero cuenta con conejas
reproductoras y dispone de una estructura con la información de todas las conejas. De cada coneja se
tiene su código, año de nacimiento, especie (del 1 al 6), nombre, cantidad de partos (entre 1 y 10) y
cantidad de crías que tuvo en cada parto.
a) Realice una función que reciba la información de todas las conejas y retorne el número de especie que
tiene la mayor cantidad de conejas.
b) Realice un módulo que reciba la información de todas las conejas y retorne en una estructura
adecuada las conejas que tuvieron en total más de 35 crías.


Realice un módulo que reciba la estructura generada en b) e informe los nombres de las conejas con
código impar, nacidas antes del año 2020}




program EJ17P7;
const 
    especies = 6;
    partos = 10;
type 
    rango_especies = 1..6;
    rango_partos = 1..10;

    coneja = record 
        codigo:integer;
        nacimiento:integer;
        especie:rango_especies;
        nombre:string;
        cant_partos:rango_partos;
        cant_crias:integer;
    end;

    lista = ^nodo;
    nodo = record
        data:coneja;
        sig:lista;
    end;

    vpartos = array [rango_partos] of integer;
    vespecie = array [rango_especies] of integer;



procedure inivector (var vp:vpartos; var ve:vespecie);
var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.

procedure puntoA(L:lista):integer;
var 
    max:integer; pA:integer;
begin 
    max:= -1; pA:= 0;
    while (L <> nil) do begin 
        ve[L^.data.especie]:= ve[L^.data.especie] +1;
        cant_especies:= ve[L^.data.especie];

        if (cant_especies > max) then 
            max:= cant_especies;
            pA:= L^.data.especie;
        end;
    end;
    puntoA:= pA;
end;

procedure puntoB(L,L2:lista; var vp:vpartos);
begin 
    while (L <> nil) do begin 
        
        if (L^.data.cant_partos > 35) then 
            armarlista2(L2,L^.data);

    end;
end;

procedure puntoC(L:lista);
var 
    i:integer; par,impar:integer;
begin 
        cod:= L^.data.codigo;
        while (cod <> 0) do begin 
            if (((cod mod 10) mod 2) = 0) then 
                par:= par +1;
            else 
                impar:= impar +1;
        
        cod:= cod div 10;
        end;
    end;
end;

procedure procesardatos(L,L2:lista);
var 
    num:integer;
begin 
    puntoA(L)
    puntoB(L,L2);
    if (L^.data.nacimiento < 2020) then 
        puntoC(L2)
end;

var 
    L,L2:lista;
begin 
    L:= NIL; L2:= NIL;
    cargardatos(L);
    procesardatos(L,L2);
end.











