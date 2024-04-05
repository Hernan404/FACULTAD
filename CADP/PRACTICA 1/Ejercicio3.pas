Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
program ej3p1;
var 
    num1,num2,num3:integer;
begin 
    read(num1) 
    read(num2)
    read(num3) 

    if (num1 > num2) and (num1 > num3) then 
    begin 
        if (num2 > num3) then 
            writeln(num1, num2, num3) 
        else 
            write(num1, num3, num2)
    end;

    else if (num2 > num1) and (num2 > num3) 
    begin 
        if (num1 > num3) then 
            writeln(num2, num1, num3) 
        else 
            writeln(num2, num3, num1)
    end

    else
    begin 
        if (num1 > num2) then 
            writeln(num3, num1, num2)
        else 
            writeln(num3, num2, num1)
    end;
end.
