//vector con dimf y diml
begin
    diml:= 0;
    readln(num);

    while ((diml < dimf) and (num <> 50)) do begin 
        dimL:= dimL +1;
        v[dimL]:= num;
        read(num);
    end;
end;

// vector buscar 
function buscar (v:vector; diml:integer; valor:integer):boolean;
var 
    pos:integer;
    esta:boolean;
begin  
    esta:=false;
    pos:= 1;
    while (pos <= diml) and (not esta) do begin 
        if (v[pos]= valor) then esta:= true
        else 
            pos:= pos +1;
    end;

    buscar:= esta;
end;

//vector insertar 
function existe (v:vector; diml:integer; valor:integer):boolean;
var 
    pos:integer;
begin 
    pos:= 1;

    while ((pos <= diml) and (v[pos] < num)) do begin 
        pos:= pos +1;
    end;

    if ((pos <= diml) and (v[pos] = num)) then 
        buscar:= true;
    else 
        buscar:= false;
end;

//maximo de un vector
function maximo (v:vector; diml:integer):integer;
var 
    max,i:integer; 
begin 
    max:= -9999;
    for i:=1 to diml do begin 
        if (v[i] >= max) then max:= v[i];
    end;

    maximo:= max;
end;

// agregar 
procedure agregar (var v:vector; var diml:integer; var pude:boolean; num:integer);
begin 
    pude:= false;

    if ((diml +1) <= fisica) then begin 
        pude:= true;
        diml:= diml +1;
        v[diml]:= num;
    end;
end;

// eliminar 
var 
    i:integer;
begin 
    pude:= false;
    if (pos >= 1) and (pos <= diml) then begin 
        for i:= pos to (dim - 1) do 
            a[i]:= a[i+1];

        pude:= true;
        diml:= diml -1;
    end; 
end;
