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

procedure actualizar ();
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

procedure maspuntaje ();
begin 
    if (d.puntaje > max) then begin 
        max:= d.puntaje;
        puntoB:= d.codigoGenero;
    end;
end; 

procedure par ();
begin 
    if ()
end;
var 
    d:pelicula;
    v:vector;
    max:integer;
begin
    max:= -1;
    inicializarVector();
    cargarDatos();
end;



