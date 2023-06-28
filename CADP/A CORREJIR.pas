procedure listaviajes ();
var 
    aux:lista;
begin 
    new(aux)
    aux^.datos:= d;
    aux^.sig:= L;
    L:= sig;
end;


procedure masmonto (v:vector; max:integer);
var 
    i:integer;
begin 
    for i:=1 to 12 do begin 
        if (costoMonto > max) then 
            mayormes:= v[i]; 
    end;
end;

procedure promedios (var promedio:real; var cantViajes:integer);
begin 
    promedio:= cantPasajeros/cantviajes;
end;

procedure procesarDatos (L:lista);
var 
    max:integer;
    cantViajes:integer;
    promedio:real;
    mayormes:integer;
begin 
    inivector(v);
    while (L <> nil) do begin 
        cargarvector(v,d);
        cantViajes:= cantViajes +1;
        masmonto(v,max);
        promedios(promedio,cantViajes);
    end;
    {writes}
end;


var 
    L:lista;
begin
    cargarLista(L,d);
    procesarDatos(L);
end.
