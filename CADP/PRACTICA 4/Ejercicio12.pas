program EJ12P4P1;
const 
    dimf = 5;
type
    galaxia = record
        nombre:string;
        tipo:string;
        masa:real;
        distancia:integer;

        eliptica:integer;
        espiral:integer;
        lenticular:integer;
        irregular:integer;
    end;

        
    rango = 1..dimf;
    vector = array [rango] of galaxia;



procedure leer_datos (var g:galaxia);
begin
	writeln('nombre');
    readln(g.nombre);
    writeln('tipo');
    readln(g.tipo);
    writeln('masa');
    readln(g.masa);
    writeln('distancia');
    readln(g.distancia);
    
end;

procedure cantgalaxias (var v:vector; var g:galaxia);
var 
    i:integer;
begin 
    for i:=1 to dimf do begin 
        if (v[i].tipo = 'eliptica') then begin
            v[i].eliptica := g.eliptica +1;
        if (v[i].tipo = 'espiral') then
            v[i].espiral := g.espiral +1;
        if (v[i].tipo = 'lenticular') then   
            v[i].lenticular := g.lenticular +1;
        if (v[i].tipo = 'irregular') then 
            v[i].irregular := g.irregular +1;

            g:= v[i]
        end;
    end;
end; 

procedure masa (var v:vector; var g:galaxia; var masa_total:real);
var 
    i:integer;
begin
    for i:=1 to dimf do begin 
        if (v[i].nombre = 'via lactea') or (v[i].nombre = 'andromeda') or (v[i].nombre = 'triangulo') then
            masa_total:= g.masa;
            g:= v[i];

        
    end;
end;

procedure gal_irregulares (var v:vector; var g:galaxia; galaxias_no:integer);
var 
    i:integer;
begin
    for i:= 1 to dimf do begin 
        if (v[i].tipo <> 'irregulares') and (v[i].distancia < 1000) then 
            galaxias_no:= galaxias_no +1;
    end;
end;

procedure max (var v:vector; var g:galaxia; var max1,max2:real);
var 
    i:integer;
begin
    for i:=1 to dimf do begin
        if (v[i].masa > max1) then begin
            max1:= g.masa;
            max2:= max1;
        end
    else 
        if (max1 > max2) then begin  
            max2:= g.masa;
        end;
    end;
end;

procedure min ( var min1,min2:real; var v:vector; var g:galaxia);
var 
	i:integer;
begin
    for i:=1 to dimf do begin
        if (v[i].masa < min1) then begin
            min1:= v[i].masa;
            min2:= min1;
        end
        
    else 
        if (min1 < min2) then begin 
            min2:= g.masa;
        end;
    end;
end;


procedure leer (var v:vector; var g:galaxia; var max1,max2:real; var min1,min2:real; var galaxias_no:integer; masa_total:real);
var 
    i:integer;
begin 
    for i:= 1 to dimf do begin 
        leer_datos(g);
        cantgalaxias(v,g);
        masa(v,g,masa_total);
        gal_irregulares(v,g,galaxias_no);
        max(v,g,max1,max2);
        min(min1,min2,v,g);
    end;
end;

var 
    g:galaxia;
    v:vector;

    cant_galaxias:integer;
    masa_total:real;
    galaxias_no:integer;

    max1,min1,max2,min2:real;

begin
	masa_total:= 0;
    galaxias_no:= 0;
    cant_galaxias:= 0;

    max1:= -1;
    max2:= -1;
    min1:= 9999;
    min2:= 9999;

    leer (v,g,max1,max2,min1,min2,galaxias_no,masa_total);

    writeln('la cantidad de galaxias de cada tipo: ', cant_galaxias );
    writeln('masa total de las 3 galaxias principales: ', masa_total );
    writeln('galaxias no irregulares', galaxias_no);
    writeln('las dos galaxias con mayor y menor masa: ', max1,max2,'y',min1,min2);
end.
