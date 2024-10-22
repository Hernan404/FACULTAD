{Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5:
comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura
no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe
leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee
el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que
impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
parámetro (el mismo puede no existiDDDDDDDr)}

program EJ9P7;
const 
    generos = 8;
type 
    rango_generos = 1..8;

    pelicula = record 
        codigo: integer;
        titulo: string[50];
        codigo_genero: rango_generos;
        puntaje_prom: real;
    end;

    critico = record 
        DNI: integer;
        apeynom: string[50];
        codigo: integer;
        puntaje: real;
    end;

    lista = ^nodo;
    nodo = record 
        data: pelicula;
        sig: lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record 
        data: critico;
        sig: lista2;
    end;

    vector = array [rango_generos] of real;

procedure cargarpelicula(var L: lista); // se dispone
var 
    p: pelicula;
begin 
    // Suponiendo que este procedimiento se encarga de cargar la lista de películas inicialmente
    // Añade tus propias películas aquí para probar
end;

procedure leer_pelicula(var p: pelicula); 
begin 
    with p do begin 
        readln(codigo);
        readln(titulo);
        readln(codigo_genero);
        readln(puntaje_prom);
    end;
end;

procedure armarlistaPelicula(var L: lista; p: pelicula);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := p;
    aux^.sig := L;
    L := aux;
end;

procedure leer(var c: critico);
begin 
    with c do begin 
        readln(DNI);
        readln(apeynom);
        readln(codigo);
        readln(puntaje);
    end;
end;

procedure armarlista2(var L2: lista2; c: critico);
var 
    aux: lista2;
begin 
    new(aux);
    aux^.data := c;
    aux^.sig := L2;
    L2 := aux;
end;

procedure cargarcriticas(var L2: lista2);
var 
    c: critico;
begin 
    repeat
        leer(c);
        if c.codigo <> -1 then
            armarlista2(L2, c);
    until c.codigo = -1;
end;

function pares(dni: integer): boolean;
var
    par, impar: integer;
begin
    par := 0;
    impar := 0;
    while dni > 0 do begin
        if (dni mod 2) = 0 then
            par := par + 1
        else
            impar := impar + 1;
        dni := dni div 10;
    end;
    pares := (par = impar);
end;

procedure eliminar(var L: lista; cod: integer);
var
    ant, act: lista;
begin
    ant := L;
    act := L;
    while (act <> nil) and (act^.data.codigo <> cod) do begin
        ant := act;
        act := act^.sig;
    end;
    if act <> nil then begin
        if ant = act then
            L := L^.sig
        else
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;

procedure procesardatos(var L: lista; L2: lista2);
var 
    v: vector;
    cant, codACT: integer;
    promedio, max: real;
    cod1: rango_generos;
    pelicula: ^pelicula;
begin 
    // Inicializar vector de puntajes y contador de géneros
    for codACT := 1 to generos do
        v[codACT] := 0;

    max := -1;

    while L2 <> nil do begin 
        codACT := L2^.data.codigo;
        cant := 0;
        promedio := 0;

        // Recorremos la lista de críticas para el mismo código de película
        while (L2 <> nil) and (codACT = L2^.data.codigo) do begin 
            // punto A
            promedio := promedio + L2^.data.puntaje;
            cant := cant + 1;

            // punto C
            if pares(L2^.data.DNI) then 
                writeln('Crítico con DNI igual cantidad de pares e impares: ', L2^.data.apeynom);

            L2 := L2^.sig;
        end;

        // punto A
        if cant > 0 then begin
            promedio := promedio / cant;

            // Encontrar la película en la lista de películas y actualizar el puntaje promedio
            while (L <> nil) and (L^.data.codigo <> codACT) do 
                L := L^.sig;

            if L <> nil then 
                L^.data.puntaje_prom := promedio;

            // punto B
            if L <> nil then 
                v[L^.data.codigo_genero] := v[L^.data.codigo_genero] + promedio;
        end;
    end;

    // Encontrar el código de género con mayor puntaje
    for i := 1 to generos do begin
        if v[i] > max then begin
            max := v[i];
            cod1 := i;
        end;
    end;
    
    writeln('El código de género que más puntaje obtuvo entre todas las críticas es: ', cod1);
end;

var 
    L: lista;
    L2: lista2;
    codEliminar: integer;
begin 
    L := nil; 
    L2 := nil;
    cargarpelicula(L); // se dispone 
    cargarcriticas(L2); 
    procesardatos(L, L2);
    write('Ingrese el código de película a eliminar: '); 
    readln(codEliminar);
    eliminar(L, codEliminar);
end.

