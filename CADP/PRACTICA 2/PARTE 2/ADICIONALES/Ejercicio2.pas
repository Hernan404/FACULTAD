{Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de
números, la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)}


program EJ2P2P2ADICIONAL;

procedure proceso (x,y:integer; var suma,producto:integer);
var 
    i:integer;
begin 
    for i:=x to y do begin 
        suma:= suma + i;
        producto:= producto * i;
    end;
    
end;
var 
    i,x,y,suma,producto:integer;
begin 
	producto:= 1;
    i:= 0;
	suma:= 0;
    for i:=1 to 10 do begin 
        writeln('NUMERO Y');
        readln(y);
        writeln('NUMERO X');
        readln(x);

        if (y mod 2 = 0) and (x mod 2 = 0) then begin 
            proceso(y,x,suma,producto);
        end
        else begin 
            writeln('numero no es par');
		end;
		writeln('suma: ', suma);
		writeln('producto: ', producto);	
    end;
    
end.
