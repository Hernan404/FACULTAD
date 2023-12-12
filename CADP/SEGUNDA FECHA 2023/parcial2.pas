
Un salon de eventos necesita un programa para administrar la informacion de las reservas
de diciembre de 2023 se dispone de una estructura con la informacion de las reservas. de cada reserva se conoce: numero de reserva,
DNI del cliente, dia del evento (1..31), hora de inicio, hora de fin y categoria de servicio (1..4). ademas, se dispone de una tabla
con el precio por hora de reserva de acuerdo a cada categoria de servicio.

a) generar una nueva estructura con numero y precio total de cada reserva. esta estructura con numero 
y precio total de cada reserva. esta estructura debe generarse ordenada por numero de reserva 

b) informar los dos dias del mes con mayor cantidad de reservas de clientes con DNI par    

c) informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena 




program EJ;
const
  TablaPrecios: array[1..4] of PrecioPorHora = (
    (Categoria: 1; Precio: 10.0),
    (Categoria: 2; Precio: 15.0),
    (Categoria: 3; Precio: 20.0),
    (Categoria: 4; Precio: 25.0)
  );
  
type 
    reservas = record 
        numero:integer;
        DNI:integer;
        dia:1..31;
        hora_inicio:integer;
        hora_fin:integer;
        categoria:1..4;
        duracion:integer;
    end;

    reservaA = record 
        numeroA:integer;
        precioA:real;
    end; 

    lista = nodo 
    nodo = record 
        data:reservas;
        sig:lista;
    end;

    PrecioPorHora = record
        Categoria: 1..4;
        Precio: real;
    end;

    vector = array [1..31] of integer;

procedure leer(var r:reserva);
begin 
    with r do begin 
        readln(numero);
        readln(DNI);
        readln(dia);
        readln(hora_inicio);
        readln(hora_fin);
        readln(categoria);
    end;
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:= 1 to 30 do begin 
        v[i]:= 0;
    end;
end;

procedure armarlista (var L:lista; r:reservas);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= r;
    aux^.sig:= L;
    L:= aux;
end;

procedure cargardatos (L:lista);
var 
    r:reserva;
begin 
    leer(r);
    while (r.numero <> -1) do begin 
        armarlista(L,r);
        leer(r);
    end;
end;

Procedure armarlista2 ( var pri: lista; rA:reservaA);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := rA;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act <> NIL) and (act^.data.numero < rA.numero) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure puntoA (var rA:reservaA; var r:reserva);
begin 
    rA.precioA:= rA.precioA + r.precio;
    armarlista2(L2,rA);
end;

procedure calcularDuracionYPrecio(var r: reservas);
begin
  r.duracion := r.hora_fin - r.hora_inicio;
  r.precio := r.duracion * TablaPrecios[r.categoria].Precio;
end;

function cumpleB (dni:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;
    digito:= 0;
    while (digito > 1) do begin 
        digito:= num mod 10;

        if (digito mod 2 = 0) then 
            par:= par +1;
        else 
            impar:= impar +1;
        digito:= digito div 10;
    end;
    
    cumpleB:= (par >= 1) and (impar = 0);
end;

procedure puntoB (var max1,max2,p1,p2:integer; r:reservas; v:vector);
var 
    i:integer;
begin 
    for i:=1 to 30 do 
            if (cumpleB(r.DNI)) then begin 
                    if (max1 > v[i]) then 
                        max2:= max1;
                        p2:= p1;
                        max1:= v[i];
                        p1:= i;
                    else begin 
                        if (max1 > max2) then 
                            max2:= v[i];
                            p2:= i;
                    end;
            end;
    end;
end;

procedure procesardatos (L:lista);
var 
    v:vector;
    r:reservas;
    rA:reservaA;
    max1,max2,p1,p2:integer;
    porcentaje,porcentaje12:real;
    numACT:integer;
begin 
    numACT:= 0;
    inivector(v);
    porcentaje:= 0;
    porcentaje12:= 0;
    while (L <> nil) do begin 
        numACT:= L^.data.numero;
        calcularDuracionYPrecio(L^.data);
        porcentajes:= porcentajes +1;
        while (L <> nil) and (L^.data.numero = numACT) do begin 
            puntoA(rA,r);
            puntoB(max1,max2,p1,p2,r,v);
            if (L^.data.hora_inicio < 12) and (v[L^.data.dia] <  15) then
                porcentaje12:= porcentaje12 +1;
            end;

        end;

        writeln('punto B: ', p1,p2);
        writeln('punto C: ', (porcentaje/porcentaje12)*100);
    end;
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
