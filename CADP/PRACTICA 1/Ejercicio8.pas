{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de
ellos no lo era. Por ejemplo:
○ Si se leen los caracteres “a e o”, deberá informar: Los tres son vocales
○ Si se leen los caracteres “z a g”, deberá informar: Al menos un carácter no era vocal}
program EJ8|P1;
var 
    a:char;
    b:char;
    c:char;
begin 
    read(a);
    read(b);
    read(c);

    if (a = 'a') or (a = 'e') or (a = 'i') or (a = 'o') or (a = 'u') then begin 
        if (b = 'a') or (b = 'e') or (b = 'i') or (b = 'o') or (b = 'u') then 
            if (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') then 
                write('las tes son vocales');
    end
    else 
        write('al menos una no era vocal');
end.
