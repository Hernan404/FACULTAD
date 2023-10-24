program EJ14P7;
const 
    dia = 31;
type 
    rango_dia:= 1..31;

    prestamo = record 
        numero:integer;
        ISBN:integer;
        numero_socio:integer;
        diaprestamo:rango_dia;
    end; 

    lista =  ^nodo 
    nodo = record 
        data:prestamo;
        sig:lista;
    end;

    vector = array [rango_dia] of integer;

procedure leer(r:prestamo);

procedure armarlista(L:lista; r:prestamo);

procedure inivector (var v:vector); 

procedure cargardatos (L:lista);
var 
    r:prestamo;
begin 
    leer(r);
    while (ISBN <> -1) do begin 
        armarlista(L,r);
        leer(r);
    end;
end; 

procedure puntoB (var max,p1:integer; v:vector);
begin 
    for i:=1 to dia do begin 
        if (v[i].dia < min) then begin 
            min:= v[i];
            p1:= i;
        end;
    end;
end;

function puntoC(num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar := 0;
end;    

procedure procesardatos(L:lista);
var 
    v:vector;
    r:prestamo;
    min,p1:integer;
begin 
    min:= 9999;
    p1:= 0;
    suma:= suma +1;
    while (L <> nil) do begin 
    ISBNact:= L^.data.ISBN;
        while (L <> nil) and (L^.data.ISBN = ISBNact) do begin 
            //punto A
            v[L^.data.dia]:= v[L^.data.dia] +1;

            //punto B
            puntoB(max1,p1,v);

            //punto C 
            suma:= suma +1;
            if ((L^.data.numero mod 10) mod 2 = 1) and ((L^.data.numero_socio mod 10) mod 2 = 0) then 
                cantC:= cantC +1;

            L:= L^.sig;
        end;
        for i:=1 to dia do begin 
            writeln('punto A', v[i], i);
        end; 
        writeln('punto B', p1);
        writeln('punto C', cantC*100/suma);
    end;

end;


var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end.
