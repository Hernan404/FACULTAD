
{una fabrica de automoviles necesita un programa para administrar las piezas de los diferentes modelos de automoviles
que fabrica. de cada pieza, se conoce: codigo de pieza, descripcion, cantidad en stock, costo de la pieza, codigo de 
modelo al que pertenece(1 al 10), stock minimo. la lectura finaliza al leer el codigo de pieza 9999 el cual debe procesarse 

A. leer y almacenar la informacion de las piezaas en una estructura de datos adecuada. la informacion debe quedar 
almacenada en el mismo orden que fue leida 

B. a partir de la estructura generada en A) calcular e informar 
    1. los 2 codigos de modelo d automoviles mas baratos de fabricar 
    2. el promedio de piezas con codigo de modelo 3 y cuyo codigo de pieza comienza en 9 
    3. cual es el codigo de peiza en que la fabrica debera gastar mas dinero para que su stock actual supere
    en una unidad a su stock minimo.}

program PARCIAL;
const 
    modelos = 10;
type 
    rango_modelos = 1..modelos;

    pieza = record 
        codigo:integer;
        descripcion:string;
        cantStock:integer;
        costo:real;
        modelo:rango_modelos;
        stockminimo:integer;
    end;

    lista = ^nodo;
    nodo = record 
        data:pieza;
        sig:lista;
    end;
    
    vector = array [rango_modelos] of real;

procedure leer(var r:pieza);
begin 
    with r do begin 
        readln(codigo);
        readln(descripcion);
        readln(cantStock);
        readln(costo);
        readln(modelo);
        readln(stockminimo);
    end;
end;

procedure armarlista(var pri:lista; r:pieza); 
var  
   act, nue : lista;
begin 
   new (nue);
   nue^.datos:= r;
   nue^.sig := NIL;
   if pri <> Nil then 
   begin
       act := pri;
       while  (act^.sig <> NIL) do 
           act := act^.sig ;
       act^.sig := nue ;
   end
   else
       pri:= nue;
end;

procedure cargardatos(L:lista);
var 
    r:pieza;
begin 
    repeat 
        leer(r);
        armarlista(r);
    until (r.codigo <> 9999);
end;


procedure puntoA(var r:pieza; var min1,min2:real; p1,p2:integer; v:vector);
var 
    i:integer;
begin 
    for i:=1 to modelos do begin 
        if (v[i] < min1) then begin 
            min2:= min1;
            p2:= p1;
            min1:= v[i];
            p1:= r.costo;
        end 
        else if (v[i] < min2) then begin 
            min2:= v[i];
            p1:= r.costo;
        end;
    end;
end;

function cumple2 (cod: integer): boolean;
var
    primerDigito: integer;
begin
    // Extraer el primer dígito dividiendo sucesivamente
    while (cod >= 10) do
        cod := cod div 10;
        
    primerDigito := cod; // Al final del bucle, 'cod' contendrá el primer dígito

    // Verificar si el primer dígito es 9
    cumplePrimerDigito9 := (primerDigito = 9);
end;



function cumple2(r:pieza):boolean; 
begin 
    cumple2:= (r.modelo = 3) and (cumpleDigito(r.codigo));
end;

procedure punto3 (p:pieza; var maxCosto:real; var codMax:integer);
var 
    costoAdicional:real;
begin 
    if (p.cantStock < p.stockminimo +1) then begin 
        costoAdicional:=(p.stockminimo +1 - p.cantstock) * p.costo;
     
        if (costoAdicional > maxCosto) then begin 
            maxCosto:= costoAdicional;
            codMax:= p.codigo;
        end;
    end;
end; 

procedure procesardatos(L:lista);
var 
    min1,min2:real,p1,p2:integer; cantPiezas:integer;
    cod:integer;
    maxCosto:real;
    codMax:integer;

    prom:real; v:vector;
begin 
    maxCosto:= 0;
    codMax:= 0;
    inivector(v);
    stockACT:= ; cod:= 0;
    min2:= 999; min1:= 999; p1:= 0; p2:= 0; cantPiezas:= 0; prom:= 0;
    while (L <> nil) do begin 
        v[L^.data.modelo]:= L^.data.costo + v[L^.data.modelo];
        cantPiezas:= cantPiezas +1;

        if (cumple2(L^.data)) then 
            prom:= L^.data.stock + prom
        
        punto3(L^.data,maxCosto; codmax);

    L:=L^.sig;
    end;
    puntoA(L^.data,min1,min2,p1,p2);

    writeln('los dos codigos mas baratos', p1,'y',p2);
    writeln('promedio de piezas de: ', prom/cantPiezas:2:0);
    writeln('codigo costoso con stock', codmax);

end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
