{19. Un comercio necesita procesar la información de los pedidos realizados. El comercio dispone de la
información de sus 2000 productos. De cada producto se almacena nombre, marca y número de rubro (1
a 15) al que pertenece.
Implementar un programa que:
a) Invoque a un módulo que lea la información de los pedidos y la procese. De cada pedido se lee número
de pedido, fecha y todos los productos solicitados en el pedido. De cada producto solicitado se lee código
de producto (1 a 2000) y cantidad comprada. La lectura de la información de los pedidos finaliza con el
número -999 y, para cada pedido, la lectura de sus productos solicitados finaliza con el código de
producto -999. El módulo debe:
i- Retornar, en una estructura adecuada, la cantidad de productos solicitados para cada rubro.
ii- Retornar, en una estructura adecuada, los números de pedidos junto a su cantidad de
productos solicitados, para los pedidos que tengan más de 10 productos solicitados.
iii- Informar la cantidad total de productos solicitados al comercio.
b) Lea un valor, e invoque a un módulo que reciba el valor leído y la estructura retornada en a) que
corresponda para imprimir los números de pedidos que tengan la misma cantidad de dígitos pares e
impares y cuyo cantidad total de productos pedidos sea menor al valor recibido.
c) Invoque a un módulo que reciba la estructura retornada en a) que corresponda para retornar el
número de rubro con mayor cantidad de productos solicitados. El programa debe informar el valor
retornado por el módulo.}


program EJ19P7;
const 
    rubros = 15;
    productos = 2000;
type 
    rango_rubros = 1..15;
    rango_productos = 1..2000;

    producto = record 
        nombre: string;
        marca: string;
        numero: rango_rubros;
    end;

    pedido = record
        codigo: integer;
        cantComprados: integer;
    end;

    info = record 
        numero: integer;
        fecha: integer;
        solicitado: pedido;
    end;

    lista = ^nodo;
    nodo = record 
        data: info;
        sig: lista;
    end;

    vrubro = array [rango_rubros] of integer;

procedure cargarproducto (var vp: array of producto);
begin 
    // Se dispone
end; 

procedure leer(var r: info);
var 
    p: pedido;
begin 
    with r do begin 
        readln(numero);
        if (numero <> -999) then begin 
            readln(fecha);
            readln(p.codigo);
            while (p.codigo <> -999) do begin 
                readln(p.cantComprados);
                solicitado := p;
                readln(p.codigo);
            end;
        end;
    end;
end;

procedure armarlista(var L: lista; r: info);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

procedure armarlista2(var L2: lista; cantComprados, numero: integer);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data.pedido.cantComprados := cantComprados;
    aux^.data.numero := numero;
    aux^.sig := L2;
    L2 := aux;
end;

procedure cargardatos(var L: lista);
var 
    r: info;
begin 
    leer(r);
    while (r.numero <> -999) do begin 
        armarlista(L, r);
        leer(r);
    end;
end;

procedure procesarB(L: lista; num: integer);
var 
    par, impar, numeroA: integer;
    parImpar: boolean;
begin 
	parImpar:= false;
    while (L <> nil) do begin 
        par := 0; impar := 0;
        numeroA := L^.data.numero;

        while (numeroA > 0) do begin 
            if (numeroA mod 2 = 0) then 
                par := par + 1
            else 
                impar := impar + 1;
            numeroA := numeroA div 10;
        end;
        parImpar := (par = impar);

        if (parImpar and (L^.data.pedido.cantComprados < num)) then 
            writeln(L^.data.numero); 

        L := L^.sig;
    end;
end;

procedure procesarC(vr: vrubro);
var 
    i, max, rubroMax: integer;
begin 
    max := -1;
    rubroMax := 0;
    for i := 1 to rubros do begin 
        if (vr[i] > max) then begin
            max := vr[i];
            rubroMax := i;
        end;
    end;

    writeln('Rubro con mayor cantidad de productos solicitados: ', rubroMax);
end;

procedure procesardatos(L: lista);
var 
    vr: vrubro; L2: lista;
    total, num, i: integer;
begin 
    total := 0;
    L2 := nil;
    for i := 1 to rubros do 
        vr[i] := 0;

    while (L <> nil) do begin 
        // i
        vr[L^.data.solicitado.codigo] := vr[L^.data.solicitado.codigo] + L^.data.solicitado.cantComprados;
        // ii
        if (L^.data.solicitado.cantComprados > 10) then 
            armarlista2(L2, L^.data.solicitado.cantComprados, L^.data.numero);
        // iii
        total := total + L^.data.solicitado.cantComprados;

        L := L^.sig;
    end;

    // b)
    readln(num);
    procesarB(L2, num);

    // c) 
    procesarC(vr);
end;

var 
    L: lista;
    vp: array[1..productos] of producto;
begin 
    L := nil;
    cargarproducto(vp); // Se dispone;
    cargardatos(L);
    procesardatos(L);
end.

