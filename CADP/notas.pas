HACER 2 MINIMOS 

if (num < min1) then begin
  min2:=min1;
  min1:= num;
 end;
else
  begin 
    if (num < min2) then begin
        min2:= num;
    end;
    
    
    SACAR PARES DE DIGITOS
    
    procedure trespares (listaF:lista; pares:integer);
var 
    dig:integer;
    par:integer;
    codigo:integer;
begin 
    codigo:= listaF^.num.codigo;
    par:=0;
    while (codigo <> 0) do begin 
        dig:= codigo mod 10;
        if(dig mod 2) = 0) then begin 
            par:= par+1;
            codigo:= codigo div 10;
        end;
        else
            codigo:= codigo div 10;
    if (par >= 3) then begin 
        writeln('desc de codigo' listaF^.num.codigo, 'es', listaF.num.descripcion);
        par:= 0;
end 
else 
    begin 
        par:= 0;
end;
