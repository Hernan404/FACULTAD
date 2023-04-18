program EJ8P4;

const 
    dimf = 2;
type
    informacion = record
        num:integer;
        DNI:integer;
        apellido: string;
        nombre:string;
        anio:integer;
end;
vector = array [1..dimf] of informacion; 


procedure leer (var v:vector; var c:informacion);
begin
	writeln('numero');
    readln(c.num);
    writeln('DNI');
    readln(c.DNI);
    writeln('apellido');
    readln(c.apellido);
    writeln('nombre');
    readln(c.nombre);
    writeln('anio');
    readln(c.anio);
end;

procedure pares (var v:vector; var c:informacion; var DNIpares:integer; var dig:integer);
var
    impar:integer;
begin
    impar:= 0;
    while (c.DNI <> 0) do begin
        dig:= c.DNI DIV 10;
end;
if (impar >= 1) then 
    DNIpares:= 0
else 
    DNIpares  := DNIpares +1;
end;

procedure maximo (var v:vector; var c:informacion;  max,max2:integer);
begin
        if (c.anio > max) then begin
            max2:= max;
            max:= c.anio;
        end
        
        else
            if (c.anio > max2) then begin
                max2:= c.anio;
            end;
end;


var 
    c:informacion;
    v:vector;
    DNIpares:integer;
    max,max2:integer;
    dig:integer;
    i:integer;
    diml:integer;
begin
    max:= -1;
    max2:= -1;
	diml:= 1;
    for i:=diml to dimf do begin
        leer(v,c);
        pares(v,c,DNIpares,dig);
        maximo(v,c,max,max2);
    end;

    
    writeln('dni pares', DNIpares);
    writeln('mayor edad', max);
end.
