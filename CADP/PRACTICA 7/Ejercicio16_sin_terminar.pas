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
