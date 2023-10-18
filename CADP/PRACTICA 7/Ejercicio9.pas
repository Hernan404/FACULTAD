program EJ9P7;
type 
    peliculas = record 
        codigo:integer;
        titulo:string;
        codigo:1..8;
        puntaje_promedio:integer;
    end;

    criticas = record 
        DNI:integer;
        apellidoYnombre:string;
        codigo:integer;
        puntaje:integer;
    end;

    lista = ^nodo
    nodo = record 
        data:peliculas;
        sig:lista;
    end;

    vector = array [1..8] of integer;

procedure inivector (v:vector; p:peliculas);
var 
    i:integer;
begin 
    for i:=1 to 8 do begin 
        v[i]:= 0;
    end;
end;    

procedure cargardatos (L:lista);
var 
    c:criticas;
    p:peliculas;
begin 
    leer(c);
    leer(p);
    repeat 
        armarlistapelis(L,p);
        leer(c);
        armarlista(L,c);
        leer(p);
    until c.codigo = -1;
end; 

procedure puntoB(var p1,max:integer; var p:peliculas);
begin 
    if (c.puntaje > max) then begin 
        max:= c.puntaje;
        p1:= v[L^.data.codigo];
    end;
end;

procedure puntoC(c:criticas):boolean
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;

    while (digito > 0) do begin 
        digito:= c.DNI mod 10;

        if (digito mod 2 = 0) then 
            par:= par +1;
        end 
        else 
            impar:= impar +1;
    end;

    puntoC:= (par = impar);
end;

procedure procesarDatos(L1,L2:lista);
var 
    v:vector;
    p:peliculas;
    cantcriticas:integer;
begin
    cantcriticas:= 0;
    while (L <> nil) do begin
        //punto 1 
        cantcriticas:= cantcriticas +1;
        L1^.data.puntaje_promedio^:= L2^.data.puntaje + L1^.data.puntaje_promedio;

        //punto 2 
        puntoB(max,p1,p);

        //punto 3
        if puntoC(c:criticas) then
            cumpleC:= L^.data.apellidoYnombre; 
    end;
    //punto 4
    eliminar();
end; 



var 
    L:lista;
    c:criticas;
    p:peliculas;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end;
