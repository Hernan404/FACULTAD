11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. 
De cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: 
cine, 3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas 
permitidas para el evento y costo de la entrada. Se pide:

1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se 
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de 
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.

2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que 
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de 
personas permitidas


program EJ11P7;
type 
    ventas = record 
        codigo:integer;
        numEvento:1..100;
        DNI:integer;
        cantEntradas:integer;
    end;

    lista = ^nodo
    nodo = record 
        datos:ventas;
        sig:lista;
    end;

    vEvento = array [1..100] of integer;


procedure agregarAdelante ();
var 
    aux:lista;
begin 
    new(aux)
    aux^.datos:= d;
    aux^.sig:= L;
    L:= sig;
end;

procedure cargarLista(var L:lista);
var 
    v:venta;
begin 
    leerVenta(d);
    while d.codigo <> -1 do begin 
        agregarAdelante(L,d);
        leerVenta(d);
    end;
end; 

procedure puntoA (d:ventas; L:lista; min:integer; nombre_cumpleA,lugar_cumpleA:string);
begin 
    if (costo < min) then begin 
        min:= costo;
        nombre_cumpleA:= d.nombre;
        lugar_cumpleA:= d.lugar;
    end;
    else 
        begin 
            if (costo < min) then begin 
                min:= costo;
                nombre_cumpleA2:= d.nombre;
                lugar_cumpleA2:= d.lugar;
            end;
        end;
end;

procedure puntoB (var par,impar:integer);
var 
    digitos:integer;
begin 
    digitos:= L^.datos.DNI mod 10;
        if (digitos div 2 = 0) then 
            par:= digitos;
        else 
            impar:= impar +1;
    if (par > impar) then 
        cumpleB:= L^.datos.dni;
end;

function puntoC (v:vEvento; vc:vEvento; cumple:boolean);

begin 
    cumple:= false; 

    if (v[i] = 50) then begin 
        if (vc[L^.datos.cantEntradas] > entradasMax ) then begin
            cumple:true;
        end;
    end;
end;

procedure procesarDatos (); 
begin
    while (d.codigo <> -1) do begin 
    inivector();
    leer();
    agregarAdelante();
    cargarLista();
    

    menosA ();
    puntoB ();
    puntoC ();
    end;
    writeln('nombre de los dos eventos con menos recaudacion: ' nombre_cumpleA , nombre_cumpleA2 , 'lugar: ' lugar_cumpleA , lugar_cumpleA2);
    writeln('cant de entradas cumplen b: ', cumpleB);
    if (cumple = true) then 
        writeln('cumple punto C ')
    else 
        writeln('No cumple punto C');

end;

var 
    
begin 
    procesarDatos();
end.


