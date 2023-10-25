
program EJ19P7;
const 
    productos = 2000;
    rubro = 15;
type 
    rango_productos = 1..2000;
    rango_rubro = 1..15;

    produc = record 
        nombre:string;
        marca:string;
        numero:rango_rubro;
    end;

    pro = record 
        codigo:rango_productos;
        cantcomprada:integer;
        

    pedido = record 
        numero:integer;
        fecha:integer;
    end;

procedure leerA(var r:pedido; var r2:pro; cantproductos:integer);
begin 
    repeat 
    readln(r.numero);
    readln(r.fecha);
    
    readln(r2.codigo);
    readln(r2.cantcomprada);
    readln(r2.numero);

    v[L^.data.rubro]:= v[L^.data.rubro] + 1;
    cantproductos:= cantproductos +1;
    
    until (r.numero = -999) and (r2.codigo = -999);
end;

procedure puntoA (L:lista,r:,r2:);
var 
    i:integer;
    cantproductos:integer;
begin 
    cantproductos:= 0;
    while (L <> nil) do begin 
        leerA(r:pedido; p:produc);
        v[L^.data.rubro]:= v[L^.data.rubro] + 1;
        for i:=1 to productos do begin 
            if (v[i].rubro > 10) then 
                writeln(r.numero);
        end;
        total:= cantproductos;
        writeln(total);
    

    end;
end;

procedure procesardatos(L:lista);
var 

begin 
    puntoA (L,r,r2);

    puntoB (L,)
end;
