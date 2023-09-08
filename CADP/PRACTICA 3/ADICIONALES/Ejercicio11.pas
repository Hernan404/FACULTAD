program EJ11P3;
type
    avion = record
        codigo:integer;
        pais_salida:string;
        pais_llegada:string;
        cantKM:integer;
        porcentaje_ocu:real;
    end;
    
procedure leer(var a:avion);
begin 
		writeln('codigo de avion');
        readln(a.codigo);
        writeln('pais de salida');
        readln(a.pais_salida);
        writeln('pais de llegada');
        readln(a.pais_llegada);
        writeln('cantidad de km recorridos');
        readln(a.cantKM);
        writeln('porcentaje de ocupacion');
        readln(a.porcentaje_ocu);

end; 

procedure maskm (a:avion; var max1,max2,m1,m2:integer);
begin 
    if (a.cantKM > max1) then 
        max2:= max1;
        m2:= m1;
        max1:= a.cantKM;
        m1:= a.codigo;
    if (max1 > max2) then 
        max2:= a.cantKM;
        m2:= a.codigo;
end;

procedure menosKM (a:avion; var min1,min2,l1,l2:integer);
begin 
    if (a.cantKM < min1) then begin
        min2:= min1;
        l2:= l1;
        min1:= a.cantKM;
        l1:= a.codigo
    end
    else 
        if (min2 < min1) then 
            min2:= a.cantKM;
            l2:= a.codigo;
    end;

function puntoC(a:avion):boolean;
begin 
    puntoC:= (a.cantKM > 5000) and (a.porcentaje_ocu < 60);
end;

function puntoD(a:avion):boolean;
begin
    puntoD:= (a.cantKM < 10000) and ((a.pais_llegada = 'australia') or (a.pais_llegada = 'nueva zelanda'));  
end;

procedure procesarDatos (var a:avion);
var 
    max,max1,max2:integer;
    m1,m2:integer;
    l1,l2:integer;
    min1,min2:integer;
    cantcumpleD,cantcumpleC:integer;
    paisNUE,paisACT:integer;
    cantdif:integer;
    cumpleB:integer;
   
begin
	cumpleB:= 0;
    cantdif:= 0;
    cantcumpleC:= 0;
    max:= -1;
    cantcumpleD:= 0;
    max1:= -1;
    max2:= -1;
    min1:= 9999;
    min2:= 9999;
    
    
    paisACT:= a.codigo;
    leer(a);
    paisNUE:= a.codigo;
    maskm(a,max1,max2,m1,m2);
    menoskm(a,min1,min2,l1,l2);
   
    if puntoC(a) then begin
        cantcumpleC:= cantcumpleC +1;
    end;

    if puntoD(a) then begin 
        cantcumpleD:= cantcumpleD +1;
    end;

    if (paisACT <> paisNUE) then begin 
        cantdif:= cantdif +1;
        if (cantdif > max) then 
            max:= cantdif;
            cumpleB:= cumpleB +1;
    end;

    writeln('los dos aviones con mas KM ', m1 , m2);
    writeln('los dos aviones con menos KM ', l1 , l2);
    writeln('el avion que salio de mas paises diferentes ', cumpleB);
    writeln('cantidad de vuelos de mas de 5k km y con 60% etc ', cantcumpleC);
    writeln('la cantidad de vuelos de mas de 10k km con aus o nzl etc', cantcumpleD);

   end;

var
    a:avion;
begin 
	leer(a);
   while (a.codigo <> 44) do begin 
	procesarDatos(a);
   end;
end.
