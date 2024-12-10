{Curso de Verano CADP 2020 – Parcial (10/3/2020)

Una empresa administra la información de sus empleados y necesita disponer de un programa que:
a) Lea y almacene la información de los empleados. De cada empleado se conoce: DNI, apellido, nombre, categoría (A, B, C, D o E), 
sueldo básico, montos de los premios obtenidos en el mes (como máximo 5) y antigüedad en la empresa.
La lectura de la información finaliza cuando se lee el DNI -1 (que no debe procesarse). 
La información debe ser almacenada de manera ordenada por DNI de menor a mayor.

Una vez leída y almacenada la información:
b) Obtener una lista de "Liquidaciones" con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se calcula
 de la siguiente manera:

    EMPLEADO Categoría A, B o C → Sueldo básico + premios.
    EMPLEADO Categoría D, E → Sueldo básico + premios + 1000 pesos por cada año de trabajo en la empresa.

c) Informar para cada categoría la cantidad de empleados.

d) Eliminar de la lista de "Liquidaciones" el empleado con DNI 555, de ser posible.}

program VERANO2020;

type
    rango_categorias = 'A'..'E';
    empleado = record
        dni: integer;
        apellido: string;
        nombre: string;
        categoria: rango_categorias;
        sueldo: real;
        montoMes: real; // Total de premios del mes
        antiguedad: integer;
    end;

    lista = ^nodo;
    nodo = record
        data: empleado;
        sig: lista;
    end;

    liqui = record
        dni: integer;
        sueldo: real;
    end;

    lista_liquidaciones = ^nodo_liquidaciones;
    nodo_liquidaciones = record
        data: liqui;
        sig: lista_liquidaciones;
    end;

    vcategoria = array[rango_categorias] of integer;

procedure leer(var r: empleado);
begin
    with r do begin
        writeln('Ingrese DNI (-1 para finalizar):');
        readln(dni);
        if dni <> -1 then begin
            writeln('Ingrese apellido:');
            readln(apellido);
            writeln('Ingrese nombre:');
            readln(nombre);
            writeln('Ingrese categoria (A, B, C, D, E):');
            readln(categoria);
            writeln('Ingrese sueldo basico:');
            readln(sueldo);
            writeln('Ingrese monto total de premios del mes:');
            readln(montoMes);
            writeln('Ingrese antigüedad en años:');
            readln(antiguedad);
        end;
    end;
end;

procedure armarOrdenado(var L: lista; r: empleado);
var
    ant, act, aux: lista;
begin
    new(aux);
    aux^.data := r;
    aux^.sig := nil;

    ant := nil;
    act := L;
    while (act <> nil) and (act^.data.dni < r.dni) do begin
        ant := act;
        act := act^.sig;
    end;

    if ant = nil then
        L := aux
    else
        ant^.sig := aux;
    aux^.sig := act;
end;

procedure cargardatos(var L: lista);
var
    r: empleado;
begin
    L := nil;
    repeat
        leer(r);
        if r.dni <> -1 then
            armarOrdenado(L, r);
    until r.dni = -1;
end;

procedure armarLista2(var L2: lista_liquidaciones; dni: integer; sueldoMensual: real);
var
    aux: lista_liquidaciones;
begin
    new(aux);
    aux^.data.dni := dni;
    aux^.data.sueldo := sueldoMensual;
    aux^.sig := L2;
    L2 := aux;
end;

procedure liquidaciones(var L2: lista_liquidaciones; r: empleado);
var
    adicional, sueldoMensual: real;
begin
    adicional := r.antiguedad * 1000;
    if (r.categoria in ['A', 'B', 'C']) then
        sueldoMensual := r.sueldo + r.montoMes
    else
        sueldoMensual := r.sueldo + r.montoMes + adicional;

    armarLista2(L2, r.dni, sueldoMensual);
end;

procedure borrarElemento(var L2: lista_liquidaciones; dniABorrar: integer; var exito: boolean);
var
    ant, act: lista_liquidaciones;
begin
    exito := false;
    act := L2;

    while (act <> nil) and (act^.data.dni <> dniABorrar) do begin
        ant := act;
        act := act^.sig;
    end;

    if act <> nil then begin
        exito := true;
        if act = L2 then
            L2 := act^.sig
        else
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;

procedure procesardatos(L: lista);
var
    L2: lista_liquidaciones;
    vc: vcategoria;
    i: rango_categorias;
    exito: boolean;
begin
    L2 := nil;
    for i := 'A' to 'E' do
        vc[i] := 0;

    while L <> nil do begin
        liquidaciones(L2, L^.data);
        vc[L^.data.categoria] := vc[L^.data.categoria] + 1;
        L := L^.sig;
    end;

    borrarElemento(L2, 555, exito);
    if exito then
        writeln('Se eliminó al empleado con DNI 555.')
    else
        writeln('No se encontró al empleado con DNI 555.');

    writeln('Cantidad de empleados por categoría:');
    for i := 'A' to 'E' do
        writeln('Categoría ', i, ': ', vc[i], ' empleados');
end;

var
    L: lista;
begin
    L := nil;
    cargardatos(L);
    procesardatos(L);
end.
