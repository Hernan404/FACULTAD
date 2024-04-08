program EJ8P1P1;
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
