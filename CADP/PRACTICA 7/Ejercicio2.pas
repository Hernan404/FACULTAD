program EJ2P7;
type
    cliente = record 
    codigo:integer;
    DNI:integer;
    apellidoYnombre:string;
    codigoPoliza:1..6;
    montoBasico:real;
    end;

    lista = ^nodo; 
    nodo = record 
        datos:cliente;
        sig:lista;
    end;

    vector = array [1..6] of integer;

procedure leer (var d:cliente);
begin 
    with d do begin 
		writeln('codigo');
        readln(codigo);
        writeln('DNI');
        readln(DNI);
        writeln('apellido y nombre');
        readln(apellidoYnombre);
        writeln('codigo poliza');
        readln(codigoPoliza);
        writeln('monto basico');
        readln(montoBasico);
    end;
end;

procedure armarlista (L:lista; d:cliente);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 6 do begin 
        v[i]:= 0;
    end;
end; 

procedure cargarLista (var L:lista; var  d:cliente);
begin 
    repeat  
        leer(d);
        armarlista(L,d);
    until (d.codigo = 1122)
end;

procedure puntoA (var d:cliente; var montoAD:real);
begin 
    writeln('Estos son sus datos');
    writeln('DNI: ', d.DNI);
    writeln('Apellido y nombre', d.apellidoYnombre);
    writeln('Monto completo que paga mensual: ', d.montoBasico + montoAD);
end;

procedure puntoB (var d:cliente; var nomcumple:string);
var 
    cant9,digitos:integer;
begin 
    cant9:= 0;
    digitos:= 0;

    digitos := d.DNI mod 10;
    
    if (digitos = 9) then begin 
        cant9:= +1;
    end;

    d.DNI:= d.DNI div 10;

    if (cant9 > 2) then 
    nomcumple:= d.apellidoYnombre;
end;

procedure eliminar (var L:lista; d:cliente; var exito:boolean);
var 
    ant,act:lista;
begin 
    exito:= false;
    act:= L;

    while (act <> nil) and (L^.datos.codigo <> d.codigo) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (act <> nil) then begin 
        exito := true;
        if (act = L) then 
            L:= act^.sig
           
        else 
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesarDatos (L:lista);
var 
	exito:boolean;
	d:cliente;
    v:vector;
    montoAD:real;
    nomcumple:string;
    dnidel:integer;
begin 
	montoAD:= 0;
	nomcumple:= '';
    inivector(v);
    while (L <> nil) do begin
        puntoA(d,montoAD);
        puntoB(d,nomcumple);
        
    end;

     writeln('nombre de los que tienen al menos 2 digitos 9', nomcumple);
   
    writeln('ingrese dni a borrar');
    readln(dnidel);
    if (dnidel <> 0) then begin 
        eliminar(L,d,exito);
    end;
   
end;

var 
	d:cliente;
    L:lista;
begin 
    cargarLista(L,d);
    procesarDatos(L);
end.
