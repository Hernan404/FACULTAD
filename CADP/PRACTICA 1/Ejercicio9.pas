{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter,
debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia
de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de
números, e imprimir el resultado final}
program EJ9P1;
var 
    total,num:integer;
    car:char;
    
begin 
    writeln('ingrese caracter "+" o "-" ');
    readln(car);
    if (car <> '+') and (car > '-') then  
         write('error')
    else begin
        write ('ingrese numero ');
        read(num);
        total:=num;

            while (num <> 0) do begin 
                write('ingrese numero ');
                read(num);

                if (car = '+') then 
                    total:= total + num;
                else
		   total:= total - num;
            end;
		writeln('el resultado es: ', total);
	end;
end.
