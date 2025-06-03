{Una biblioteca municipal posee la lista de libros que fueron leídos durante el mes de Octubre. De cada libro se tiene:

    código de libro,

    título del libro,

    código de categoría (1: novela, 2: ciencia ficción, 3: historia, 4: biografía, 5: poesía, 6: ensayo, 7: infantil, 8: misterio),

    puntaje promedio otorgado por los lectores.

Dicha estructura no posee orden alguno.

Se pide:

a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por los lectores. Para ello se debe leer desde teclado las opiniones que han realizado los socios de la biblioteca. De cada opinión se lee:

    DNI del lector,

    apellido y nombre del lector,

    código de libro,

    puntaje otorgado.

La lectura finaliza cuando se lee el código de libro -1. La información viene ordenada por código de libro.

b) Informar el código de categoría que obtuvo mayor puntaje total entre todas las opiniones.

c) Informar el apellido y nombre de aquellos lectores que posean la misma cantidad de dígitos pares que impares en su DNI.

d) Realizar un módulo que elimine de la lista que se dispone un libro cuyo código se recibe como parámetro (el mismo puede no existir).}


program EJ9P7_ALTERNATIVO;
const 
    categorias = 8;
type 
    rango_categorias = 1..categorias;

    libro = record 
        codigo: integer;
        titulo: string;
        categoria: rango_categorias;
        puntaje: real;
    end;

    vector = array [rango_categorias] of real; // Cambiado a real para acumular puntajes

    lista = ^nodo;
    nodo = record 
        data: libro;
        sig: lista;
    end;

    socio = record 
        dni: integer;
        apeynom: string;
        codigo: integer;
        puntaje: real;
    end;

    lista2 = ^nodo2;
    nodo2 = record 
        data: socio;
        sig: lista2;
    end;

procedure leerSocio(var s: socio); // Añadido procedimiento faltante
begin
    write('Ingrese código de libro (-1 para terminar): ');
    readln(s.codigo);
    if s.codigo <> -1 then
    begin
        write('Ingrese DNI del lector: ');
        readln(s.dni);
        write('Ingrese apellido y nombre: ');
        readln(s.apeynom);
        write('Ingrese puntaje otorgado: ');
        readln(s.puntaje);
    end;
end;

procedure armarLista2(var L2: lista2; s: socio); // Añadido procedimiento faltante
var
    nuevo: lista2;
begin
    new(nuevo);
    nuevo^.data := s;
    nuevo^.sig := L2;
    L2 := nuevo;
end;

procedure puntoB(v: vector; var max: real; var p1: rango_categorias); // Corregidos parámetros
var 
    i: integer;
begin 
    max := -1;
    for i := 1 to categorias do begin 
        if (v[i] > max) then begin 
            max := v[i];
            p1 := i; 
        end; 
    end; 
end; 

function cumplePar(dni: integer): boolean;
var 
    par, impar, dig: integer;
begin 
    par := 0; 
    impar := 0;
    while (dni > 0) do begin 
        dig := dni mod 10;
        if (dig mod 2 = 0) then 
            par := par + 1
        else 
            impar := impar + 1;
        dni := dni div 10;
    end;
    cumplePar := (impar = par); 
end;

procedure eliminar(var L: lista; codigo: integer; var exito: boolean);
var 
    ant, act: lista;
begin 
    exito := false;
    act := L;
    ant := nil;

    while (act <> nil) and (act^.data.codigo <> codigo) do begin 
        ant := act;
        act := act^.sig;
    end; 

    if (act <> nil) then begin 
        exito := true;
        if (ant = nil) then 
            L := act^.sig
        else 
            ant^.sig := act^.sig;
        dispose(act); 
    end;
end; 

procedure procesarDatos(var L: lista; L2: lista2); // Añadido var para modificar L
var 
    v: vector;
    i: rango_categorias;
    totalpromedio: real;
    cantpromedio: integer;
    promedioSocios: real;
    max: real;
    p1: rango_categorias;
    codigo: integer;
    exito: boolean;
begin 
    // Inicializar vector
    for i := 1 to categorias do
        v[i] := 0;

    while (L <> nil) do begin
        totalpromedio := 0;
        cantpromedio := 0; 

        while (L2 <> nil) and (L2^.data.codigo = L^.data.codigo) do begin 
            totalpromedio := L2^.data.puntaje + totalpromedio;
            cantpromedio := cantpromedio + 1;
            v[L^.data.categoria] := L2^.data.puntaje + v[L^.data.categoria];

            if (cumplePar(L2^.data.dni)) then 
                writeln('Lector con igual cantidad de digitos pares e impares: ', L2^.data.apeynom);

            L2 := L2^.sig;
        end;
        
        if cantpromedio > 0 then
        begin
            promedioSocios := totalpromedio / cantpromedio;
            L^.data.puntaje := promedioSocios; // Actualizar puntaje promedio
        end;
        
        L := L^.sig;
    end; 
    
    puntoB(v, max, p1);
    writeln('Código de categoría con mayor puntaje total: ', p1);

    write('Ingrese código de libro a eliminar: ');
    readln(codigo);
    eliminar(L, codigo, exito);
    if exito then
        writeln('Libro eliminado con éxito')
    else
        writeln('No se encontró el libro con ese código');
end;

procedure cargarSocios(var L2: lista2); // Añadido var para modificar L2
var     
    s: socio;
begin 
    leerSocio(s);
    while (s.codigo <> -1) do begin 
        armarLista2(L2, s);
        leerSocio(s);
    end; 
end;

var 
    L: lista; 
    L2: lista2;
begin 
    L := nil;
    L2 := nil;
    // cargarDatos(L); // se dispone 
    cargarSocios(L2);
    procesarDatos(L, L2);
end.
