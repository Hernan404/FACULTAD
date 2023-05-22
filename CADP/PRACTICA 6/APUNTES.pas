pri = el puntero que se dispone

type 
    
    lista = ^nodo;

    nodo = record
        datos:integer; 
        sig:lista;
    end;


procedure recorrido(pri:lista);
begin
    while (list <> nil) do begin 
        write(list^.datos.nom, lista^.datos.edad)
        list:= list^.sig
    end;
end;


var 
    l:lista;


procedure agregarAdelante (var l:lista; per:persona);
var 
    nue:lista;
begin 
    new(nue)
    nue^.sig:= l;
    l:= nue;
end;





procedure agregarAlfinal (var pri:lista; per:personan)
var 
    act, nue: lista;
begin 
    new(nue);
    nue^.datos:= per;
    nue^.sig:= nil;
    if pri <> nil then begin 
        act:= pri;
        while (act^.sig <> nil) do act^.sig;
        act^.sig:= nue;
    end;
    else 
        pri:= nue;





procedure borrarElemento (var list:lista; nom:cadena50; var exito:boolean);
var 
    ant,act:lista;
begin  
    exito := false;
    act:= list;
    {recorro mientras no se termine la lista y no encuentro;}
    while (act <> nil) then begin 
        exito:= true;
            if (act = list) then list:= act^.sig;
                else
                    ant^.sig:= act^.sig;
                dispose (act);
            end;
end;

begin 
    cargarlista(l)
    read(nombre)
    borrarElemento(l,nombre,existo);
    if existo then write ('se elimino');
        else 
            write ('no existe');
    end;



procedure insertarElemento (var pri:lista; per:persona);
var 
    ant,nue,act:Lista;
begin 
    new(nue);
    nue^.datos := per;
    act:= pri;
    ant:= pri;
    {recorro mientras no se termine las lista y no encuentre la posicion correcta}
    while (act <> nil) and (act^.datos.nombre < per.nombre) do begin
        ant := act;
        act:= act^.sig;
    end;
    if (ant = act) then pri:= nue {dato va al principio}
        else ant^.sig := nue; {va entre dos o al final}
    nue^.sig := act;
end;
