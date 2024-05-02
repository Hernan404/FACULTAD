
{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program EJ7P4P1;
type 
	vector = array [1..10] of integer; 

procedure cargarV(var v:vector; num:integer);
begin 
	while (num > 0) do begin 
		v[num mod 10]:= v[num mod 10] +1;
		num:= num div 10;
	end;
end; 


procedure proceso (var v:vector);
var 
	i,num:integer;
begin 

	for i:=1 to 10 do
		v[i]:= 0;

	writeln('numero');
	readln(num); 

	while (num <> -1) do begin 
		cargarV(v,num);
		writeln('numero');
		readln(num);
	end; 

procedure imprimir (v:vector);
var 
	i:integer;
	masleido,num:integer;
begin 
	masleido:= 0;
	for i:=1 to 10 do begin 
		if(v[i] <> 0) then 
			writeln('el numero ', x - 1,': ',v[i],'veces');
		if (masleido < v[i]) then begin 
			masleido:= v[i];
			num:= x-1;
		end;
	end;
	writeln('el numero mas leido es ', num);

	writeln('numeros sin ocurrencias: ');
		for i:=1 to 10 do begin 
			if (v[i] = 0) then 
				writeln('el numero: ', x-1);
		end;
end; 

var 
	v:vector;
begin 
	proceso(v);
	imprimir(v);
end.
