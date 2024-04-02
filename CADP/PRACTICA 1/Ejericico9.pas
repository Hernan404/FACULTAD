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
                    total:= total + num
                else
					total:= total - num;
            end;
		writeln('el resultado es: ', total);
	end;
end.
