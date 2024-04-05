Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
program ej3p1;
var 
    num1,num2,num3:integer;
begin 
    read(num1) 
    read(num2)
    read(num3) 

    if (num1 > num2) and (num1 > num3) and (num2 > num3) then
        write(num1,num2,num3)
    else if (num3 > num3) then 
        write(num1,num2,num3)
    
    if (num2 > num1) and (num2 > num3) and (num1 > num3) then 
        write(num2,num1,num3)
    else if (num3 > num1) then 
        write(num2,num3,num1)
    
    if (num3 > num1) and (num3 > num2) and (num2 > num1) then 
        write(num3, num2, num1)
    else if (num1 > num2) then 
        write(num3,num1,num2)
end.
