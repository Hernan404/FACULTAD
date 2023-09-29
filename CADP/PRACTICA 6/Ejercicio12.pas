program EJ12P6;
type 
    celular = record 
        version:real;
        tamanio:real;
        RAM:integer;
    end;

    lista = ^nodo
    nodo = record 
        data:celular
        sig:lista;
    end;

function puntoB (L:lista; c:celular):boolean;
begin 
    puntoB:= (c.RAM > 3) and (c.tamanio >= 5);
end;

procedure procesarDatos(L:lista);
var 
    cantdispositivos,ver,cantB:integer;
    promedio:real;
begin 
    ver:= 0;
    cantB:= 0;
    cantdispositivos:= 0;
    cargarlista(L,c);

    

    {CORTE DE CONTROL}
    while (L <> nil) do begin {si no llege al final de la lista}
        cantdispositivos:= 0; {inicio la cantidad a contar de lo que quiero}
        ver:= L^.data.version; {guardo el dato de la lista que va ser de anterior a una variable auxiliar}
        
        while (L <> nil) and (L^.dato.verion = ver) do begin {comparo el dato actual de la lista si es igual al anterior que guarde}
            cantdispositivos:= cantdispositivos +1;
            promedio:= L^.data.tamanio;
            if puntoB(L,c);
                cantB:= cantB +1;

            L:= L^.sig;
        end;
        {imprimo}
        writeln('la version ', ver, 'tiene ', cantdispositivos, 'dispositivos');
        cantC:= cantC +1;
    end;
    writeln('dispositivos con 3 de memoria y 5 pulgadas: ', cantB);
    writeln('promedio: ', promedio/cantC);
end;
