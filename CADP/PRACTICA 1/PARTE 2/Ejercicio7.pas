Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se
lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100
autos. Informar en pantalla:
● Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
● Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.

program EJ87P1P2;
var 
    nombre:string;
    tiempo:real;
    max1,max2,min1,min2:real;
    p1,p2,u1,u2:string;
    i:integer;
begin 
   
    max1:= -1;
    max2:= -1;
    min1:= 9999;
    min2:= 9999;
    
    for i:=1 to 100 do begin 
	readln(nombre);
	readln(tiempo);
		
        if (tiempo > max1) then begin 
            max2:= max1;
            p2:= p1;
            max1:= tiempo;
            p1:= nombre;
        end 
        else if (max2 > max1) then begin 
                max2:= tiempo;
                p2:= nombre;
        end;

        if (tiempo < min1) then begin 
            min2:= min1;
            u2:= u1;
            min1:= tiempo;
            u1:= nombre;
        end 
        else  if (min1 < min2) then begin  
                min2:= tiempo;
                u2:= nombre;
        end;
    end;
    writeln('los primeros puestos son ', p1 ,'y', p2);
    writeln('los ultimos puestos son ', u1 ,'y', u2); 
end.
