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
        nombre:string;
        unidades:integer;
        precio:real;
    end;

    pedido = record 
        codigo:integer;
        DNI:integer;
        tipo:tipos;
        unidades_pedidas:integer;
    end;

    lista = ^nodo;
    nodo = record 
        data:pedido;
        sig:lista;
    end;

    vector = array [rango_tipos] of producto;

procedure leer(var r:pedido);
begin 
    with r do begin 
        readln(DNI);
        readln(tipo);
        readln(unidades_pedidas);
    end;
end;

procedure armarlista(var L: lista; r: pedido);
var 
    nuevo: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := nuevo;
end;

procedure armarlista2(var L2: lista; r: pedido);
var 
    aux: lista;
begin 
    new(nuevo);
    aux^.data := r;
    aux^.sig := L2;
    L2 := nuevo;
end;

procedure cargarpedido (L:lista);
var 
    r:pedido;
begin 
    while (r.DNI <> -1) do begin 
        leer(r);
        armarlista(r);
    end;
end;

procedure puntoA(L,L2:lista,monto_total:real);
var
    i:integer; monto:real;
begin 
    while (L <> nil) do begin 
        for i:=1 to tipos do begin 
            if (L^.data.unidades >= v[i].unidades_pedidas) then begin
                monto:= L^.data.unidades_pedidas * v[i].precio; 
                writeln(vp[i].precio, vp[i].codigo);
            end 
            else begin  
                armarlista2(L2,L^.data);
            end;
        end;
    L:= L^.sig;
    end;
end;

function puntoB (unidades:integer; vp:vector):integer;
var 
    i:integer; cant,resta:integer;
begin 
    cant:= 0;
    for i:=1 to tipos do begin 
        resta:= unidades - vp[i].unidades_pedidas;
        if (resta < 5) then 
            cant:= cant +1;
    end;
    puntoB:= cant;
end;

procedure puntoC(L2:lista);
var 
    par,impar:integer; dni:integer;
begin 

    while(L2 <> NIL) do begin 
        par:= 0; impar:= 0; dni:= 0;
        
        dni:= L^.data.DNI;

        while (dni > 0) do begin 
            if (((dni mod 10) mod 2) = 0) then 
                par:= par +1;
            else 
                impar:= impar +1;
            
            dni:= dni div 10;
        end;

        if (par = impar) then 
            writeln(L2^.data.dni);
    end;
end;


procedure procesardatos(L,L2:lista; vp:vector);
var 
    monto:real;
begin 
    monto:= 0;

    puntoA(vp,L,L2,monto);
    puntoB(L^.data.unidades,vp);
    puntoC(L2);

    writeln('punto A', monto)
    writeln('punto B', (puntoB));
end;




var 
    L,L2:lista;
begin 
    L:= NIL; L2:= NIL;
    cargarpedido(L); 
    procesardatos(L,L2);
end.
