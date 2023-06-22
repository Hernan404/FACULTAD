procedure ej1p7;
type 
    actores = record 
        DNI:integer;
        apellido:string;
        nombre:string;
        edad:integer;
        codigo:1..7;
    end;

    lista = ^nodo;
    nodo = record 
        datos:actores;
        sig:lista;
    end;

    vector = array [1..7] of integer;

procedure armarnodo(var L:lista; var d:actores);
var 
    aux:lista;
begin 
	new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    aux:= lista;
end;

procedure masElegido (var v:vector; max1:integer; max2:integer );
var 
	i:integer;
begin 
    for i:=1 to 7 do begin 
        if (v[i] > max1) then begin  
            max2:= max1;
            max1:= v[i];
        end
        else begin 
            if (v[i] > max2) then 
                max2:= v[i];
        end;
    end;
end;

procedure dnipares (var dnicumple:integer; d:actores);
var 
    dig:integer;
    par:integer;
    impar:integer;
    dnipar:integer;
begin
    dnipar:= d.DNI; 
    par:= 0;
    impar:= 0;
    while (dnipar <> 0) do begin 
        dig:= dnipar mod 10;
        if ((dig mod 2) = 0) then begin 
            par:= par +1;
            dnipar:= dnipar div 10
        end
        else begin 
            impar:= impar +1;
        end;
    end;

    if (par > impar) then 
        dnicumple:= dnicumple +1;
end;

function buscar (L:lista; var DNIa:integer; var encontre:boolean): boolean;

begin 
    encontre:= false;
    while (L <> nil) and (not encontre) do begin 
        if (DNIa = L^.datos.DNI) then 
            encontre = true
        else 
            encontre = false;
        end;
    buscar:= encontre;
end;

procedure eliminar (var pri:lista; var DNIa:integer; var exito:boolean);
var
    ant, act: lista;
begin 
    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.datos.DNI <> DNIa) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure eliminarDNI (var L:lista; var d:actores; var DNIa:integer; var encontre:boolean);
var 
	pri:lista;
	exito:boolean;
begin 
    writeln('ingrese DNI a eliminar');
    readln(DNIa);
    buscar(L,DNIa,encontre);
    if (encontre) then begin 
        eliminar(pri,DNIa,exito);
    end;
end;


procedure procesarDatos(var DNIa:integer; var encontre:boolean; var L:lista; var d:actores; var v:vector; var dnicumple:integer; var max1:integer; var max2:integer);
begin
    repeat 
        leer(d);
        ordenarnodo(L,d);
        cargarvector(v);
        dnipares(dnicumple,d);
        masElegido(max1,max2);
    until d.DNI = 335;

    eliminarDNI(L,d,DNIa,encontre);
end;



var 
    DNIa:integer;
    L:lista;
    d:actores;
    max1:integer;
    max2:integer;
    dnicumple:integer;
    exito:boolean;
    v:vector;
    encontre:boolean;
begin
	encontre:=false;
	DNIa:= 0;
	exito:= false;
    max1:= -1;
    max2:= -1;
    dnicumple:= 0;
    procesarDatos(DNIa,encontre,L,d,v,dnicumple,max1,max2);

    writeln('Cantidad de documentos con mas pares que impares: ', dnicumple);
    writeln('el primer codigo mas elegido: ', max1);
    if (exito) then 
        writeln('el DNI: ' , DNIa , ' se elimino correctamente');
end.
