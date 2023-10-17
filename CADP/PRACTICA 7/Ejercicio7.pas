program EJ7P7;
const 
    materias = 1..24;
type 
    alumno = record 
        numero:integer;
        apellidoYnombre:string;
        mail:string;
        ingreso:integer;
        egreso:integer;
        nota:materias;
    end;

    lista = ^nodo
    nodo = record 
        data:lista;
        sig:lista;
    end;

    vector = array [materias] of integer;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 24 do begin 
        v[i]:= 0;
    end;   
end;

procedure leer(var a:alumnos);
begin 
    with a do begin 
        readln(numero);
        readln(apellidoYnombre);
        readln(mail);
        readln(ingreso);
        readln(egreso);
        readln(nota);
    end;
end;

procedure armarlista(pri:lista; a:alumnos);
var 
    ant,nue,act:lista;
begin 
    new(nue);
    nue^.data:= a;
    act:= pri;
    ant:= pri;

    while (act <> nil) and (act^.data.numero < a.numero) do begin 
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then 
        pri:= nue
    else 
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure cargardatos(L:lista)
var 
    a:alumnos;
begin 
    leer(a);

    while (o.numero <> -1) do begin 
        armarlista(L,a);
        leer(a);
    end;
end;

function pares2 (num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;
    while (digito > 0) do begin 
        digito:= num mod 10;

        if (digito mod 2 = 0) then 
            par:= par +1;
        else 
            impar:= impar +1;
    
    num:= digito div 10;
    end;

    pares2:= (impar > 0) and (par = 0);
end;

function punto2 (a:alumnos):boolean;
begin 
    punto2:= (a.ingreso = 2012) and (pares2(L^.data.numero));
end;

function punto3(var a:alumnos;  var min1,min2,p1,p2:integer);
begin 
    
    if (a.egreso < min1) then begin 
        min2:= min1;
        p2:= p1;
        p1:= a.apellido;
        min1:= a.egreso;
    end 
    else  
        if (min1 < min2) then begin  
            min2:= a.egreso;
            a2:= a.apellido;
        end;
end;


end;

procedure procesarDatos(L:lista);
var 
    a:alumnos;
    v:vector;
    i:integer;
    cant2:integer;
    min1,min2,p1,p2:integer;
    notasTotal:integer;
    promedio:real;
begin
    min1:= -1;
    min2:= -1;
    p1:= 0;
    p2:= 0;

    notasTotal:= 0;
    cant2:= 0;
    promedio:= 0;
    while (L <> nil) do begin
        //punto 1
        for i:=1 to 24 do begin  
            notasTotal:= v[i];
        end;
        promedio:= notasTotal/24;
        //punto 2
        if punto2(L^.data) then 
            cant2:= cant2 +1;
        //punto 3
        punto3(a,min1,min2,p1,p2);

        L:= L.sig;
    end;
    writeln('promedio de notas: ', promedio);
    writeln('cantidad de alumnos que cumplen punto 2: ', cant2);
    writeln('los que mas rapido se recibieron', 'apellido:'  p1,'apellido', p2)
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesarDatos(L);
end.








