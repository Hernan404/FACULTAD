{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}


program EJ3P3;
const 
	dimf = 150;
type 
	vector = array [1..dimf] of integer;

procedure cargarvector(var v:vector);
var 
	i:integer;
begin 
	for i:= 1 to dimf do 
		v[x]:= 0;
end;

procedure puntoA (v:vector); 
var 
	i:integer; 
begin 
	for i:=1 to dimf do begin 
		writeln(v[x],'');
		writeln();
	end;
end;

procedure puntoB (v:vector);
var 
	i:integer;
begin 
	for i:= dimf downto 1 do 
		writeln(v[x],'');
		writeln();
end;


procedure incisoC (v:vector);
var 
	i:diml:integer;
begin 
	diml:= dimf div 2;
	for x:= diml downto 1 do begin 
		writeln(v[i], '');
		writeln();
		diml:= diml +1;
		for i:= diml to dimf do begin 
			writeln(v[i],'');
			writeln();
		end;
	end;
end;


procedure incisoD (v:vector; i,y:integer);
var 
	ini:integer;
begin 
	if (i < y) then  
		for ini:= i to y do  
			writeln(v[ini],'');
	else 
		for int:= y downto i do 
			writeln(v[ini],'');
			writeln();
	end;

var 
	v:vector;
	i:integer;
begin 
	cargarvector(v);

	puntoA(v);
	puntoB(v);
	puntoC(v);

	writeln('numero 1: ');
	readln(i);
	writeln('numero 2: ');
	readln(y);
	inciso(v,i,y);

====================================
solucion propia
program EJ3P4;
const 
	dimf = 100;
type 
	vector = array [1..dimf] of integer;
	
procedure puntoA(v:vector; dimf:integer);
var 
	i:integer;
begin 
	for i:=1 to dimf do begin 
		writeln(v[i]);
	end;	 
end;

procedure puntoB(v:vector; dimf:integer);
var 
	i:integer;
begin 
	for i:=dimf downto 1 do begin 
		writeln(v[i]);
	end;	 
end;

procedure puntoC(v:vector);
var 
	i:integer; mitad:real;
begin 
	
		
	mitad:= diml div 2;
	
	for i:= mitad downto 1 do begin  
		writeln(v[i]);
			
		mitad:= mitad +1;
		
		for i:= mitad to dimf do 
			writeln(v[i]);
	end;
end;

procedure puntoD(v:vector; dimf:integer; X,Y:integer);
var 
	i:integer;
begin 
	if (Y < X) then begin 
		for i:=X to Y do 
			writeln(v[i]);
	end
	else 
		for i:=Y downto X then 
			writeln(v[i]);
	end;
end;




var 
	v:vector;
	diml:integer;
	X,Y:integer;
begin 
	puntoA(v);
	puntoB(v);
	
	readln(X);
	readln(Y);
	puntoC(v,dimf,diml,X,Y);
end.

