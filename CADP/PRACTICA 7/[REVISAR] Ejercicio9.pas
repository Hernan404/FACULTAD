

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
parámetro (el mismo puede no existir)}



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
parámetro (el mismo puede no existir)}





program EJ9P7;

const 
    generos = 8;

type 
    rango_genero = 1..8;
    
    pelicula = record 
        codigo: integer;
        titulo: string;
        genero: rango_genero;
        puntaje: real;
    end;
    
    critico = record 
        dni: integer;
        apeynom: string;
        codigo_pelicula: integer;
        puntaje_otorgado: real;
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
    
    vector = array [rango_genero] of real;
    contador = array [rango_genero] of integer;

// Procedimiento para inicializar el vector
procedure inivector(var v: vector); 
var 
    i: integer;
begin 
    for i := 1 to generos do 
        v[i] := 0;
end;

// Procedimiento para inicializar el contador
procedure inicontador(var c: contador); 
var 
    i: integer;
begin 
    for i := 1 to generos do 
        c[i] := 0;
end;

// Procedimiento para leer una película
procedure leer(var r: pelicula);
begin 
    with r do begin 
        readln(codigo);
        readln(titulo);
        readln(genero);
        readln(puntaje);
    end;
end;

// Procedimiento para armar una lista de películas
Procedure armarlista(var L: lista; r: pelicula);
Var 
    nue: lista;
Begin  
    New(nue);  
    nue^.data := r;  
    nue^.sig := L;  
    L := nue;
End;

// Procedimiento para leer un crítico
procedure leer_critico(var c: critico);
begin 
    with c do begin 
        readln(dni);
        readln(apeynom);
        readln(codigo_pelicula);
        readln(puntaje_otorgado);
    end;
end;

// Procedimiento para armar una lista de críticos
Procedure armarlista2 (var pri: lista2; c: critico);
var 
    ant, nue, act: lista2;
begin
    new(nue);
    nue^.data := c;
    act := pri;
    ant := pri;
    while (act <> NIL) and (act^.data.codigo_pelicula < c.codigo_pelicula) do 
    begin
        ant := act;
        act := act^.sig;
    end;
    if (ant = act) then 
        pri := nue  
    else  
        ant^.sig := nue;
    nue^.sig := act;
end;

// Procedimiento para cargar las películas en la lista
procedure cargarPelicula(var L: lista);
var 
    r: pelicula;
begin 
    leer(r);
    while (r.codigo <> -1) do begin
        armarlista(L, r);
        leer(r);
    end;
end;

// Procedimiento para cargar los críticos en la lista
procedure cargarCritico(var L2: lista2);
var 
    c: critico;
begin 
    leer_critico(c);
    while (c.codigo_pelicula <> -1) do begin 
        armarlista2(L2, c);
        leer_critico(c);
    end;
end;

// Función para verificar si un DNI tiene igual cantidad de dígitos pares e impares
function cumplepares(dni: integer): boolean;
var 
    par, impar: integer;
begin 
    par := 0; 
    impar := 0;
    while (dni > 0) do begin 
        if (((dni mod 10) mod 2) = 0) then 
            par := par + 1
        else 
            impar := impar + 1;
        dni := dni div 10;
    end;
    cumplepares := (par = impar) and (par <> 0) and (impar <> 0); 
end;

procedure puntoB(v:vector; vc:contador; var max,p1:integer);
var 
	i:integer;
begin 
   for i := 1 to generos do begin
        if (c[i] <> 0) then
            v[i] := (v[i] / c[i]);
            
        if (v[i] > max) then begin
            max := v[i];
            p1 := i;
        end;
   end;
end;


// Procedimiento para procesar los datos
procedure procesardatos(L: lista; L2: lista2);
var 
    r: pelicula;
    auxL: lista;
    auxL2: lista2;
    v: vector;
    vc: contador;
    max: real;
    p1: integer;
begin 
    inivector(v);
    inicontador(c);
    max := -1;
    p1 := 0;
    //GUARDO LAS LISTAS EN UNA VARIABLE AUXILIAR Y RECORRO LAS DOS        
    auxL := L;
    while (auxL <> nil) do begin
        auxL2 := L2;
        while (auxL2 <> nil) do begin
            //SI CUMPLE QUE LOS CODIGOS SEAN IGUALES 
            if (auxL2^.data.codigo_pelicula = auxL^.data.codigo) then begin
                // Incrementa el contador de cantidad de puntajes
                cantpuntajes:= cantpuntajes +1;
                // Calcula el nuevo promedio, 
                auxL^.data.puntaje := auxL^.data.puntaje + (auxL2^.data.puntaje_otorgado - auxL^.data.puntaje) / cantpuntajes;

                v[auxL^.data.genero] := v[auxL^.data.genero] + auxL2^.data.puntaje_otorgado;
                vc[auxL^.data.genero] := vc[auxL^.data.genero] + 1;

                if cumplepares(auxL2^.data.dni) then 
                    writeln('Critico con DNI pares/impares: ', auxL2^.data.apeynom);
            end;
            auxL2 := auxL2^.sig;
        end;
        auxL := auxL^.sig;
    end;
    puntoB(v,vc,max,p1);

    writeln('Genero con más puntaje: ', p1);
end;

// Procedimiento para eliminar una película
Procedure eliminar(var pri: lista; codigo: integer; var exito: boolean);
var 
    ant, act: lista;
begin 
    exito := false;
    act := pri;
    while (act <> NIL) and (act^.data.codigo <> codigo) do begin
        ant := act;
        act := act^.sig;
    end;   
    if (act <> NIL) then begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;

var 
    L: lista;
    L2: lista2;
    exito: boolean;
    codigo: integer;
begin 
    L := nil;
    L2 := nil;
    cargarPelicula(L);
    cargarCritico(L2);
    procesardatos(L, L2);
    
    // Para eliminar una película se debe ingresar el código
    writeln('Ingrese el código de la película a eliminar:');
    readln(codigo);
    eliminar(L, codigo, exito);
    if exito then
        writeln('Película eliminada.')
    else
        writeln('Código de película no encontrado.');
end.



