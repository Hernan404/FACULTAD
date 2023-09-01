program EJ7P2P2;

procedure cantidad (var sumaD:integer; var num:integer; var cantdigitos:integer);
var 
    digitos:integer;
begin 
	digitos:= 0;
    
		digitos:= num mod 10;
        cantdigitos:= cantdigitos +1;
        sumaD:= sumaD + digitos;
		num:= num div 10;
		
  
    
end;

var 
    num,cantdigitos,sumaD:integer;
begin 
	
		cantdigitos:= 0;
		sumaD:= 0;
		writeln('ingrese numero');
		readln(num);
	 
		cantidad(sumaD,num,cantdigitos);
		
		writeln('cantidad de digitos: ', cantdigitos);
end.
