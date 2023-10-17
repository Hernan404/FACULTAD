
program EJ6P7;
type 
    objetos = record 
        codigo:integer;
        categoria:1..7;
        nombre_objeto:string;
        distancia:integer;
        nombre_descubridor:string;
        anio_descubrimiento:integer;
    end;

    lista = ^nodo;
    nodo = record 
        data:objetos;
        sig:lista;
    end;

    vector = array [1..7] of integer;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 7 do begin 
        v[i]:= 0;
    end;
end;

procedure leer(var o:objetos);
begin 
    with o do begin 
        readln(codigo);
        if (codigo <> -1) then begin 
        readln(categoria);
        readln(nombre_objeto);
        readln(distancia);
        readln(nombre_descubridor);
        readln(anio_descubrimiento);
        end;
    end;
end;

//crear lista ordenada por los datos leidos
procedure armarlista (L:lista; o:objetos);
var 
    aux,pos:lista;
begin 
    new(aux);
    aux^.data:= o;
    aux^.sig:= L;
    
    if (L = nil) then 
        L:= aux
    else begin 
        pos:= L;
        while (pos^.sig <> nil) do
            pos:= pos^.sig;

        pos^.sig:= aux;
    end;
end;

procedure cargardatos (var L:lista);
var 
    o:objetos;
begin 
    leer(o);
    while (o.codigo <> -1) do begin 
        armarlista(L,o);
        leer(o);
    end;
end;    

procedure punto1 (var max1,max2,p1,p2:integer; var o:objetos);
begin 
    if (o.distancia > max1) then begin 
        max2:=max1;
        p2:= p1;
        max1:= o.distancia;
        p1:= o.codigo;
    end
    else 
        if (max2 > max1) then begin 
            max2:= o.distancia;
            p2:= o.codigo;
        end;
end;

function punto2 (o:objetos):boolean;
begin 
    punto2:= (o.nombre_descubridor = 'galileo galilei') and (o.anio_descubrimiento < 1600);
end;

function punto4 (codigo:integer):boolean;
var 
    par,impar:integer;
begin 
    par:= 0;
    impar:= 0;

    while (codigo > 0) do begin 
        if (codigo mod 2 = 0) then 
            par:= par +1
        else 
            impar:= impar +1;
        codigo:= codigo div 10;
    end;
    punto4:= (par > impar);
end;

procedure procesardatos(L:lista);
var 
    i,cantpunto2,cantpunto4,codaux,max1,max2,p1,p2:integer;
    o:objetos;
    v:vector;
begin 
    max1:= -1;
    max2:= -1;
    p1:= 0;
    p2:= 0;
    codaux:= 0;
    cantpunto2:= 0;
    cantpunto4:= 0;
    inivector(v);

    while (L <> nil) do begin 
        codaux:= codaux + L^.data.codigo;
        cantpunto2:= 0;
        while (L <> nil) and (L^.data.codigo = codaux) do 
            //punto1 
            punto1(max1,max2,p1,p2,o);

            //punto2 
            if punto2(L^.data) and (L^.data.categoria = 2) then 
                cantpunto2:= cantpunto2 +1;
            
            //punto3
            v[L^.data.categoria]:= v[L^.data.categoria] + 1;

            //punto4 
            if punto4(L^.data.codigo) and (L^.data.categoria = 1) then 
                cantpunto4:= cantpunto4 +1;
            
            L:= L^.sig;
        end;
    
    writeln('punto1: ', p1,p2);
    writeln('punto2: ', cantpunto2);
        for i:= 1 to 7 do 
            writeln('punto3: ', v[i], i);
    writeln('punto4: ', cantpunto4); 
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.


