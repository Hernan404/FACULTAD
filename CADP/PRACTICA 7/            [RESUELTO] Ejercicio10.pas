program EJ10P7;

const
    dimf = 20;

type
    cultivos = record
        tipo: string;
        cantHec: integer;
        cantMeses: integer;
    end;

    vector = array [1..dimf] of cultivos;

    empresa = record
        codigo: integer;
        nombre: string;
        est_o_priv: string;
        nombre_ciudad: string;
        cultivo: vector;
        diml: integer;
    end;

    lista = ^nodo;
    nodo = record
        data: empresa;
        sig: lista;
    end;

// Procedimiento para leer una empresa y sus cultivos
procedure leer(var e: empresa);
var
    ha:integer;
begin
    writeln('codigo empresa');
    readln(e.codigo);
    if (e.codigo <> -1) then begin
        writeln('nombre empresa');
        readln(e.nombre);
        writeln('privada o estatal');
        readln(e.est_o_priv);
        writeln('ciudad');
        readln(e.nombre_ciudad);
        e.diml := 0;
        writeln('cantidad hectareas');
        readln(ha);
        while (e.diml < dimf) and (ha <> 0) do begin
            e.diml := e.diml + 1;
            writeln('tipo de cultivo');
            readln(e.cultivo[e.diml].tipo);
            writeln('cantidad de meses');
            readln(e.cultivo[e.diml].cantMeses);
            e.cultivo[e.diml].cantHec := ha;
            writeln('cantidad hectareas');
            readln(ha);
        end;
    end;
end;

// Procedimiento para agregar una empresa a la lista
procedure armarlista(var L: lista; e: empresa);
var
    aux: lista;
begin
    new(aux);
    aux^.data := e;
    aux^.sig := L;
    L := aux;
end;

// Procedimiento para cargar los datos de empresas en la lista
procedure cargardatos(var L: lista);
var
    e: empresa;
begin
    leer(e);
    while (e.codigo <> -1) do begin
        armarlista(L, e);
        leer(e);
    end;
end;

// Función para verificar si un código tiene al menos dos ceros
function dosceros(codigo: integer): boolean;
var
    digito, cero: integer;
begin
    cero := 0;
    while (codigo > 0) do begin
        digito := codigo mod 10;
        if (digito = 0) then
            cero := cero + 1;
        codigo := codigo div 10;
    end;
    dosceros := (cero >= 2);
end;

// Procedimiento para procesar los datos
procedure procesardatos(L: lista);
var
    totalHEC, HECsoja, max, i: integer;
    cumpleC: real;
    p1: string;
begin
    HECsoja := 0;
    totalHEC := 0;
    max := -1;
    p1 := '';
    while (L <> nil) do begin
        // PUNTO B: Empresas en "San Miguel del Monte" que cultivan trigo y cuyo código tiene al menos dos ceros.
        if (L^.data.nombre_ciudad = 'San Miguel del Monte') and dosceros(L^.data.codigo) then begin
            for i := 1 to L^.data.diml do begin
                if (L^.data.cultivo[i].tipo = 'trigo') then
                    writeln('Empresa cumple con Punto B: ', L^.data.nombre);
            end;
        end;
        // Total de hectáreas
        for i := 1 to L^.data.diml do begin
            totalHEC := totalHEC + L^.data.cultivo[i].cantHec;
            // PUNTO C: Cantidad de hectáreas dedicadas al cultivo de soja
            if (L^.data.cultivo[i].tipo = 'soja') then
                HECsoja := HECsoja + L^.data.cultivo[i].cantHec;
        end;
        // PUNTO D: Empresa que dedica más tiempo al cultivo de maíz
        for i := 1 to L^.data.diml do begin
            if (L^.data.cultivo[i].tipo = 'maiz') then
                if (L^.data.cultivo[i].cantMeses > max) then begin
                    max := L^.data.cultivo[i].cantMeses;
                    p1 := L^.data.nombre;
                end;
        end;
        // PUNTO E: Incrementar en un mes los tiempos de cultivos de girasol < 5 hectáreas en empresas privadas
        if (L^.data.est_o_priv = 'privada') then begin
            for i := 1 to L^.data.diml do begin
                if (L^.data.cultivo[i].tipo = 'girasol') and (L^.data.cultivo[i].cantHec < 5) then
                    L^.data.cultivo[i].cantMeses := L^.data.cultivo[i].cantMeses + 1;
            end;
        end;
        L := L^.sig;
    end;
    // PUNTO C: Porcentaje de hectáreas dedicadas a soja
    if totalHEC > 0 then
        cumpleC := (HECsoja / totalHEC) * 100
    else
        cumpleC := 0;
    writeln('PUNTO C: Hectáreas dedicadas a soja representan el ', cumpleC:2:2, '% del total');
    writeln('PUNTO D: La empresa que dedica más tiempo al cultivo de maíz es: ', p1);
end;

var
    L: lista;
begin
    L := nil;
    cargardatos(L);
    procesardatos(L);
end.

