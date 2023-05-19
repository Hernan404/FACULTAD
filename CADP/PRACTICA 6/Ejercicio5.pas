program EJ5P6;

type
    lista^ = ^nodo;
        nodo = record 
        num:producto;
        sig:lista;
    
    producto = record 
        codigo:integer;
        descripcion:string;
        stock_act:integer;
        stock_min:integer;
        precio:real;
    end;


procedure armarlista(L:lista; v:producto);
var 
    aux:lista;
begin 
    new(aux);
    aux^.num:= v;
    aux^.sig:= L;
    L:= aux;
    
end;

procedure leerdatos(listaF:lista);
begin 
    writeln('codigo');
    readln(codigo);
    writeln('descripcion');
    readln(descripcion);
    writeln('stock actual');
    readln(stock_act);
    writeln('stock minimo');
    readln(stock_min);
    writeln('precio');
    readln(precio);
end;

procedure stock_por_debajo(listaF:lista; pordebajo:integer);
begin 
    if (listaF^.stock_act < listaF^.stock_min) then begin 
        pordebajo:= listaF.stock_act;
        listaF:= listaF.sig
    end;
end;

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

procedure mas_economicos (listaF:lista);
begin 
    if (listaF^.precio < min1) then begin  
        min2:= min1
        min1:= listaF.num.precio;
        if (listaF^.precio < min2) then 
            min2:=listaF^.num.precio;
    end;
    listaF:= listaF^.sig;
end;

procedure imprimirnodo (listaF:lista);
begin 
    while (listaF <> nil) do begin 
        writeln(listaF^.num.codigo);
        writeln(listaF^.num.descripcion);
        writeln(listaF^.num.stock_act);
        writeln(listaF^.num.stock_min);
        writeln(listaF^.num.precio);
        writeln(listaF^.num.precio 2:2);
        listaF:= listaF^.sig
    end;
end;

var 
    pordebajo:integer;
    pares:integer;
    L:lista;
    prod:producto;
    min1,min2:integer;

begin
    pares:= 0;
    L:= nil;
    min1,min2:= 9999;
    L:= nil

    writeln('ingrese codigo');
    readln(L^.codigo);

    while L^.codigo <> -1 do begin 
        leerdatos(lista);
        armarlista(lista);
    end;

    stock_por_debajo(lista,pordebajo);
    trespares(lista,pares);
    mas_economicos(lista,min1,min2);

    writeln('productos con stock por debajo del minimo', pordebajo);
    writeln('codigos con tres pares' pares,);
    writeln('los 2 productos mas economicos' min1 , min2);
end;
