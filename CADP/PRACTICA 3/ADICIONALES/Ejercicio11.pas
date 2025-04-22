{Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por
sus aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de
llegada, cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa
ordenada por código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44.
Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}
program EJ11P3;
type
    vuelo = record
        codigo: integer;
        salida: string;
        llegada: string;
        cantKM: real;
        ocupacion: real;
    end;

procedure leer(var r: vuelo);
begin
    with r do begin
        readln(codigo);
        if (codigo <> 44) then begin
            readln(salida);
            readln(llegada);
            readln(cantKM);
            readln(ocupacion);
        end;
    end;
end;

procedure procesar(r:aviones);
var
    codigoActual, paisesDistintos: integer;
    max1, max2, min1, min2: real;
    codMax1, codMax2, codMin1, codMin2: integer;
    vuelosMalOcupados, vuelosOceania: integer;
    maxPaises, avionMasPaises: integer;
    paisAnterior: string;
begin
    max1 := -1; max2 := -1;
    min1 := 999999; min2 := 999999;
    codMax1 := -1; codMax2 := -1;
    codMin1 := -1; codMin2 := -1;
    vuelosMalOcupados := 0;
    vuelosOceania := 0;
    maxPaises := 0;

    leer(r);
    while (r.codigo <> 44) do begin
        codigoActual := r.codigo;
        paisAnterior := '';
        paisesDistintos := 0;

        while (r.codigo <> 44) and (r.codigo = codigoActual) do begin
            // Contar países distintos
            if (r.salida <> paisAnterior) then begin
                paisesDistintos := paisesDistintos + 1;
                paisAnterior := r.salida;
            end;

            // Calcular máximos de kilómetros
            if (r.cantKM > max1) then begin
                max2 := max1;
                codMax2 := codMax1;
                max1 := r.cantKM;
                codMax1 := r.codigo;
            end
            else if (r.cantKM > max2) then begin
                max2 := r.cantKM;
                codMax2 := r.codigo;
            end;

            // Calcular mínimos de kilómetros
            if (r.cantKM < min1) then begin
                min2 := min1;
                codMin2 := codMin1;
                min1 := r.cantKM;
                codMin1 := r.codigo;
            end
            else if (r.cantKM < min2) then begin
                min2 := r.cantKM;
                codMin2 := r.codigo;
            end;

            // Contar vuelos >5000 km con ocupación <60%
            if (r.cantKM > 5000) and (r.ocupacion < 60) then
                vuelosMalOcupados := vuelosMalOcupados + 1;

            // Contar vuelos <10000 km que llegan a Australia o Nueva Zelanda
            if (r.cantKM < 10000) and ((r.llegada = 'australia') or (r.llegada = 'nueva zelanda')) then
                vuelosOceania := vuelosOceania + 1;

            leer(r);
        end;

        // Verificar si este avión salió de más países distintos
        if (paisesDistintos > maxPaises) then begin
            maxPaises := paisesDistintos;
            avionMasPaises := codigoActual;
        end;
    end;

    writeln('Aviones que más kilómetros recorrieron: ', codMax1, ' y ', codMax2);
    writeln('Aviones que menos kilómetros recorrieron: ', codMin1, ' y ', codMin2);
    writeln('Avión que salió desde más países distintos: ', avionMasPaises);
    writeln('Vuelos de más de 5000 km con ocupación menor al 60%: ', vuelosMalOcupados);
    writeln('Vuelos de menos de 10000 km que llegaron a Australia o Nueva Zelanda: ', vuelosOceania);
end;

var 
   r:aviones;
begin
    procesar(r);
end.
