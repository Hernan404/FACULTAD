{Una empresa de distribución de electricidad necesita procesar la información de sus clientes. La
empresa dispone de una estructura con la información de sus clientes. De cada cliente tiene el código,
localidad, tipo (1: hogar, 2: club, 3: comercio, 4: centro educativo y 5: centro cultural) y cantidad de kW de
electricidad consumida en cada uno de los últimos 6 meses. La información está organizada por localidad.
Implementar un programa con:
a) Un módulo que reciba la estructura con la información de los clientes y retorne en otra
estructura la cantidad de clientes que hay para cada tipo.
b) Un módulo que reciba la estructura con la información de los clientes y retorne la localidad con
mayor cantidad de clientes.
c) Un módulo que reciba la estructura con la información de los clientes y retorne en otra
estructura adecuada los clientes que consumieron más de 1000 kW en los últimos 6 meses.
d) Un módulo que reciba la estructura generada en b) y que informe el domicilio de cada cliente
cuyo código tiene igual cantidad de dígitos pares que impares.}

program EJ16P7;
const 
    tipos = 5;
type 
    rango_tipos = 1..5;

    empresa = record 
        codigo:integer;
        localidad:string;
        tipo:rango_tipos;
        cantkm:real;
    end;

    lista = ^nodo;
    nodo = record 
        data:empresa;
        sig:lista;
    end;

    vector = array [rango_tipos] of integer;



procedure puntoA(r:empresa; var vc:vcant);
var 
    i:integer;
begin 
    while (L <> nil) do begin 
        vc[L^.data.tipo]:= v[L^.data.tipo] +1;
    L:=L^.sig;
    end;
end;

procedure puntoB(L:lista; p1:string);
var 
    max:integer;
begin 
    max:= -1; 

    while (L <> nil) do begin 
        if (v[L^.data.tipo] > max) then begin 
            max:= v[L^.data.tipo];
            p1:= L^.data.localidad;
        end;
    L:= L^.sig;
    end;
end;

procedure puntoC(L,L2,L3:lista);
begin 
    while (L <> nil) do begin 
        if (L^.data.cantkm > 1000) then 
            armarlista3(L3,r);
    end;
end;

procedure puntoD(L2:lista);
begin 
    //modulo de sacar pares e informar
end;

procedure procesardatos(L:lista);
var 
    p1:string;
begin 
    p1:= '';
    inivector(vc,v);

    puntoA(L,vc);
    puntoB(L,p1);
    puntoC(L,L2);
    puntoD(L2);
    
end;


var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
