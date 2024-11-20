{
una frabrica de automoviles necesita un programa para administrar 900000 piezas de los 
diferentes modelos de automoviles que fabrica, de cada pieza se conoce, descripccion, cantidad de stock 
costo de la pieza, codigo de modelo al que pertenece (1 al 10), al stock minimo y su peso en kg 

A. leer y almacenar la informacion de las piezas en una estructura de datos adecuada. la informacion 
debe quedar almacenada en el mismo orden que fue leida

B. a partir de la estructura generada en A. se requiere: 
    1. realizar una lista de las piezas cuyo stock actual sea igual al stock minimo 
    2. calcular el promedio de piezas que pesan mas de 1kg y su codigo de piezas posea al menos 3 digitos multiplos de 2 
    3. utilizando la lista generada en B) calcular e informar los dos codigos de piezas mas costosas cuyo codigo de modelo 
    sea menor que 5 }

program TEMA2;
const 
    modelos = 10;
    MAX_PIEZAS = 30000;
type 
    rango_modelos = 1..modelos;

    pieza = record 
        descripccion: string;
        cantstock: integer;
        costo: real;
        codigoModelo: rango_modelos;
        stockmin: integer;
        peso: real;
    end;

    lista = ^nodo;
    nodo = record 
        data: pieza;
        sig: lista;
    end;

procedure leer(var r: pieza);
begin 
    with r do begin 
        readln(descripccion);
        readln(cantstock);
        readln(costo);
        readln(codigoModelo);
        readln(stockmin);
        readln(peso);
    end;
end;

procedure armarlista(var pri: lista; r: pieza); 
var  
   act, nue : lista;
begin 
   new(nue);
   nue^.data := r;
   nue^.sig := NIL;
   if pri <> NIL then begin
       act := pri;
       while (act^.sig <> NIL) do
           act := act^.sig;
       act^.sig := nue;
   end else
       pri := nue;
end;

procedure cargardatos(var L: lista);
var 
    r: pieza; 
    i: integer;
begin 
    for i := 1 to MAX_PIEZAS do begin 
        leer(r);
        armarlista(L, r);
    end;
end;

function cumpleB(r: pieza): boolean;
var 
    cantmultiplos: integer;
    cod: integer;
begin 
    cantmultiplos := 0;
    cod := r.codigoModelo;

    while (cod > 0) do begin 
        if (((cod mod 10) mod 2) = 0) then
            cantmultiplos := cantmultiplos + 1;
        cod := cod div 10;
    end;

    cumpleB := (r.peso > 1) and (cantmultiplos >= 3);
end;

procedure procesardatos(L, L2: lista);
var 
    cantpiezas: integer; 
    prom: real; 
begin 
    prom := 0; 
    cantpiezas := 0;
    while (L <> nil) do begin 
        if (L^.data.cantstock = L^.data.stockmin) then 
            armarlista(L2, L^.data);
        
        cantpiezas := cantpiezas + 1;
        if (cumpleB(L^.data)) then 
            prom := prom + 1; // Incrementar el contador de piezas que cumplen la condición

        L := L^.sig;
    end;
    if cantpiezas > 0 then
        writeln('Promedio de piezas que cumplen B: ', prom / cantpiezas:0:2);
end;

procedure mascostos(L2: lista; var p1, p2: real; var max1, max2: real);
begin 
    p1 := -1;
    p2 := -1;
    max1 := -1;
    max2 := -1;

    while (L2 <> nil) do begin 
        if (L2^.data.codigoModelo < 5) then begin
            if (L2^.data.costo > max1) then begin
                max2 := max1;
                p2 := p1;
                max1 := L2^.data.costo;
                p1 := L2^.data.codigoModelo;
            end else if (L2^.data.costo > max2) then begin
                max2 := L2^.data.costo;
                p2 := L2^.data.codigoModelo;
            end;
        end;
        L2 := L2^.sig;
    end;
end;

procedure procesarSegundalista(L2: lista);
var 
    p1, p2: real;
    max1, max2: real;
begin
    mascostos(L2, p1, p2, max1, max2);
    writeln('Los dos códigos de piezas más costosas son: ', p1:0:2, ' y ', p2:0:2);
end;

var 
    L, L2: lista;
begin 
    L := nil;
    L2 := nil;
    cargardatos(L);
    procesardatos(L, L2);
    procesarSegundalista(L2);
end.
