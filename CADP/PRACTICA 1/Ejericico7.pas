program EJ7P1;

var
	codigo:integer;
	precioACT, precioNUEV, porcentajeDiez:real;
	
begin
	repeat
		read(codigo);
		read(precioACT);
		read(precioNUEV);
		porcentajeDiez := (10*precioActual)/100;
		if (precioNuevo > precioActual + porcentajeDiez) then
			write('el precio del producto aumento mas de un 10 por ciento');
			else
				write ('el precio del producto no aumento mas de un 10%');
	until (codigo=32767);

end.
