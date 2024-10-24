{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso
registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa
que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program EJ4P7;
const 
    semanas = 42;
type 
    rango_semanas = 1..semanas;
    paciente = record 
        nombre: string;
        apellido: string;
        pesos: array[rango_semanas] of real;
    end;

    lista = ^nodo;
    nodo = record 
        data: paciente;
        sig: lista;
    end;

procedure leer(var p: paciente);
var
    i: rango_semanas;
begin 
    writeln('Ingrese nombre del paciente:');
    readln(p.nombre);
    writeln('Ingrese apellido del paciente:');
    readln(p.apellido);
    writeln('Ingrese los pesos de cada semana (1-42):');
    for i := 1 to semanas do begin
        readln(p.pesos[i]);
    end;
end;

procedure armarlista(var L: lista; p: paciente);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.data := p;
    nuevo^.sig := L;
    L := nuevo;
end;

procedure cargardatos(var L: lista);
var 
    p: paciente;
begin 
    leer(p);
    while (p.nombre <> 'ZAZ') do begin
        armarlista(L, p);
        leer(p);
    end;
end;

procedure procesardatos(L: lista);
var 
    i: rango_semanas;
    maxAumento, aumento: real; 
    semanaMax: integer; 
    aumentoTOTAL: real; 
    p: paciente;
begin 
    while (L <> nil) do begin 
        p := L^.data;
        maxAumento := -1;
        semanaMax := 0;
        aumentoTOTAL := 0;

        // Calcular el aumento de peso total y la semana con mayor aumento
        for i := 2 to semanas do begin 
            aumento := p.pesos[i] - p.pesos[i-1];
            if (aumento > maxAumento) then begin
                maxAumento := aumento;
                semanaMax := i;
            end;
        end;

        // Calcular el aumento total de peso durante el embarazo
        aumentoTOTAL := p.pesos[semanas] - p.pesos[1];

        writeln('Paciente: ', p.nombre, ' ', p.apellido);
        writeln('Semana con mayor aumento de peso: ', semanaMax);
        writeln('Aumento de peso total durante el embarazo: ', aumentoTOTAL:2:2);

        L := L^.sig;
    end;
end;

var 
    L: lista;
begin 
    L := nil; 
    cargardatos(L);
    procesardatos(L);
end.
