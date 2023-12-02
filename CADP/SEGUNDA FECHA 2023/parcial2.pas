Un salon de eventos necesita un programa para administrar la informacion de las reservas
de diciembre de 2023 se dispone de una estructura con la informacion de las reservas. de cada reserva se conoce: numero de reserva,
DNI del cliente, dia del evento (1..31), hora de inicio, hora de fin y categoria de servicio (1..4). ademas, se dispone de una tabla
con el precio por hora de reserva de acuerdo a cada categoria de servicio.

a) generar una nueva estructura con numero y precio total de cada reserva. esta estructura con numero 
y precio total de cada reserva. esta estructura debe generarse ordenada por numero de reserva 

b) informar los dos dias del mes con mayor cantidad de reservas de clientes con DNI par    

c) informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena 



program EJ;
type 
    reservas = record 
        numero:integer;
        DNI:integer;
        dia:1..31;
        hora_inicio:integer;
        hora_fin:integer;
        categoria:1..4;
    end; 

    lista = nodo 
    nodo = record 
        data:reservas;
        sig:lista;
    end;

    vector = array [1..31] of integer;


var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.







