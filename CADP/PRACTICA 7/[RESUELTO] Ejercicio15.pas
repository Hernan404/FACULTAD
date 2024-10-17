{Una fábrica de pastas elabora diversos productos y quiere procesar los pedidos que recibe. La fábrica
ofrece 15 tipos de productos (por ej.: 1. tallarines cinta media; 2. ravioles de verdura; 3. ravioles de ricota;
etc.). Para cada tipo de producto se conoce su nombre, unidades disponibles y el precio unitario del
producto. La fábrica dispone de dicha información.
Implementar un programa con:

a) Un módulo que atienda los pedidos. De cada pedido se lee código de pedido, DNI cliente, tipo
de producto (de 1 a 15) y cantidad de unidades pedidas. La lectura de los pedidos finaliza con el
DNI igual a -1. El módulo debe:
    i- Informar el código del pedido y el monto a pagar, de los pedidos que se pueden
    satisfacer.
    ii- Retornar una lista con los pedidos no satisfechos.
    iii- Informar el monto total recaudado con los pedidos que se pudieron satisfacer.

b) Un módulo que retorne la cantidad de productos cuyas unidades disponibles quedaron en
menos de 5 unidades.       if (L^.data.unidades >= v[i]) 

c) Un módulo que imprima los códigos de los pedidos no satisfechos donde el DNI del cliente
tenga la misma cantidad de dígitos pares e impares.}



program EJ15P7;

const 
    tipos = 15;
type 
    rango_tipos = 1..15;

    producto = record 
        nombre: string;
        unidades: integer;
        precio: real;
    end;

    vector = array[rango_tipos] of producto;

    pedido = record 
        codigo: integer;
        dni: integer;
        tipo: integer; // Corregido: tipo debe ser un entero que representa el tipo de producto
        cantUnidades: integer;
    end;

    lista = ^nodo;
    nodo = record 
        data: pedido;
        sig: lista;
    end;

procedure leerPedido(var p: pedido);
begin 
    with p do begin 
        readln(codigo);
        readln(dni);
        readln(tipo); // Tipo es un número, no un registro
        readln(cantUnidades);
    end;
end;

procedure armarLista(var L: lista; p: pedido);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := p;
    aux^.sig := L;
    L := aux;
end;

procedure cargarDatos(var L: lista); // se dispone de esta información
begin 
    // Se dispone
end;

procedure cargarPedidos(var L: lista);
var 
    p: pedido;
begin 
    leerPedido(p);
    while (p.dni <> -1) do begin 
        armarLista(L, p);
        leerPedido(p);
    end;
end;

procedure armarListaNoCumple(var L2: lista; p: pedido);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := p;
    aux^.sig := L2;
    L2 := aux;
end;

procedure atenderPedido(pe: pedido; var pr: vector; var restante: real; var L2: lista; var montoTotal: real);
begin 
    // i.
    if (pr[pe.tipo].unidades >= pe.cantUnidades) then begin 
        pr[pe.tipo].unidades := pr[pe.tipo].unidades - pe.cantUnidades; // Actualiza las unidades disponibles
        restante := pr[pe.tipo].unidades;
        writeln('Código del pedido: ', pe.codigo);
        writeln('Monto a pagar: ', pe.cantUnidades * pr[pe.tipo].precio:2:2);
        // iii.
        montoTotal := montoTotal + (pe.cantUnidades * pr[pe.tipo].precio);
    end
    else begin
        // ii.
        armarListaNoCumple(L2, pe);
    end;
end;

function unidadesMinimas(restante: real): boolean;
begin 
    unidadesMinimas := (restante < 5);
end;

function pares(dni: integer): boolean;
var 
    par, impar, digito: integer;
begin 
    par := 0;
    impar := 0;
    while (dni > 0) do begin 
        digito := dni mod 10;
        if (digito mod 2 = 0) then 
            par := par + 1
        else 
            impar := impar + 1;
        dni := dni div 10;
    end;
    pares := (par = impar);
end;

procedure procesarDatos(var L: lista; var L2: lista; var pr: vector);
var 
    restante: real;
    cant5: integer;
    montoTotal: real;
begin 
    cant5 := 0;
    montoTotal := 0;
    while (L <> nil) do begin 
        // a)
        atenderPedido(L^.data, pr, restante, L2, montoTotal);
        // b)
        if (unidadesMinimas(restante)) then 
            cant5 := cant5 + 1;
        L := L^.sig;
    end;
    // iii.
    writeln('Monto total recaudado con pedidos satisfechos: ', montoTotal:2:2);
end;

procedure imprimirPedidosNoCumplen(L2: lista);
begin 
    while (L2 <> nil) do begin 
        if (pares(L2^.data.dni)) then 
            writeln('Código de pedido no satisfecho con misma cantidad de dígitos pares e impares en DNI: ', L2^.data.codigo);
        L2 := L2^.sig;
    end;
end;

var 
    L, L2: lista;
    productos: vector;
begin 
    L := nil;
    L2 := nil;
    cargarDatos(L); // Se dispone de esta información
    cargarPedidos(L);
    procesarDatos(L, L2, productos);
    imprimirPedidosNoCumplen(L2);
end.
