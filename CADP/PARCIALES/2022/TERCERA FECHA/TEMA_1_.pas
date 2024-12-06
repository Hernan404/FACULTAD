{ TERCERA FECHA 2022

 Un supermercado necesita analizar la información de las compras realizadas en el último año para reposición de stock.

 a) Realizar un módulo que cargue en una estructura de datos adecuada la información de las compras. De cada compra se conoce 
 el monto abonado, el mes en que se realizó la compra, la cantidad de productos comprados y el nombre del proveedor. 
 Por cada proveedor puede haber más de una compra. La información de las compras debe quedar ordenada por nombre de proveedor.
 La lectura finaliza al ingresar la compra con monto -1 que no debe procesarse.

b) Realizar un programa que utilice la información generada en el inciso a) e informe:

i) Los nombres de los proveedores para los cuales el monto total facturado superó los 30.000 pesos.

ii) Los dos meses en los que se realizaron mayor cantidad de compras.

iii) El monto promedio de las compras realizadas durante el mes de julio}

program TERCERA_FECHA_2022;
const 
  meses = 12;
type 
  rango_meses = 1..meses;

  compra = record 
    monto:real;
    mes:rango_meses;
    cantProductos:integer;
    nombre:string;
  end; 


  lista = ^nodo;
  nodo = record 
    data:compra;
    sig:lista;
  end; 

  vmes = array [rango_meses] of integer; 


Procedure armarlista (var pri: lista; r:compra);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := r;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.nombre < r.nombre) do
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end; 

procedure leer(var r:compra);
begin 
  with r do begin 
    readln(monto);
    readln(mes);
    readln(cantProductos);
    readln(nombre);
  end; 
end;

procedure cargardatos(L:lista);
var 
  r:compra;
begin 
  leer(r);
  while (r.monto <> -1) do begin 
      armarlista(L,r);
      leer(r);
  end;
end;

procedure datameses(vm:vmes; var max1,max2:real; var m1,m2:integer);
var 
  i:integer;
begin 
  for i:=1 to meses do begin 
    if (vm[i] > max) then begin 
        max2:= max1;
        m2:= m1;
        max1:= vm[i];
        m1:= i;
    end
    else if (vm[i] > max2) then begin 
        max2:= v[i];
        m2:= i;
    end; 
  end;
end; 

procedure procesardatos(L:lista);
var 
  total:real; vm:vmes; totalMonto,max1,max2:real; m1,m2,comprasJulio:integer;
begin 
  max1:= -1; max2:= -1; m1:= 0; m2:= 0;
  totalMonto:= 0; promedio:= 0; comprasJulio:= 0; 
  while (L <> nil) do begin 
    totalMonto:= L^.data.monto + totalMonto;

    if (L^.data.monto > 30.000) then 
      writeln(L^.data.nombre);

    vm[L^.data.mes]:= vm[L^.data.mes] +1; 

    if (L^.data.mes = 6) then 
      comprasJulio:= comprasJulio + L^.data.monto:
  
  L:= L^.sig; 
  end; 
  mesMascompras(vm,max1,max2,m1,m2);
  writeln(m1,m2);
  promedio:= totalMonto/comprasJulio;
  writeln(promedio:2:0);
end;

var 
  L:lista;
begin 
  L:= niL;
  cargardatos(L);
  procesardatos(L);
end. 
