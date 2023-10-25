program EJ15P7;
const 
    tipos = 15;
type 
    rango_tipo = 1..15;
    
    productos = record 
        nombre:string;
        unidades:integer;
        precio:real;
    end;

    pedidos = record 
        codigo:integer;
        DNI:integer;
        tipo:rango_tipo;
        cantpedidos:integer;
    end;

    lista = ^nodo 
    nodo = record 
        data:productos;
        sig:lista,
    end;

    vector = array [rango_tipo] of integer;

procedure armarlista(L:lista; r:pedidos);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= r;
    aux^sig:= L;
    L:= aux;
end;

procedure armarlista2(L2:lista; p:producto);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= p;
    aux^sig:= L2;
    L2:= aux;
end;
procedure puntoA(var r:pedidos);
begin 
    writeln('=INGRESE SUS PEDIDOS=');

    with r do begin 
        writeln('codigo');
        readln(codigo);
        writeln('DNI');
        readln(DNI);
        writeln('tipo');
        readln(tipo);
        writeln('cantidad de pedidos');
        readln(cantpedidos);
    end;
end;

procedure puntoAI (r:pedidos; p:unidades);
var 
    total:real;
begin 
    total:= 0;
    //PUNTO Ai
    for i:=1 to tipo do begin 
        if (L^.data.cantpedidos <= v[i].unidades) then begin 
            v[i].unidades:= L^.data.cantpedidos - v[i].unidades;
            writeln('==CODIGO Y PRECIO DE PRODUCTOS QUE SATISFACEN');
            writeln('producto', v[i].codigo);
            writeln('precio', v[i].precio);
            total:= v[i].precio + total;
        end
        else begin
            //punto Aii 
            armarlista2(L2,p)
        end;
    end;
    //punto Aiii
    writeln('monto total recaudado', total);
end;

procedure puntoB (r:pedidos; var cumple2:integer);
var 
    i:Integer;
begin 
    for i:=1 to tipo do begin 
        if (v[i].unidades < 5) then begin 
            cumple2:= cumple2 +1;
        end; 
    end;
end;

function pares(num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;

    while (digito > 0) do begin 
        digito:= num mod 10;
        if (digito mod 2 = 0) then begin 
            par:= par +1;
        else 
            impar:= impar +1;
        end;
        num:= digito div 10;
    end;
    pares:= (par = impar);
end;

procedure imprimirL2(L2:lista; p:producto);
begin 
    while (L2 <> nil) do begin 
        writeln('codigo de lo que no satisface' L^.data.codigo);
    L2:= L2^.sig;
    end;
end;
 
procedure procesardatos (L:lista);
var 
    r:pedidos;
    p:productos;
    v:vector;
    i:integer;
    cumple2:integer;
begin 
    cumple2:= 0;
    inivector(v);
    while (L <> nil) do begin 
    //PUNTO A
        puntoA(r:pedidos);
        puntoAI(r:pedidos; p:unidades);
    //PUNTO B 
            puntoB(r:pedidos);
    //PUNTO C 
        if (pares(L^.data.DNI)) then 
            imprimirL2(L2,L^.data);

    end;
end;

var 
    L:lista;
begin 
    L:= nil;

    cargardatos(L);
    procesardatos(L);
end. 
