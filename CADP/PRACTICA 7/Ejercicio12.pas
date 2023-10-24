program EJ12P7;
const 
    subs = 4;
type 
    rango_subs = 1..4; 
    
    cliente = record 
        DNI:integer;
        edad:integer;
        tipo:rango_subs;
    end;

    lista = ^nodo
    nodo = record 
        data:cliente;
        sig:lista; 
    end; 

    vector = array [rango_subs] of integer;

procedure leer(r:cliente);

procedure armarlista (L:lista; r:cliente);

procedure cargardatos(L:lista);
var 
    r:cliente;
begin 
    leer(r);
    while (r.DNI <> 0) do begin 
        armarlista(L,r);
        leer(r);
    end;
end;

procedure inivector (var v:vector);
var 
    i:rango_subs;
begin 
    for i:=1 to subs do begin 
        v[i]:= 0;
    end;
end;

procedure puntoB (max1,max2,p1,p2:integer; r:cliente);
begin 
    for i:=1 to subs do begin 
        if (v[i] > max1) then begin 
            max2:= max1;
            p2:= p1;
            max1:= v[i];
            p1:= i;
        else 
            if (max2 > max1) then begin 
                max2:= v[i];
                p1:= i;
            end;
        end;
    end;
end;

procedure procesarDatos(L:lista);
var 
    v:vector;
    r:cliente;
    max1,max2,p1,p2,total:integer;
begin 
    total:= 0;
    max1:= -1;
    max2:= -1;
    p1:= 0;
    p2:= 0;

    while (L <> 0) do begin
        dniact:= L^.data.DNI;
            while (L <> nil) and (dniact = L^.data.DNI);
            //punto A 
            total:= v[L^.data.tipo] + total;

            //punto B
            v[L^.data.tipo]:= v[L ^.data.tipo] +1; 
            puntoB(max1,max2,p1,p2,r);

            //punto C 
            if (L^.data.edad > 40) and ((v[L^.data.tipo] = 3) or (v[L^data.tipo] = 4)) then 
                armarlista2(L2,L^.data.nombre,L^.data.DNI);
            
            L:= L^.sig;
            end;        
    end;
    writeln('punto 1', total);
    writeln('punto 2', p1,p2)
end; 

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end.
