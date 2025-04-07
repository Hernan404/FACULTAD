L{a cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al menos
el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se entrega
en tiempo y forma y con al menos el 40% de respuestas correctas.}

program EJ2P1P3;

var 
    i, legajo, nota, cantINGRE, cantRECUR, total, pbien, pmal, aprobo_todo,
    perfecto, max1, max2, p1, p2, puntoE, puntoD, 
    rinde, puntoA, puntoB, puntoC: integer;
    condicion: char;

begin 
    cantINGRE := 0;
    cantRECUR := 0;
    total := 0;
    pbien := 0;
    pmal := 0;
    aprobo_todo := 0;
    perfecto := 0;
    max1 := -1;
    max2 := -1;
    p1 := 0;
    p2 := 0;
    puntoE := 0;
    puntoD := 0;
    rinde := 0;
    puntoA := 0;
    puntoB := 0;
    puntoC := 0;
    
    legajo := 0; // Inicializamos legajo con un valor diferente de -1 para entrar al bucle

    while legajo <> -1 do begin
        writeln('Ingrese el legajo (o -1 para salir):');
        readln(legajo);
        
        if legajo = -1 then
            continue; // Saltar al siguiente ciclo si se ingresa -1

        writeln('Ingrese condicion (I para INGRESANTE, R para RECURSANTE):');
        readln(condicion);

        // Reiniciar contadores para cada alumno
        total := 0;
        pbien := 0;
        pmal := 0;
        aprobo_todo := 0;
        perfecto := 0;

        for i := 1 to 5 do begin 
            writeln('Ingrese la nota ', i, ':');
            readln(nota);
            total := total + nota;
            
            if nota > 4 then
                pbien := pbien + 1;

            if nota = 0 then 
                pmal := pmal + 1; 
            
            if pbien = 5 then 
                aprobo_todo := aprobo_todo + 1;
            
            if nota = 10 then 
                perfecto := perfecto + 1;
        end;

        // Actualizar los contadores según las condiciones dadas
        if perfecto > max1 then begin 
            max2 := max1;
            p2 := p1;
            max1 := perfecto;
            p1 := legajo;
        end
        else if perfecto > max2 then begin 
            max2 := perfecto;
            p2 := legajo;
        end;

        if pmal = 5 then 
            puntoE := puntoE + 1;  

        if total / 5 > 6.5 then 
            puntoD := puntoD + 1;

        if pbien >= 3 then 
            rinde := rinde + 1;
            
        if (condicion = 'I') and (pbien >= 3) then
            puntoA := puntoA + 1
        else if (condicion = 'R') and (pbien >= 3) then
            puntoB := puntoB + 1;

        if aprobo_todo = 5 then 
            puntoC := puntoC + 1;

    end;

    // Mostrar los resultados
    writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial: ', puntoA, 
        ', Porcentaje sobre el total de alumnos INGRESANTES: ', puntoA / cantINGRE * 100 :0:2, '%');

    writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial: ', puntoB ,
        ', Porcentaje sobre el total de alumnos RECURSANTES: ', puntoB / cantRECUR * 100 :0:2, '%');

    writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ', puntoC);

    writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos: ', puntoD);

    writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación: ', puntoE);

    writeln('Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10: ', p1, ' y ', p2);
end.
