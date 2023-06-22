program ej8p7;
type 
    rangoAnio= 1900..2021;
    F = record 
        dia:1..31;
        mes:1..11;
    end;

    transferencia = record 
        numero_origen:integer;
        dni_origen:integer;
        numero_destino:integer;
        dni_destino:integer;
        fecha:F;
        hora:integer;
        monto:real;
        codmotivo:1..7;
    end;

    lista = ^nodo
    nodo = record 
        datos:transferencia;
        sig:lista;
    end;
    vector = array [1..7] of integer;


procedure ordenarTerceros(var terceros:lista; T:transferencia);
var 
    ant,nue,act:lista;
begin 
    new(nue);
    nue^.datos:= T;
    act:= terceros;
    ant:= terceros;
    while (act <> nil) and (act^.datos.numero_origen < T.numero_origen) do begin 
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then begin 
        L:= nue; 
    end;
    else 
    begin 
        ant^.sig:= nue;
    end;
    nue^.sig:= act;
end; 

procedure informarMasAlto (v:vector_contador; var alto:integer);
var 
    i:integer;
begin 
    for i:=1 to 7 do begin 
        if(v[i] > alto) then begin 
            alto:=v[i];
        end;
    end;
end;

procedure recorrerLista(L:lista);
var 
    terceros:lista;
    montoTransT:real;
    v:vector;
    tipo:integer;
    alto:integer;
    cumple:boolean;
    cantC:integer;
begin 
    cantC:= 0;
    alto:= 1;
    terceros:= nil;

    while (L <> nil) do begin 
        montoTransT:= 0;
        if(L^.datos.dni_origen <> L^.datos.dni_destino) then begin
            ordenarTerceros(terceros,L^.datos);
            montoTransT:= montoTransT + L^.datos.monto;
        end;
    end;

    tipo:= L^.datos.codmotivo;
    v[tipo]:= v[tipo] +1:
    if (L^.datos.fecha.mes = 7) then begin 
        cumple:= leerDigitos(L^.datos.numero_origen);
        if (cumple) then begin 
            cantC:= cantC+1;
        end;
    end;
    L:= L^.sig;
    end;
    informarMasAlto(v,alto);
end;

function leerDigitos(numero:integer):boolean;
var 
    dig:integer;
    par:integer;
    impar:integer;
begin 
    par:= 0;
    impar:= 0;
    while (numero <> 0) do begin 
        dig:= numero mod 10;
        if ((dig mod 2)= 0) then begin 
            par:= par+1;
        end;
        else begin 
            impar:= impar +1;
        end;
    end;
    if (par > impar) then begin 
        leerDigitos:= true;
    end;
end;


var 
    L:lista;
begin 
    L:= nil;
    recorrerLista(L);
end.
