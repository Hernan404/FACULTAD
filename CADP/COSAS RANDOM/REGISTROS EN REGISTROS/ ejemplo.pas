Se quiere presentar la informacion de las distintas
razas de animales que existen en una veterinaria. 
atienden solamente perros, de cada perro se conoce raza,
nombre, la edad y ahora nuestro perro tiene la fecha en que
visito por ultima vez la veterinaria.

program ejemplo
type 
    fecha = record 
        dia:integer;
        mes:integer;
        año:integer;
    end;

    perro = record 
        raza:string;
        edad:integer;
        nombre:string;
        fechaVis:fecha;
    end;


procedure leerFecha(var f:fecha);
begin 
    read(f.dia);
    read(f.mes);
    read(f.año);
end;

procedure leer(var p:perro);
var 
    fec:fecha;
begin 
    read(p.raza);
    read(p.nombre);
    read(p.edad);
    leerFecha(p.fechaVis);
end;

Escriba un programa que lea la informacion de 10 perros
al finalizar, informe los perros que visitaron la veterinaria
en los primeros 15 dias de los meses de enero y 
febrero de 2023

program uno;
type 
    fecha = record 
        dia:integer;
        mes:integer;
        año:integer;
    end;

    perro = record 
        raza:string;
        nombre:string;
        edad:integer;
        fechavis:fecha;
    end;

procedure leerFecha(var f:fecha)
begin 
    read(f.dia);
    read(f.mes);
    read(f.año);
end;

procedure leer (var p:perro);
begin 
    read(p.raza);
    read(p.nombre);
    read(p.edad);
    leerfecha(p.fechaVis);
end;

function cumpleFecha (p:perro):boolean;
var 
    ok:boolean;
begin 
    if ((p.fechaVis >=1) and (p.fechaVis <=15)) and 
        ((p.fechaVis.mes = 1) or (p.fechaVis.mes = 2)) and 
        (p.fechaVis.anio = 2023) then 
        ok:= true
    
    else 
        ok:= false;
       cumpleFecha:= ok;
    end;
end;

var 
    ani:perro;
    cant:integer;
begin 
    cant:= 0;

    for i:=1 to 10 do begin 
        leer(ani);

        if (cumpleFecha(ani) = true) then 
            cant:= cant + 1;
    end;

    write('la cantidad es', cant);
end.    
