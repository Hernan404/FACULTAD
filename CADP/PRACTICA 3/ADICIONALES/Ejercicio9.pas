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
		writeln('localidad');
        readln(localidad);
        writeln('apellido');
        readln(apellido);
        writeln('cant votos');
        readln(cantVotos);
        writeln('canti Votantes');
        readln(cantVotantes);
    end;
end;

procedure mayorvotos(var d:datos; var max:real; var maxvotos:string);
begin 
    if (d.cantVotos > max) then begin
        max:= d.cantVotos;
        maxvotos:= d.apellido;
    end;
end;

procedure mayorporcentaje (var maxporcentaje:real; var d:datos; var cumpleB:string);
var 
	porcentaje:real;
begin 
	porcentaje:= (d.cantVotos*10) /100;

    if (porcentaje > maxporcentaje) then begin
        maxporcentaje:= porcentaje;
        cumpleB:= d.apellido;
    end;
end;

procedure procesarDatos (var d:datos; max:real; maxvotos:string; maxporcentaje:real; cumpleB:string);
begin
    repeat 
        leer(d);
        mayorvotos(d,max,maxvotos);
        mayorporcentaje(maxporcentaje,d,cumpleB);
    until (d.localidad = 'zarate');
    
    writeln('intendente mayor cantidad de votos ', maxvotos);
    writeln('intendente mayor porcentaje ', cumpleB);
end;

var 
	max:real;
    d:datos;
    maxporcentaje:real;
    cumpleB:string;
    maxvotos:string;
begin 
    max:= -1;
    maxporcentaje:= -1;
	maxvotos:= '';
	cumpleB:= '';
	
    procesardatos(d,max,maxvotos,maxporcentaje,cumpleB);

    
end.
