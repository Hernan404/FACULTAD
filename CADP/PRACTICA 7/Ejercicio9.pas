program EJ9P7;
type 
    rango = 1..8
    pelicula = record 
        codigoPelicula:integer;
        tituloPelicula:integer;
        codigoGenero:rango;
        puntajePromedio:real;
    end;

    vector array [rango] of integer;

procedure leer ();
begin 
    writeln('DNI del critico');
    readln(DNI);
    writeln('apellido y nombre');
    readln(apellidoYnombre);
    writeln('codigo de pelicula');
    readln(codigo_pelicula);
    writeln('puntaje otorgado');
    readln(puntaje);
end;

procedure actualizar (var pri:lista; d:pelicula);
var 
    ant,nue,act:lista;
begin 
    new(nue);
    nue^.datos:= per;
    act:= pri;
    ant:= pri;

    while (act <> nil) and (act^.datos.codigo < d.codigo) do begin 
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then 
        pri:= nue;
    else 
        ant^.sig:= nue;
    nue^.sig := act;
end;

procedure maspuntaje ();
begin 
    if (d.puntaje > max) then begin 
        max:= d.puntaje;
        puntoB:= d.codigoGenero;
    end;
end; 

procedure par (num:longint; var par,impar:integer);
var 
    digitos:integer;
begin 
    digitos:= DNI mod 10;
        if (digitos div 2 = 0) then 
            par:= digitos;
        else 
            impar:= impar +1;
    if (par > impar) then 
        writeln('nombre con mas pares' apellidoYnombre);
        
    DNI:= DNI DIV 10;
end;

procedure procesarDatos ();
begin  
    inivector();
    inilista();
    leer();
    actualizar();

var 
    d:pelicula;
    v:vector;
    max:integer;
begin
    max:= -1;
    inicializarVector();
    cargarDatos();
end;



