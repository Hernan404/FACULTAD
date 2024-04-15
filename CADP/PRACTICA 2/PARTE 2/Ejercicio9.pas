Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número
de inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.


program EJ9P2P2;

procedure menores (numero:integer; apellido:string; var min1,min2:integer; var p1,p2:string);
begin
        if (numero < min1) then begin
                min2:= min1;
                p2:= p1;
                min1:= numero;
                p1:= apellido;
        end
        else if (min1 < min2) then begin
                        min2:= numero;
                        p2:= apellido;
        end;
end;

procedure mayores (numero:integer; nombre:string; var max1,max2:integer; var r1,r2:string);
begin
        if (numero > max1) then begin
            max2:= max1;
            r2:= r1;
            max1:= numero;
            r1:= nombre;
        end
        else if (max1 > max2) then begin
                max2:= numero;
                r2:= nombre;
        end;
end;

var
        apellido:string;
        nombre:string;
        numero:integer;
        min1,min2,max1,max2:integer; 
        p1,p2,r1,r2:string;
        por,porcentaje:real;
begin
	max1:= -1;
	max2:= -1;
	min1:= 9999;
	min2:= 9999;
	p1:= '';
	p2:= '';
	r1:= '';
	r2:= '';
	por:= 0;
        repeat
				writeln('NUMERO');
                readln(numero);
                writeln('APELLIDO');
                readln(apellido);
                writeln('NOMBRE');
                readln(nombre);

                menores(numero,apellido,min1,min2,p1,p2);
                mayores(numero,nombre,max1,max2,r1,r2);

                if ((numero mod 2)=0) then
                        por:= por +1;

        until numero = 1200;

        porcentaje:= por/1200*100;

        writeln('Apellido de los dos alumnos con número de inscripción más chico: ', p1 , ' y ' , p2);
        writeln('Nombre de los dos alumnos con número de inscripción más grande: ', r1 , ' y ' , r2);
        writeln('Porcentaje de alumnos con nro de inscripción par: ', porcentaje:2:0);

end.
