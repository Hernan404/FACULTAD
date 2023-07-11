program EJ7P7;
type 
    rangonota = 1..24;
    alumno = record 
        numero:integer;
        nombreYapellido:string;
        mail:string;
        anio_ingreso:integer;
        anio_egreso:integer;
        nota:rangonota;
    end;

    lista = ^nodo;
    nodo = record 
        datos:alumno;
        sig:lista;
    end;

    vector = array [1..24] of integer;

procedure armarnodo (L:lista; a:alumno);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= a;
    aux^.sig:= L;
    L:= aux;
end;
procedure leer(var a:alumno);

procedure cargarlista (L:lista);
var 
    a:alumno;
begin 
    leer(a);
    while (a.numero <> -1) do begin 
        leer(a);
        armarnodo(L,a);
    end;
end;

procedure inivector (var v:vector);
var 
    i:rangonota;
begin 
    for i:=1 to 24 do begin 
        v[i]:= 0;
    end;
end;

function soloimpares (a:alumno):boolean;
var 
    par,impar,digito:integer;
begin 
    par:= 0;
    impar:= 0;

    while (a.numero <> 0) do begin 
        digito:= a.numero mod 10;
        if ((digito mod 2) = 0) then begin 
            par:= par +1;
        end
        else
            impar:= impar +1;
    end;
        a.numero:= a.numero div 10;
    

    soloimpares:= (par = 0);
	
end;

function cumpleB (a:alumno):boolean;
begin 
    cumpleB:= (a.anio_ingreso = 2012) and (soloimpares(a));
end;

procedure puntoC (var L,p1,p2:lista; var min1,min2:integer; var a:alumno);
begin 
    if ((L^.datos.anio_egreso - L^.datos.anio_ingreso) < min1) then begin 
        min2:= min1;
        p2:= p1;
        min1:= (L^.datos.anio_egreso - L^.datos.anio_ingreso);
        p1:= L;
    end
    else 
        if ((L^.datos.anio_egreso - L^.datos.anio_ingreso) < min2) then begin 
            min2:= (L^.datos.anio_egreso - L^.datos.anio_ingreso);
            p2:= L;
        end;
    
end;

procedure eliminar (var pri:lista; a:alumno; var exito:boolean);
var 
    ant,act:lista;
    numero:integer;
begin 
	readln(numero);
	
    exito:= false;
    act:= pri;

    while (act <> nil) and (act^.datos.numero <> a.numero) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (act <> nil) then begin 
        pri:= act^.sig;
    end
    else 
        ant^.sig:= act^.sig;
    dispose(act);
end;

procedure procesarLista (L:lista);
var 
    v:vector;
    a:alumno;
    cantcumpleB:integer;
    min1,min2,cumpleC1,cumpleC2:integer;
    cantalumnos,promnotas:integer;
    p1,p2:lista;
    a:alumno;
    exito:boolean;
begin 
	cantcumpleB:= 0;
	promnotas:= 0;
    min1:= 9999;
    min2:= 9999;
    cantalumnos:= 0;
    inivector(v);

    while (L <> nil) do begin 
        promnotas:= promnotas + v[L^.datos.nota];

        soloimpares(a);
        if cumpleB(L^.datos) then begin 
            cantcumpleB:= cantcumpleB +1;
        end;
        puntoC(L,p1,p2,min1,min2,a);

    end;
    writeln('punto A', promnotas/24);
    writeln('punto b', cantcumpleB);
    writeln('punto C', p1^.datos.nombreYapellido, ' y ', p1^.datos.mail,'y', p2^.datos.nombreYapellido, 'y', p2^.datos.mail);
   
    eliminar(L,a,exito);
end;

var 
    L:lista;
begin 
    L:= nil;
    cargarlista(L);
    procesarLista(L);
end.
