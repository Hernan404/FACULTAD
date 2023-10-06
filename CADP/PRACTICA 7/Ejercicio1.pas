program EJ1P7;
type 
    casting = record 
        DNI:integer;
        apellidoYnombre:string;
        edad:integer;
        codigo:1..5;
    end;

    lista = ^nodo 
    nodo = record 
        data:casting;
        sig:lista;
    end;

    vector = array [1..5] of integer;

procedure armarlista (var L:lista; c:casting);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= c;
    aux^.sig:= L;
    L:= aux;
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:= 1 to 5 do begin 
        v[i]:= 0;
    end;
end;

procedure leer(var c:casting);
begin 
    whith c do begin
        readln(DNI);
        readln(apellidoYnombre);
        readln(edad);
        readln(codigo);
    end; 
end;

procedure cargardatos(L:lista; c:casting);
begin 
    leer(c);
    while (c.DNI <> 3355) do begin 
        leer(c);
        armarlista(L,c);
    end;
end;

function puntoA (L:lista):boolean;
var 
    digito,par,impar:integer;
begin
    digito:= c.DNI mod 10;
    while (c.DNI > 0) do begin 
    if (digito mod 2 = 0) then 
        par:= par +1;
    else 
        impar:= impar +1;
    end;

    c.DNI:= c.DNI div 10;
    
    if (par > impar) then 
        puntoA:= true;
    else 
        puntoA:= false;
end;

procedure eliminar (var pri:lista; c:casting; var exito:boolean);
var 
    dni:integer;
    ant,act:lista;
begin 
    
    exito:= false;
    act:= pri;

    writeln(' INGRESE DNI A ELIMINAR');
    readln(dni);
    
    while (act <> nil) and (act^.data.DNI <> dni) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (act <> nil) then begin 
        exito:= true;
        if(act = pri) then 
            pri:= act^.sig;
        else 
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

procedure puntoB (v:vector ;var max1,max2:integer; var p1,p2:integer);
var 
    i:integer;
begin  
    max1:= -1;
    max2:= -1;

    for i:= 1 to 5 do begin
        if (v[i] > max1) then begin
            max2:= max1;
            p1:= i;
            if (v[i] > max2) then 
                max2:= v[i];
    end;
end;

procedure procesarDatos(L:lista);
var 
    cantA,cantB,codACT:integer;
begin 
    inivector(v);
    cantA:= 0;
    while (L <> nil) do begin 
        if puntoA(L^.data) then 
            cantA:= cantA +1;
        puntoB();
    end;
    eliminar(L,c);
end;

var 
    v:vector;
    c:casting;
    L:lista;
begin 
    L:= NIL;
    cargardatos(L,c);
    procesarDatos(L);
end.
