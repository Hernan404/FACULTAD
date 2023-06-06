program EJ10P6;

type 
    lista = ^nodo
        nodo = record
        num:integer;
        sig:lista;
        end;

    data = record 
        DNI:integer;
    end;
    
procedure armarNodo (L:lista; var D:data);
var 
    aux:lista;
begin 
    new(aux);
    aux^.num:= D;
    aux^.sig:= L;
    L:= aux;
    
end;

procedure agregarAdelante (L:lista; var D:data; var posicion:integer);
var
    nue:lista;
begin 
    new(nue);
    nue^.D:= DNI;
    nue^.sig:= L;
    L:= nue;
    posicion:= posicion +1
end;


procedure recibirCliente (L:lista; var D:data; posicion:integer);
begin 
    while (DNI <> 0) and (L <> nil) do begin 
        writeln('ingrese DNI');
        readln(data.DNI);
        leer(L,D,numeroAct);
        agregarAdelante(L,D,posicion);
        codigo := posicion;
        writeln('este es tu posicion: ', codigo ,' en la lista de espera');
    end;
end;



procedure atenderCliente (var L:lista; D:data; var exito:boolean);
var 
    ant,act:lista;
begin 
    while (DNI <> 0) and (then begin 
        writeln('el cliente con el numero: ', codigo ,'y DNI: ', L^.D.DNI ,' toca ser atendido');
        ant:= act;
        act:= act^.sig
    end;

    if (act <> NIL) then begin 
        exito:= true;
        if(act = L) then 
            pri:= act^.sig;
        else
            begin 
                ant^.sig:= act^.sig;
                dispose (act);
                writeln('Cliente atendido')
            end;
    end;
end; 

var 
    L:lista;
    D:data
    codigo,numeroAct:integer;
    
begin 
    L:= nil;
    numeroAct:= 0;
    codigo:= 0;
    recibirCliente(L,D,posicion);
    while (DNI <> 0) and (L <> nil) do begin 
        writeln('ingrese DNI');
        readln(data.DNI);
        leer(L,D,numeroAct)
    end;
end.
