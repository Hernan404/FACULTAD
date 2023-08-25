program EJ9P3;

type 
    datos = record 
        localidad:string;
        apellido:string;
        cantVotos:integer;
        cantVotantes:integer;
    end;




procedure leer (var d:datos);
begin 
    with d do begin 
        readln(localidad);
        readln(apellido);
        readln(cantVotos);
        readln(cantVotantes);
    end;
end;

procedure mayorvotos(var d:datos; var max:integer; var maxvotos:string);
begin 
    if (d.cantVotos > max) then begin
        max:= d.cantVotos;
        maxvotos:= d.apellido;
    end;
end;

{procedure mayorporcentaje (var maxporc:real; var d:datos; var cumpleB:string);
var 
	porcentaje:real;
begin 
	porcentaje
    if (porcentaje > maxporc) then begin
        maxporc:= porcentaje;
        cumpleB:= d.apellido;
    end;
end; }

procedure procesarDatos (var d:datos; max:integer; var maxvotos:string; maxporc:real);
begin
    repeat 
        leer(d);
        mayorvotos(d,max,maxvotos);
    until (d.localidad = 'zarate');

    writeln('intendente mayor cantidad de votos ', maxvotos);
   { writeln('intendente mayor porcentaje ', cumpleB);}
end;

var 
	max:integer;
    d:datos;
    
    maxporc:real;
    {cumpleB:string;}
    maxvotos:string;
begin 
    max:= 0;
    maxporc:= 0;

    procesardatos(d,max,maxvotos,maxporc);
end.
