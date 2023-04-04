program EJ11P2P2;

procedure leer (var numero:integer; var apellido,nombre:string);
begin
		writeln('ingrese numero');
		readln(numero);
		writeln('ingrese apellido');
		readln(apellido);
		writeln('ingrese nombre');
		readln(nombre);
end;


procedure minimos (numero:integer; var apellido:string; var apellido_maschico1,apellido_maschico2:string; var numero_masbajo1,numero_masbajo2:integer);
begin

		
		
		
		if (numero < numero_masbajo1) then begin
			numero_masbajo1:= numero;
			apellido_maschico1:= apellido;
		end
			else
				begin
					if (numero < numero_masbajo2) then
						numero_masbajo2:= numero;
						apellido_maschico2:= apellido;
				end;
		
		
end;
procedure maximos (numero:integer; var nombre:string; var nombre_masgrande1,nombre_masgrande2:string; var numero_masalto1,numero_masalto2:integer);
begin

		if (numero > numero_masalto1) then begin
			numero_masalto1:= numero;
			nombre_masgrande1:= nombre;
		end
			else
				begin
					if (numero > numero_masalto2) then
						numero_masalto2:= numero;
						nombre_masgrande2:= nombre;
				end;
		
end;

procedure pares (numeros:longint; var cantalupar:integer);
begin
	if (numeros mod 2 = 0) then
			cantalupar:= cantalupar +1;

end;


var
	numero:integer;
	apellido,nombre:string;
	
	apellido_maschico1:string;
	apellido_maschico2:string;
	
	nombre_masgrande1:string;
	nombre_masgrande2:string;
	
	numero_masbajo1:integer;
	numero_masalto1:integer;
	
	numero_masbajo2:integer;
	numero_masalto2:integer;


	cantalupar:integer;
	cant_total:integer;
	
	por:integer;
	
begin
	numero_masbajo1:= 9999;
	numero_masbajo2:= 9999;
	numero_masalto1:= -1;
	numero_masalto2:= -1;
	cant_total:= 0;
	cantalupar:= 0;
	
	repeat begin
	cant_total:= cant_total+1;
	
	leer (numero,apellido,nombre);
	minimos (numero,apellido,apellido_maschico1,apellido_maschico2,numero_masbajo1,numero_masbajo2);
	maximos (numero,nombre,nombre_masgrande1,nombre_masgrande2,numero_masalto1,numero_masalto2);
	pares(numero,cantalupar);
	
	end;
	until numero = 1200;
	
	por:= (cantalupar / cant_total)*100;
	
	writeln('alumnos mas chicos: ', apellido_maschico1 , apellido_maschico2);
	writeln('alumnos mas grandes: ', nombre_masgrande1 , nombre_masgrande2); 
	writeln('cantidades ', cant_total, cantalupar);
end.
