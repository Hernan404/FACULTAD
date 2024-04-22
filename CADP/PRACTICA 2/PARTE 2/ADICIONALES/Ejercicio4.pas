realizar un programa que analice información de planetas obtenida
del Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la
distancia (medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe
procesarse. Informar:
● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra
(12.700 km) y mayor o igual que el de Marte (6.780 km).
● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km)

program EJ4P2P2ADICIONAL;

procedure procesardatos(nombre:string; radio,distancia,diametro,perimetro:real; var cant:integer);
var 
	nombreA:string;
	distanciaA:real;
	cant:integer;
begin 
	nombreA:= '';
	distanciaA:= 0;

	
	if (diametro <= 12.700) and (diametro >= 6.780) then begin 
		nombreA:= nombre;
		distanciaA:= distancia;
	end;
	if (perimetro > 439.264) then begin 
		cant:= cant +1;
	end;
	
	if (radio <> 0) then begin 
		writeln('punto A: ', nombreA,distanciaA);
		writeln('punto B: ', cant);
	end;
end;

var 
	nombre:string;
	radio,distancia,diametro,perimetro:real;
	cant:integer;
	
begin
	diametro:= 0;
	perimetro:= 0;
	cant:= 0;
	writeln('nombre');
	readln(nombre);
	writeln('radio');
	readln(radio);
	while (radio <> 0) do begin 
		readln(distancia);
		diametro:= radio * 2;
		perimetro:= radio * 3.14 * 2;
		
		procesardatos(nombre,radio,distancia,diametro,perimetro,cant);
		
		writeln('nombre');
		readln(nombre);
		writeln('radio');
		readln(radio);
	end;

end.

