program EJ16P6;
type 
    corredores = record 
        nombreYapellido:string;
        distancia:real;
        tiempo:real;
        PYC_inicio:string;
        PYC_fin:string;
    end;

    lista = ^nodo;
    nodo = record 
        data:corredores;
        sig:lista;
    end;

procedure armarlista (L:lista; c:corredores);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= c;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargarlista (L:lista,c:corredores);
begin 
    while (c.distancia <> -1) do begin 
        leer(c);
        cant:= cant +1;
        distanciaTotal:= distanciaTotal + a.distancia
        armarlista(L,c);
    end;
end;

function puntoB (cant:integer):boolean;
var 
    max:integer;
begin 
    max:= -1;
    if (cant > max) then 
        max:= cant 
        puntoB:= true;
end;

procedure procesarDatos (L:lista);
var 
    cant,cantcumpleD:integer;
    promedioC,promedioE,distanciaTotal,tiempoTotal:real;
    cumpleB:string;

begin 
    cant:= 0;
    distanciaTotal:= 0;
    tiempoTotal:= 0;
    promedio:= 0;
    promedioC:= 0;
    promedioE:= 0;

    while (L <> nil) do begin 
        cant:= cant +1;
        distanciaTotal:= distanciaTotal + L^.data.distancia
        tiempoTotal:= tiempoTotal + L^.data.tiempo;
        
        if puntoB(cant) then 
            cumpleB:= L^.data.PYC_inicio;
        
        if (L^.data.PYC_inicio = 'brasil') then 
            promedioC:= promedioC + L^.data.distancia;
        
        if (L^.data.PYC_inicio <> L^.data.PYC_fin) then 
            cantcumpleD:= cantcumpleD +1;
        
        if (L^.data.PYC_inicio = 'boston') then 
            promedioE:= promedioE + L^.data.tiempo;
        
    end;    
    writeln ('punto A: ', cant , distanciaTotal, tiempoTotal);
    writeln ('punto B: ', cumpleB)
    writeln ('punto C: ', promedioC/distanciaTotal);
    writeln ('punto D: ', cantcumpleD);
    writeln ('punto E: ', promedioE/tiempoTotal);
end;

var 
    cant:integer;
    c:corredores;
    L:lista;
begin 
    cant:= 0;
    L:= nil;
    cargarlista(L);
    procesarDatos(L);
end.



