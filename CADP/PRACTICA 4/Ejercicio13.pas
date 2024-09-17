{El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con
todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos.
Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos
50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información,
obtener:
a. El año con mayor temperatura promedio a nivel mundial.
b. El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program EJ13P4;
const 
    dimf = 50;
type 
    temperatura = record 
        alta:real;
        promedio:real;
    end;

    vector = array [1..dimf] of temperatura;


function puntoA(v:vector):integer;
var 
    i:integer;
    promedio:real;
begin 
    promedio:= 0;

    for i:=1 to dimf do 
        if (promedio < v[i].promedio) then begin 
            promedio:= v[i].promedio;
            puntoA:= i;
        end;
end;

function puntoB(v:vector):integer;
var 
    i:integer;
    alta:real;
begin 
    alta:= 0;
    for i:=1 to dimf do 
        if (alta < v[i].alta) then begin 
            alta:= v[i].alta;
            puntoB:= i;
        end;
end;

procedure cargar (var v:vector);
var 
    i,x:integer;
    lugar:string;
    temperatura,promedio,alta:real;
begin 
    promedio:= 0;
    alta:= 0;
    for i:=1 to dimf do begin 
        for x:=1 to 100 do begin 
            readln(lugar);
            readln(temperatura);
        
            if (temperatura > alta) then 
                alta:= temperatura;
            
            promedio:= promedio + temperatura;
        end;
        promedio:= promedio / 100;
        v[i].alta = alta;
        v[i].promedio:= promedio;
    end;
end; 

var 
    v:vector;
begin 
    cargar(v);
    writeln(puntoA(v));
    writeln(puntoB(v));
end.
