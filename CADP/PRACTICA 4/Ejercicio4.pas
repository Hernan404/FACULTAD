program EJ4P4;
const 
	dimf = 100;
type 
	vector = array [1,,dimf] of integer

procedure posicion (x:integer; v:vector; pos:integer);
var 
	i:integer;
begin 
	pos:= -1;
		for i:=1 to dimf do begin 
			if (v[i] = X) then 
				pos:= v[i];
		end;
	end;
end;

procedure intercambio (x,y:integer; v:vector);
var 
	i:integer; aux:integer;
begin
	readln(x);
	readln(y);
	
	
	for i:=1 to dimf do begin 
		v[aux]:= x;
		v[x]:= y;
		v[y]:= v[aux]; 
	end;
end;

procedure sumavector (v:vector; var suma:integer);
var 
	i:integer;
begin 
	for i:=1 to dimf do begin 
		suma:= v[i] + suma;
	end;
end;

procedure promedio (v:vector,var promedio:real);
var 
	i:integer; total:integer;
begin 
	for i:=1 to dimf do begin 
		total:= total + v[i];
	end;
	promedio:= total/dimf;
end;

procedure elementomaximo (v:vector;var  posMAX:integer);
var 
	i:integer; max:integer;
begin 
	max:= -1; posMAX:= 0;
	for i:=1 to dimf do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			posMAX:= i;
		end;
	end;
end;

procedure elementominimo (v:vector, var posMIN:integer);
var 
	i,min:integer; 
begin 
	min:= 999;
	for i:=1 to dimf do begin 
		if (v[i] < min) then begin 
			min:= v[i];
			posMIN:= i;
		end;
	end;
end;

var 
	v:vector; posMIN,posMAX,x,y,pos:integer; prom:real;
begin 
	posicion(x,v,pos);
	intercambio(x,y,v);
	sumavector(v,suma);
	promedio(v,prom);
	elementomaximo(v,posMAX);
	elementominimo(v,posMIN);
end.
