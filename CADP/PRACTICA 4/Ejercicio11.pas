program EJ11P4P1;

const 
	dimf = 2;
type
	

    fotos = record
        titulo:string;
        autor:string;
        cantMegusta:integer;
        cantClick:integer;
        cantComents:integer;
    end;
    
    rango= 1..dimf;
    vector = array [rango] of fotos;

procedure leer_datos (var f:fotos);
begin
	writeln('titulo');
    readln(f.titulo);
    writeln('autor');
    readln(f.autor);
    writeln('cantidad de megusta');
    readln(f.cantmegusta);
    writeln('cantidad de clicks');
    readln(f.cantClick);
    writeln('cantidad de comentarios');
    readln(f.cantComents);
end;

procedure masvista (var v:vector; var f:fotos; var max:integer; var fotomasvista:string);
var
	i:rango;
begin
	for i:= 1 to dimf do begin
		if (v[i].cantClick > f.cantClick) then 
			f:= v[i];
    end;
end;

procedure megustas (v:vector; f:fotos);
var
	i:rango;
begin
	for i:=1 to dimf do begin
		if (v[i].autor = 'Art Valenday') then
			f:= v[i];
	end;
end;

procedure cantcomentarios (v:vector; f:fotos);
var
	i:rango;
begin
	for i:=1 to dimf do begin
		f:= v[i];
    end;
end;

procedure leectura (var f:fotos; var v:vector; max:integer; var fotomasvista:string; var cantidad_comentarios:integer);
var
    i:rango;
begin
    for i:= 1 to dimf do begin
        leer_datos (f);
        masvista(v,f,max,fotomasvista);
        megustas(v,f);
        cantcomentarios(v,f);
    end;
end;


var 
    max:integer;
    fotomasvista:string;

   { megustasfoto:integer;}

    cantidad_comentarios:integer;

    f:fotos;
    v:vector;
begin
    max:= -1;
    leectura(f,v,max,fotomasvista,cantidad_comentarios);
    

    writeln('foto mas vista: ', f.cantClick);
    writeln('cantidad de me gusta: ', f.cantMegusta);
    writeln('cantidad de comentarios: ', f.cantComents);

end.
