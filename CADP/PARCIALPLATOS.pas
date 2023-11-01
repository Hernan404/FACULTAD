program ej;
const 
    cate = 4;
type 
    rango_cate = 1..4;

    platos = record 
        nombre:string;
        precio:real;
        categoria:rango_cate;
        cantingre:integer;
        nombreingre:string;
    end;

    lista = ^nodo 
    nodo = record 
        data:platos;
        sig:lista;
    end; 

    vector = array [rango_cate] of integer;

procedure inivector (var v:vector);
var 
    i:rango_cate;
begin 
    for i:=1 to cate do begin 
        v[i]:= 0;
    end;
procedure cargardatos(var L:lista);
procedure leer(var r:platos);
procedure armarlista(var L:lista);

procedure puntoB (v:vector; var max1,max2,p1,p2:integer);
var 
    i:rango_cate;
begin 
    for i:=1 to cate do begin 
        if (v[i] > max1) then begin  
            max2:= max1;
            p2:= p1;
            max1:= v[i];
            max2:= i;
        end 
        else 
            if (max2 > max1) then begin  
                max2:= v[i];
                p2:= i;
            end;
    end;
end; 

procedure procesardatos(L:lista);
var 
    r:platos;
    max1,max2,p1,p2:integer;
    promedio:real;
    cantplatos:real;
    L2:lista;
begin 
    L2:= nil;
    max1:= -1;
    max2:= -1;
    p1:= 0;
    p2:= 0;
    promedio:= 0;
    cantplatos:= 0;

    while (L <> nil) do begin 
        v[L^.data.categoria]:= v[L^.data.categoria] +1;


        if (L^.data.nombreingre = 'perejil') then 
            armarlista(L2,r);

        puntoB(v,max1,max2,p1,p2); 
        cantplatos:= cantplatos +1;

        if (L^.data.cantingre > 5) then 
            promedio:= L^.data.precio + promedio;
        

    L:= L^.sig;
    end;
    writeln('las dos categorias con mas platos', p1,p2);
    writeln('el promedio de platos con mas de 5 ingredientes', promedio/cantplatos);
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
