Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000

program EJ1P1P3;
var 
    codigo,p1:integer;
    cantinversiones:integer;
    monto,total,max:real;
    i,cant:integer;

begin 
    total:= 0;
    max:= -1;
    p1:= 0;
    cant:= 0;

 

    repeat 
		writeln('ingrese codigo');
		readln(codigo);
		
        writeln('cantidad de inversiones');
        readln(cantinversiones);
        
        writeln('ingrese el monto de las inversiones');
        for i:=1 to cantinversiones do begin
			      readln(monto);
			      total:= total + monto;
        end;
        
			if (total > 50000) then 
				cant:= cant +1;
          
			if (total > max) then begin
				max:= total;
				p1:= codigo;
			end;
        writeln('la empresa ', codigo ,' tiene monto promedio ', total/cantinversiones:2:0);
		    total:= 0;
		    monto:= 0;
        
    until codigo = 100;

    writeln('la empresa ',p1,' tiene la mayor inversion: ', max:2:0);
    writeln('hay ', cant ,' empresas con gran inversion');
    
end.
