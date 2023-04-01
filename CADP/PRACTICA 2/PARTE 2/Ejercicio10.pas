program EJ10P2P2;

procedure subru (numerosF:longint;   var sumapar,cantimpar:integer );
var
    digitos:integer;
    
begin
    while (numerosF <> 123456) do begin
		
        digitos:= numerosF mod 10;

        if (digitos div 2 = 0) then 
            sumapar:= sumapar + digitos
        else
            cantimpar:= cantimpar +1;
            
        numerosF:= numerosF DIV 10
    end;
end;


var 
    sumapar,cantimpar:integer;
	numeros:longint;

begin
    cantimpar:= 0;
    
    sumapar:= 0;
    
	readln(numeros);
	
    subru(numeros,sumapar,cantimpar);

    writeln('suma de pares', sumapar);
    writeln('cantidad de impares', cantimpar);
end.
