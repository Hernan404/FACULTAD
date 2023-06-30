
program EJ1P7;
type 
    actores = record
        DNI:integer;
        apellidoYnombre:string;
        edad:integer;
        codigo:1..7;
    end;

    delete = record 
        DNI2:integer;
    end;

    lista = ^nodo; 
    nodo = record 
        datos:actores;
        sig:lista;
    end;

   { lista2 = ^nodo;
    nodo = record 
        datos:delete;
        sig:lista2;
    end;}

    vector = array [1..7] of integer;

procedure leer(var d:actores);
begin
	with d do begin 
    writeln('DNI');
    readln(DNI);
    writeln('edad');
    readln(edad);
    writeln('codigo');
    readln(codigo);
	end;
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 7 do begin 
        v[i]:= 0;
    end;
end;

procedure cargarVector(var v:vector; d:actores);
var 
    i:integer;
begin 
    for i:= 1 to 7 do begin 
        v[i]:= d.codigo;
    end;
end;
procedure armarlista (var L:lista; d:actores);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargarLista (L:lista);
var 
	d:actores;
begin 
    repeat 
        leer(d);
        armarlista(L,d);
    until (d.DNI = 3355); 
end;

procedure puntoA(var d:actores; var cantCumple:integer);
var 
    par,impar,digitos:integer;
begin
    par:= 0;
    impar:= 0;
    digitos:= 0;

    digitos:= d.DNI mod 10; 
    if (digitos mod 2 = 0) then begin 
        par:= par +1;
        d.DNI:= d.DNI div 10;
    end
    else 
        begin
        impar:= impar +1;
        d.DNI:= d.DNI div 10;
    end;

    if (par > impar) then 
        cantCumple:= cantCumple +1;
end;

procedure puntoB (vc:vector; var max1,max2:integer; var cumpleB1,cumpleB2:integer);
var 
    i:integer;
begin 
	for i:=1 to 7 do begin 
    if (vc[i] > max1) then begin 
        max1:= max1;
		max1:= vc[i];
        cumpleB1:= i;
    
    end
    else 
        begin 
            if (vc[i] > max2) then 
                max2:= vc[i];
                cumpleB2:= i;
        end;
    end;
end;

{procedure armarlista2 (var L2:lista2; b:delete);
var 
    aux:lista2;
begin 
    new(aux)
    aux ^.delete:=b;
    aux ^.sig:= L;
    L:= sig;
end;}

procedure eliminar (var L:lista; var d:actores; b:delete; var exito:boolean);
var 
    act,ant:lista;
begin 
    exito:= false;
    act:= L;
    {recorro mientras no se termina la lista y no encuentre el elemento}
    while (act <> nil) and (act^.datos.DNI <> b.DNI2) do begin 
        ant:= act;
        act:= act^.sig
    end;


    if (act <> nil) then begin 
        exito:= true;
        if (act = L) then 
            L:= act^.sig
        else 
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

procedure procesarDatos (L:lista);
var 
    cumpleB1:integer;
    cumpleB2:integer;
    cantCumple:integer;
    max1,max2:integer;
    tipo:1..7;
    v:vector;
    d:actores;
begin 
	max1:= -1;
	max2:= -1;
    cantCumple:= 0;
    cumpleB1:= 0;
    cumpleB2:= 0;

    inivector(v);
    while (L <> nil) do begin 
		tipo:= L^.datos.codigo;
		v[tipo]:= v[tipo] +1;
        puntoA(d,cantCumple);
        puntoB(v,max1,max2,cumpleB1,cumpleB2);
        

    end;
    
    writeln('cantidad de personas con DNI digitos pares: ', cantCumple);
    writeln('los codigos de generos mas elegidos: ', cumpleB1 , cumpleB2);
end;

var 
    d:actores;
    L:lista;
    b:delete;
   
    exito:boolean;
begin 
	L:= nil;
    cargarLista(L);
    procesarDatos(L);

    writeln('ingrese DNI a elliminar');
    readln(b.DNI2);
        {armarlista2(L2);}
        eliminar(L,d,b,exito);
    
end.
