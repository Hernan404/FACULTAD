program EJ6P4;https://github.com/Hernan404/FACULTAD/edit/main/CADP/PRACTICA%204/%20%20%20%20%20%20%20%20%20%20%5BREVISAR%5D%20Ejercicio6.pas
const 
	dimf = 100;
type 
	vector = array [1..dimf] of integer;
 
 

procedure cargar(var v:vector; num:integer);
var 
	i:integer;
begin 
	for i:=1 to dimf do begin 
		readln(num);
		v[i]:= num;
	end;
end;
 
procedure proceso (var v:vector);
 var 
	i:integer;
	num:integer;
	posMAX,posMIN:integer;
	aux:integer;
begin 
	max:= -1; min:= 999; posMAX:= 0; posMIN:= 0;
	
	
	for i:=1 to dimf do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			posMAX:= i;
		end;
	
		if (v[i] < min) then begin 
			min:= v[i];
			posMIN:= i;
		end;
	end;
	
	for i:=1 to dimf do begin 
		v[aux]:= v[posMIN];
		v[posMIN]:= v[posMAX];
		v[posMAX]:= v[aux];
	end;
	writeln('el elemento máximo', max 'que se encontraba en la posición' posMAX 'fue intercambiado con el elemento mínimo' min 'que se encontraba en la posición' posMIN
end;
   
 var 
	v:vector; num:integer;
begin 
	readln(num);
	cargar(v,num);
	proceso(v);
    
end.    
