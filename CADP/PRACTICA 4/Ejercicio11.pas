{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez
finalizada la lectura, el programa debe procesar los datos e informar:
a. Título de la foto más vista (la que posee mayor cantidad de clics).
b. Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program EJ11P4;
const 
  dimf = 200;
type 
  foto = record 
    titulo: string;
    autor: string;
    cantMG: integer;
    cantClicks: integer;
    cantComentarios: integer;
  end;

  vector = array[1..dimf] of foto;

procedure cargar(var v: vector);
var 
  i: integer;
begin 
  for i := 1 to dimf do begin 
    writeln('Ingrese el título de la foto ', i, ':');
    readln(v[i].titulo);
    writeln('Ingrese el autor de la foto ', i, ':');
    readln(v[i].autor);
    writeln('Ingrese la cantidad de Me gusta de la foto ', i, ':');
    readln(v[i].cantMG);
    writeln('Ingrese la cantidad de clics de la foto ', i, ':');
    readln(v[i].cantClicks);
    writeln('Ingrese la cantidad de comentarios de la foto ', i, ':');
    readln(v[i].cantComentarios);
  end;
end;

procedure procesar(v: vector; var max: integer; var p1: string; var totalMG: integer);
var 
  i: integer;
begin 
  for i := 1 to dimf do begin 
    // Título de la foto más vista (la que posee mayor cantidad de clics).
    if (v[i].cantClicks > max) then begin 
      max := v[i].cantClicks;
      p1 := v[i].titulo;
    end;
    
    // Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo "Art Vandelay".
    if (v[i].autor = 'Art Vandelay') then 
      totalMG := v[i].cantMG + totalMG;
    
    // Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
    writeln('Foto: ', v[i].titulo, ' - Cantidad de comentarios: ', v[i].cantComentarios);
  end;
end;

var 
  p1: string;
  v: vector;
  max: integer;
  totalMG: integer;
begin 
  totalMG := 0;
  max := -1; // Inicializamos max en -1 para buscar la mayor cantidad de clics.
  p1 := '';
  
  cargar(v);
  procesar(v, max, p1, totalMG);
  
  writeln('La foto más vista es: ', p1);
  writeln('La cantidad total de Me gusta de "Art Vandelay" es: ', totalMG);
end.
    
    
