
program EJ5P7;
type
    dispone = record 
        patente:string;
        anio_fabricacion:integer;
        capacidad:integer;  
    end;

    camion = record 
        codigo:integer;
        codigo_camion:1..100;
        KMdistancia:real;
        ciudad_destino:string;
        anioviaje:integer;
        DNI:integer;
    end;
var 


begin 
    cargarlista (L);
    procesarDatos(L);
end;

program seguntafechatema2
type 
    rangoGenero = 1..5;
    sesiones = record 
        titulo:string;
        nombre:string;
        genero:rangoGenero;
        anio_estreno:integer;
        reproducciones:integer;
    end;

    lista = nodo
    nodo = record 
        datos:sesiones;
        sig:lista;
    end;

    vector = array [rangoGenero] of integer;

procedure cargarlista( var L:lista);
procedure insertarOrdenado (L:lista; valor:sesion);

function evaluarDigitos (num:integer):boolean;
var 
    digito,suma:integer;
begin 
    suma:= 0;
    
    while (num <> 0) do begin 
        digito := num mod 10
        suma:= suma + digito 
        num := num div 10;
    end;

    evaluarDigitos:= (suma mod 5 = 0)
end;


function cumple(i:rangoGenero; rep:integer);
begin 
    cumple:= (i = 1) or (i = 3) and (evaluarDigitos(rep))
end;

procedure calcularMinimos (v:vector; var cod1,cod2:integer);
var 
    i:rangoGenero
    min1,min2:integer;
begin 
    min1:= 9999;
    min2:= 9999;
    for i:=1 to 5 do begin 
        if (v[i] < min) then begin 
            min2:= min1;
            cod2:= cod1;
            cod1:= i;
            min1:= v[i];
        end
        else if(v[i] < min2) then begin 
                min2:= v[i];
                cod2:= i;
            end;
end;

procedure recorrerL2 (L:lista);
var 
    cantsesiones,totalrep,anioact:integer;

begin 
    while (L <> nil) do begin 
        añoAct:= L.datos.anio;
        cantsesiones:= 0;
        totalrep:= 0;

        while (L <> nil) and (L.datos.anio = anioact) do begin 
            cantsesiones := cantsesiones +1;
            totalrep:= totalrep + L.datos.reproducciones;
            L:= L.sig;
        end;
        writeln(cantsesiones);
    end;
end;

procedure procesarLista(L:lista; cod1,cod2:rangoGenero; var L2:lista);
var 
    v:vector;
begin
    iniciovector(v);

    while (L <> nil) do begin 
        v[L.datos.genero]:= v[L.datos.genero] + L.datos.reproducciones;
        if (cumple(L.datos.genero, L.datos.reproducciones)) then 
            insertarOrdenado(L2,L.datos);
        
        L:= sig;
    
    end;
    calcularMinimos(v,cod1,cod2);
end;

var 
    L:lista;
    cod1,cod2:rangoGenero;
begin 
    cargarlista(L); //se dispone
    L2 := nil;
    procesarLista(L,cod1,cod2,L2);
    puntoC(L2);

    writeln(cod1,cod2);
end;


