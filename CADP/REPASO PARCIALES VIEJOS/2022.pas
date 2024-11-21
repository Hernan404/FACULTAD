{{LA CATEDRA DE CADP NECESITA UN PROGRAMA PARA GENERAR EL LISTADO DE ALUMNOS INGRESANTES
QUE RENDIRAN EL PARCIAL PARA ELLO, LA CATEDRA DISPONE DE UN LISTADO CON TODOS LOS ALUMNOS QUE INGRESARON
ESTE AÑO A LA FACULTAD. DE CADA ALUMNO SE CONOSE SU DNI, NOMBRE Y APELLIDO, 
NOTA OBTENIDA EN CURSOS DE INGRESO (4..10), TURNOS (1..4) Y SI ESTUVO PRESENTE O AUSENTE
EN CADA UNA DE LAS 12 CLASES DE PRACTICA.

A) realizar un modulo que reciba la informacion de los alumnos y retorne una nueva 
estructura de datos que contega solo aquellos alumnos que podran rendir el parcial, para poder rendir
el parcial, los alumnos deben contar con almenos 8 asistencias en las 12 clases de practica.

B) realizar un modulo que reciba la estructura de datos generada en el inciso anterior e imprima en pantalla
	1. apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso
	2. turno con mayor cantidad de alumnos en condiciones de rendir el examen
	3. cantidad de alumnos que no posean ningun digito cero en su DNI.
	
}

program gestion_alumnos;
const 
    turnos = 4;
    notas = 10;
    clases = 12;
type 
    rango_turnos = 1..turnos;
    rango_clases = 1..clases;
    rango_notas = 4..notas;

    alumno = record 
        dni: integer;
        nombre: string;
        apellido: string;
        nota: rango_notas;
        turnos: rango_turnos;
        asistencia: rango_clases;
    end;

    lista = ^nodo;
    nodo = record 
        data: alumno;
        sig: lista;
    end;

    vasistencias = array [rango_clases] of integer;
    vturnos = array [rango_turnos] of integer;
    vpresente = array [rango_clases] of string;

// Procedimiento para cargar datos (se supone que está implementado externamente)
procedure cargardatos(var L: lista; var vp: vpresente); 
begin 
    // Implementación proporcionada externamente
end;

// Inicializar vector de asistencias
procedure inivector(var v: vasistencias);
var 
    i: integer;
begin 
    for i := 1 to clases do 
        v[i] := 0;
end;

// Función para verificar si un alumno está habilitado
function habilitados(r: alumno; var v: vasistencias; vp: vpresente): boolean;
var 
    i: integer;
    exito: boolean;
begin 
    exito := false;

    for i := 1 to clases do begin 
        if (vp[i] = 'presente') then 
            v[i] := v[i] + 1;
    end;

    for i := 1 to clases do begin 
        if (v[i] >= 8) then 
            exito := true;
    end;

    habilitados := exito;
end;    

// Función para verificar si un DNI cumple con la condición de no tener ceros
function cumpledigito(dni: integer): boolean;
var 
    dig0: integer;
begin 
    dig0 := 0;
    while (dni > 0) do begin 
        if (dni mod 10 = 0) then 
            dig0 := dig0 + 1;
        dni := dni div 10;
    end;
    cumpledigito := (dig0 = 0);
end;

// Procedimiento para encontrar el turno con más alumnos
procedure punto2(var max, p1: integer; vt: vturnos);
var 
    i: integer;
begin 
    for i := 1 to turnos do begin 
        if (vt[i] > max) then begin 
            max := vt[i];
            p1 := i;
        end;
    end;
end;

// Agregar alumno a una lista enlazada
procedure armarlista(var L: lista; r: alumno);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

// Agregar alumno a una segunda lista enlazada
procedure armarlista2(var L2: lista; r: alumno);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L2;
    L2 := aux;
end;

// Procesar habilitados
procedure procesarHabilitados(L2: lista);
var 
    vt: vturnos; 
    cantC, max, p1, i: integer;
begin 
    cantC := 0;
    max := 0;
    p1 := 0;

    // Inicializar vector de turnos
    for i := 1 to turnos do 
        vt[i] := 0;

    while (L2 <> nil) do begin 
        if (L2^.data.nota >= 8) then begin 
            writeln(L2^.data.nombre, ' ', L2^.data.apellido);
            writeln('DNI: ', L2^.data.dni);
        end; 

        vt[L2^.data.turnos] := vt[L2^.data.turnos] + 1;

        if (cumpledigito(L2^.data.dni)) then 
            cantC := cantC + 1;

        L2 := L2^.sig;
    end;

    punto2(max, p1, vt);
    writeln('Turno con más alumnos: ', p1);
    writeln('Cantidad de alumnos con DNI válido: ', cantC);
end;

// Procesar datos y crear la lista de habilitados
procedure procesardatos(L: lista; var L2: lista);
var 
    v: vasistencias;
begin 
    inivector(v);
    while (L <> nil) do begin 
        if (habilitados(L^.data, v)) then 
            armarlista2(L2, L^.data);
        L := L^.sig;
    end;
end;

var 
    L, L2: lista; 
    vp: vpresente;
begin 
    L := nil; 
    L2 := nil;
    cargardatos(L, vp);

    procesardatos(L, L2);
    procesarHabilitados(L2);
end.

