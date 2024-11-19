{La empresa “Almacenes Argentina 2000” desea evaluar las ganancias obtenidas a lo largo de todo el
año 2021 en el país. Para cada mes, la empresa conoce la información de todas las ventas realizadas en
las distintas localidades del país. De cada venta se conoce el nombre de la localidad donde se realizó la
venta y el monto facturado en dicha venta. Se pide realizar un programa que:
a) Invoque a un módulo que lea y retorne en una estructura de datos adecuada la información de las
ventas. La información se ingresa ordenada por mes. Para cada mes, la lectura finaliza al ingresar el
monto 0 (que no debe procesarse).
b) Lea un nombre de localidad e invoque a un módulo que recibe dicho nombre y la información de las
ventas, e informe los dos meses de menor facturación de esa localidad. Se debe implementar una función
que reciba las ventas de un mes y una localidad y devuelva el monto total facturado de la localidad.}

program EJ18P7l;
const 
    mes = 12;
type 
    rango_mes = 1..12;

    venta = record 
        nombre: string;
        monto: real;
        mes: rango_mes; // Se incluye el mes explícitamente
    end; 

    lista = ^nodo;
    nodo = record
        data: venta;
        sig: lista;
    end; 

    vector = array [rango_mes] of real;

// Agrega un elemento al inicio de la lista
procedure agregaradelante(var L: lista; r: venta);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

// Carga los datos en una lista enlazada
procedure cargardatos(var L: lista);
var 
    r: venta;
    i: integer;
begin 
    for i := 1 to mes do begin
        writeln('Ingresando datos del mes ', i);
        repeat
            readln(r.nombre); 
            readln(r.monto);
            if r.monto <> 0 then begin
                r.mes := i;
                agregaradelante(L, r);
            end;
        until r.monto = 0; // Finaliza la lectura del mes cuando el monto es 0
    end;
end;

// Calcula los dos meses de menor facturación
procedure menorfacturacion(v: vector);
var 
    i:integer;
    min1, min2, p1, p2: real;
begin 
    min1 := 999; min2 := 999; 
    p1 := 0; p2 := 0;

    for i := 1 to 12 do begin 
        if v[i] < min1 then begin 
            min2 := min1;
            p2 := p1;
            min1 := v[i];
            p1 := i;
        end
        else if v[i] < min2 then begin 
            min2 := v[i];
            p2 := i;
        end;
    end;
    writeln('Mes con menor facturación: ', p1, ' (Facturación: ', min1:0:2, ')');
    writeln('Segundo mes con menor facturación: ', p2, ' (Facturación: ', min2:0:2, ')');
end;

// Procesa los datos para una localidad específica
procedure procesardatos(L: lista; var v: vector; nombreB: string);
var 
    i: integer;
begin
    // Inicializa el vector de facturación mensual
    for i := 1 to 12 do 
        v[i] := 0;

    // Recorre la lista y acumula montos para la localidad especificada
    while L <> nil do begin 
        if L^.data.nombre = nombreB then 
            v[L^.data.mes] := v[L^.data.mes] + L^.data.monto;
        L := L^.sig;
    end;

    // Calcula los dos meses de menor facturación
    menorfacturacion(v);
end;

var 
    L: lista;
    v: vector;
    nombreB: string;
begin 
    L := nil;
    writeln('Cargando datos de ventas...');
    cargardatos(L);

    writeln('Ingrese el nombre de la localidad a buscar:');
    readln(nombreB);

    writeln('Procesando datos...');
    procesardatos(L, v, nombreB);
end.

