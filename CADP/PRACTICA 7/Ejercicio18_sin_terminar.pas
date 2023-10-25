program EJ18P7;
type 
    ganancias = record 
        nombre:string;
        monto:real;
    end;

    lista = ^nodo 
    nodo = record 
        data:ganancias;
        sig:lista;
    end;

    vector = array [1..12] of integer;

procedure puntoA (L:lista; r:ganacias);
var 
    i:integer;
begin 
    for i:=1 to 12 do begin 
        writeln(r.nombre);
        writeln(r.monto);
        while (r.monto <> 0) do begin 
            armarlista(L,r);
            writeln(r.nombre);
            writeln(r.monto);
        end; 
    end;
end;

function totalfacturado (r:ganancias):real;
begin 
    totalfacturado:= v[L^.data.monto] + totalfacturado;
end;
procedure puntoB (r:ganancias);
var 
    i:integer;
begin 
    readln(r.nombre);
    readln(r.monto);

    for i:=1 to 12 do begin 
        if (r.monto < min1) then begin 
            min2:= min1; 
            p2:= p1;
            min1:= v[i];
            p1:= i;
        end 
        else 
            if (min2 < min1) then 
                min2:= v[i];
                p1:= i;
    end;
    totalfacturado(r);
end;

procedure procesardatos(L:lista);
var 

begin 
    while (L <> nil) do begin 
        puntoA(L,r);

        puntoB(r);

    end;
end;
