program Vectores;
 const
 dimF=300;
 aumento=1.15;
 
 type
    str20=string[20];
    
    vector =  Array [1..dimF] of real;

//_________________________________________________________________________________
procedure leer_salarios(var salarioF:vector;var dimL:integer);
var
    i:integer;
begin
    i:=1;
    readln(salarioF[i]);
    while ((i<dimF) and (salarioF[i]<>0)) do
    begin
        i:=i+1;
        ReadLn(salarioF[i]);
    end; 
    dimL:=i;
end;

//_________________________________________________________________________________
procedure aumentar_salarios(var salarios:vector;dimL:integer);
var 
    i:integer;
begin
    for i:=1 to dimL do
        begin
            salarios[i]:=salarios[i]*aumento;
        end;
end;
//_________________________________________________________________________________
procedure Promedio_empresa(salarios:vector;dimL:integer;var promedio:real);
var
    suma_total:real;
    i:integer;
begin
    suma_total:=0;
    for i:=1 to dimL do
    begin
        suma_total:=suma_total+salarios[i];
    end;
    promedio:=suma_total/dimL;

end;
//_________________________________________________________________________________
var
    dimL:integer;
    salarios:vector;
    salario_Indi:real;
    promedio:real;
begin
    promedio:=0;
    dimL:=1;
    leer_salarios(salarios,dimL);
    WriteLn('A___________________');
    aumentar_salarios(salarios,dimL);
    WriteLn('B___________________');
    Promedio_empresa(salarios,dimL,promedio);
    WriteLn('El promedio es: ', promedio:4:3);
end.
