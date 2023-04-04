program EjerciciosAdd;
procedure A(letrasf:char;var contadorf:integer;var cumpleAf:boolean);
begin
    while(letrasf <> '$') and (letrasf <> '%')do
    begin
        readln(letrasf);
        contadorf:=contadorf+1;
    end;
//____________________________________________________________________________________________
    if (letrasf = '%') then
    begin
        cumpleAf:=true;
    end;
        
end;
//___________________________________________________________________________________________
procedure B(letrasfB:char;var contadorfB:integer;var cumpleB:boolean);
var 
    arroba:integer;
    contadorB:integer;
begin
    arroba:=0;
    contadorB:=0;
    cumpleB:=false;
    while(arroba<3) and (contadorB<contadorfB) and (letrasfB <> '*')   do
    begin
        readln(letrasfB);
        contadorB:=contadorB+1;
        if(letrasfB = '@' )then
        begin
            arroba:=arroba+1;
        end;
        
    end;
    if(letrasfB = '*') then
        begin
            cumpleB:=true;
        end;
    
    
    
end;

//___________________________________________________________________________________________
var
  letras:char;
  contador:integer;
  cumpleA:boolean;
begin
    contador:=0;
    cumpleA:=false;
    read(letras);
    A(letras,contador,cumpleA);
    if (cumpleA)then
    begin
        B(letras,contador,cumpleA);
    end;
end.
