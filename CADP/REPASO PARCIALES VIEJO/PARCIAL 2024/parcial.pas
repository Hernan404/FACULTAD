{un fabricante de dispositivos electronicos desea procesar informacion de repuestos que compro. el fabricante
dispone de una estructura de datos con informacion de los 200 paises en los cuales provienen repuestos, en la
que para cada codigo de pais (1..200) se tiene su nombre

realizar un programa que
a) lea la informacion de los repuestos comprados y la almacene en una estructura de datos adecuada.
de cada repuesto se lee codigo, precio y codigo del pais del que proviene (entre 1 y 200) la lectura finaliza
al ingresar el codigo -1 (que no debe procesarse)

b) una vez cargada la informacion, procese la estructura de datos del inciso a e informe
    1. la cantidad de paises para los que la cantidad de repuestos comprados es menor que 
    el promedio de repuestos a todos los paises
    2. para cada pais, el nombre del pais y el precio del repuesto mas caro 
    3. la cantidad de repuestos que poseen al menos 3 ceros en su codigo}



program PARCIAL;
const 
    paises = 200;
type 
    rango_pais = 1..paises;
    repuesto = record 
        codigo:integer;
        precio:real;
        cod_pais:rango_paises;
    end;

    lista = ^nodo 
    nodo = record 
        data:repuesto;
        sig:lista;
    end;

    vpais = array [rango_pais] of string;
    vcant = array [rango_pais] of integer;


procedure cargarnombrepais (vp:vpais); // se dispone

procedure armarlista(var L:lista; r:repuesto);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= r;
    aux^.sig:= L;
    L:= aux;
end;

procedure leer(var r:repuesto);
begin 
    with r do begin 
        readln(codigo);
        readln(precio);
        readln(cod_pais);
    end;
end;

procedure cargardatos(var L:lista);
var 
    r:repuesto;
begin 
    leer(r);
    while (r.codigo <> -1) do begin 
        armarlista(L,r);
        leer(r);
    end;
end;

procedure inivector (var vc:vcant);
var 
    i:integer;
begin 
    for i:=1 to paises do 
        vc[i]:= 0;
end;

procedure punto2 (vp:vpaises; precio:real; var max:real; var p1:string);
var 
    i:integer;
begin 
    for i:=1 to paises do begin 
        if (precio > max) then begin 
            max:= precio; 
            p1:= vp[i];
        end;

    end;

function punto3 (cod:integer):boolean;
var 
    ceros:integer;
begin 
    ceros:= 0;
    while (num <> 0) and (ceros < 3) do begin 
        if ((num mod 10) = 0) then 
            ceros:= ceros +1;
        num:= num div 10; 
    end;
    punto3:= (ceros >= 3);
end;



procedure procesardatos (L:lista);
var 
    vc:vcant; total:integer; max,precio:real; cant3,cant:integer; p1:string; 
begin 
    total:= 0; precio:= 0; max:real; p1:= ''; cant3:= 0; cant:= 0;
    while (L <> nil) do begin 

        vc[L^.data.cod_pais]:= vc[L^.data.cod_pais] +1;

        total:= total +1;

        precio:= L^.data.precio;
        puntoB(vp,precio,max,p1);

        if (cumple3(L^.data.codigo)) then 
            cant3:= cant 3 +1;
    L:= L^.sig;
    end;
    promedio:= vc[L^.data.cod_pais]/200;
    for i:=1 to paises do begin 
        if (promedio < total) then 
        cant:= cant +1;

        writeln(p1);
    end;
    
    writeln(cant);
    writeln(cant3);
end;


var 
    L:lista; vp:vpais;
begin 
    L:= nil;
    cargardatos(L);
    cargarnombrepais(vp);
    procesardatos(L);
end.



program PARCIAL;
const 
    paises = 200;
type 
    rango_pais = 1..paises;
    repuesto = record 
        codigo: integer;
        precio: real;
        cod_pais: rango_pais;
    end;

    lista = ^nodo;
    nodo = record 
        data: repuesto;
        sig: lista;
    end;

    vpais = array [rango_pais] of string;
    vcant = array [rango_pais] of integer;
    vprecio = array [rango_pais] of real;

procedure cargarnombrepais(var vp: vpais); // se dispone

procedure armarlista(var L: lista; r: repuesto);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

procedure leer(var r: repuesto);
begin 
    with r do begin 
        readln(codigo);
        readln(precio);
        readln(cod_pais);
    end;
end;

procedure cargardatos(var L: lista);
var 
    r: repuesto;
begin 
    leer(r);
    while (r.codigo <> -1) do begin 
        armarlista(L, r);
        leer(r);
    end;
end;

procedure inivector(var vc: vcant; var vp: vprecio);
var 
    i: integer;
begin 
    for i := 1 to paises do begin
        vc[i] := 0;
        vp[i] := 0;
    end;
end;

function punto3(cod: integer): boolean;
var 
    ceros: integer;
begin 
    ceros := 0;
    while (cod <> 0) and (ceros < 3) do begin 
        if ((cod mod 10) = 0) then 
            ceros := ceros + 1;
        cod := cod div 10; 
    end;
    punto3 := (ceros >= 3);
end;

procedure procesardatos(L: lista; vp: vpais);
var 
    vc: vcant; vprecios: vprecio; total, cant3, cantMenorPromedio: integer; 
    max: real; promedio: real;
    i: integer;
begin 
    inivector(vc, vprecios);
    total := 0; 
    cant3 := 0;
    cantMenorPromedio := 0;
    
    while (L <> nil) do begin 
        vc[L^.data.cod_pais] := vc[L^.data.cod_pais] + 1;
        if (L^.data.precio > vprecios[L^.data.cod_pais]) then
            vprecios[L^.data.cod_pais] := L^.data.precio;
        total := total + 1;
        if (punto3(L^.data.codigo)) then 
            cant3 := cant3 + 1;
        L := L^.sig;
    end;

    promedio := total / paises;
    for i := 1 to paises do begin 
        if (vc[i] < promedio) then 
            cantMenorPromedio := cantMenorPromedio + 1;
    end;

    writeln('Cantidad de paises con repuestos por debajo del promedio: ', cantMenorPromedio);
    for i := 1 to paises do begin 
        writeln('Pais: ', vp[i], ' - Precio del repuesto más caro: ', vprecios[i]:0:2);
    end;
    writeln('Cantidad de repuestos con al menos 3 ceros en su código: ', cant3);
end;

var 
    L: lista; vp: vpais;
begin 
    L := nil;
    cargarnombrepais(vp); // Cargar nombres de paises antes de procesar datos
    cargardatos(L);
    procesardatos(L, vp);
end.
