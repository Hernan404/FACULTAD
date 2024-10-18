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

program EJ18P7;
type 
    venta = record 
        nombre: string;
        monto: real;
    end;

    lista = ^nodo;
    nodo = record 
        data: venta;
        sig: lista;
    end;

    vector = array [1..12] of real;

procedure armarlista(var L: lista; r: venta);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

procedure cargardatos(var L: lista);
var 
    r: venta;
    i: integer;
begin 
    for i := 1 to 12 do 
    begin 
        writeln('Ingrese ventas para el mes ', i);
        repeat
            readln(r.nombre);
            readln(r.monto);
            if r.monto <> 0 then
                armarlista(L, r);
        until r.monto = 0;
    end;
end;

function totalfacturado(L: lista; nom: string): real;
var
    total: real;
begin
    total := 0;
    while (L <> nil) do
    begin
        if (L^.data.nombre = nom) then
            total := total + L^.data.monto;
        L := L^.sig;
    end;
    totalfacturado := total;
end;

procedure menorFacturacion(v: vector; var min1, min2: real; var p1, p2: integer);
var
    i: integer;
begin 
    for i := 1 to 12 do 
    begin 
        if (v[i] < min1) then 
        begin 
            min2 := min1;
            p2 := p1;
            min1 := v[i];
            p1 := i;
        end 
        else if (v[i] < min2) then 
        begin 
            min2 := v[i];
            p2 := i;
        end;
    end;
end;

procedure procesardatos(nom: string; L: lista);
var 
    v: vector;
    i, p1, p2: integer;
    min1, min2: real;
begin 
    // Inicializar el vector de facturación a 0
    for i := 1 to 12 do
        v[i] := 0;

    // Calcular el total facturado para cada mes
    for i := 1 to 12 do
        v[i] := totalfacturado(L, nom);

    min1 := 999999; 
    min2 := 999999;
    p1 := 0; 
    p2 := 0; 

    menorFacturacion(v, min1, min2, p1, p2);

    writeln('Meses de menor facturación para la localidad ', nom, ':');
    writeln('Mes ', p1, ' con facturación: ', min1:0:2);
    writeln('Mes ', p2, ' con facturación: ', min2:0:2);
end;

var 
    L: lista; 
    nom: string;
begin 
    L := nil;
    cargardatos(L);
    writeln('Ingrese el nombre de la localidad a buscar:');
    readln(nom);
    procesardatos(nom, L);
end.
