program EJ3P7;

type 
    viaje = record 
        numero:integer;
        codigo:integer;
        odireccion:string;
        dDireccion:string;
        km:real;
    end;

    lista1 = ^nodo;
    nodo = record 
        data:viaje;
        sig:lista1;
    end;

    lista2 = ^nodo;
    nodo = record 
        data:viaje;
        sig:lista2;
    end;

procedure armarnodo1 (var L:lista; d:data);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure armarnodo2 (var L:lista; d:data);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= d;
    aux^.sig:= L;
    L:= aux;
end; 

procedure leer (var d:data);
begin 
    with d do begin 
    readln(numero);
    readln(codigo);
    readln(odireccion);
    readln(dDireccion);
    readln(km);
    end;
end;
procedure maskm(var d:data; var max1,max2:integer);
begin 
    if (L^.d.km > max1) then begin 
        max2:= max1;
        max1:= codmax1;
        KLmax1:= L^.d.km;
        codmax1:= L^.d.codigo;
    end;
    else 
        if (d.km > max2) then begin  
            max2:= d.codigo;
            codmax2:= L^.d.codigo;
        end;
end;

procedure listaViajes (L:lista; d:data);
begin 
    if(d.km > 5) then 
        armarnodo2(L,d);
        cant:= cant +1;
    end;
end;

procedure InsertarOrdenado (var ListaNueva:lista; V:viaje);
var 
    ant,nue,act:lista;
begin
    new(nue);
    nue^.datos:=V;
    act:=ListaNueva;
    ant:=ListaNueva;
    while (act <>nil) and (act^.datos.num_viaje<V.num_viaje) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if(ant = act)then
    begin
        ListaNueva:=nue;
    end
    else
    begin
        ant^.sig:=nue;
    end;    
end;

begin
    ListaNueva:=nil;
    codmax1:=-1;
    codmax2:=-1;
    klmax1:=-1;
    klmax2:=-1;
    while L <> Nil do
    begin
        cantKM:=0;
        act:=L^.datos.cod_auto;
        while (L<>Nil) and (act=L^.datos.cod_auto) do
        begin
            if(L^.datos.klrecorrido>5)then
            begin
                InsertarOrdenado(ListaNueva,L^.datos);
            end;
            cantKM:=cantKM+L^.datos.klrecorrido;
            L:=L^.sig;  
        end;
        actualizarMaximos(L,codmax1,codmax2,klmax1,klmax2);
    end;
end;

procedure cargardatos (L:lista; d:data);
begin 
    repeat 
        leer(d);
        armarnodo1(L,d);
        maskm(d,max1,max2);
        listaviajes(L,d);
    until cant = 6;
end;
