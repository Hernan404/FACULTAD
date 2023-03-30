program EJ8P2P2;
procedure leer (var precio:real; var codigo:integer; var tipo:string);
begin

		writeln('ingrese precio');
		readln(precio);
		writeln('ingrese codigo');
		readln(codigo);
		writeln('ingrese tipo de producto');
		readln(tipo);	
end


procedure codigoBarato (precio:real; var cod_masbarato:real; codigo: integer; var min: real; tipo);
begin
if ( precio < min) then begin
				min:= codigo;
				cod_masbarato:= min;
			
			end;



end;

procedure pantaloncaro (precio:real; max:real; codigo:integer; var cod_pant_barato; tipo:string);
begin
if (tipo = 'pantalon') then begin
				if (codigo > max) then
					max:= codigo;
					cod_pant_mascaro:= max;
			end;
end;
var
	precio:real;
	codigo:integer;
	tipo:string;
	
	producto:real;

	
	
	cod_masbarato: real;
	cod_pant_mascaro: real;
	promedio: real;
	
	min,max: real;
begin
	producto:=0;
	min:= 999;
	max:= -1;
	
	repeat 
		producto:= producto +1;
		
		
			
			
			
	until producto = 3;
	
		

	writeln('producto mas barato', cod_masbarato);
	writeln('pantalon mas caro', cod_pant_mascaro);
	
	promedio:= precio*3 / producto;
	writeln('precio promedio', promedio);
	 



end.
