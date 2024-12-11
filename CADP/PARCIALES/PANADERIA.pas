{Una panaderia artesanal de la plata vende productos de elaboracion propia
la panaderia agrupa sus productos en 26 categorias, para cada categoria se conoce
su nombre y precio por kilo del producto

La panaderia dispone de la informacion de todas las compras realizadas en el ultimo año
de cada compra se conoce el DNI del cliente, la categoria del producto (1..26) y la cantidad
de kilos comprados. la informacion se encuentra ordenada por DNI del cliente
realizar un modulo que retorne la informacion de las categorias en una estructura de datos
adecuada. la informacion se lee por teclado y sin ningun orden en particular. de cada categoria se lee el nombre
el codigo (1..26) y el precio

b) realizar un modulo que reciba la informacion de todas las compras, la informacion de 
las categorias y retorne: 
1. DNI del cliente que mas compras ha realizados
2. monto total recaudado por cada categoria
3. cantidad de compras de clientes con DNI compuesto por al menos 3 digitos pares }

program PANADERIA;
const 
  categorias = 26;
type 
  rango_categorias = 1..categorias;

  categoria = record 
    nombre:string;
    precio:real;
  end; 

  vcategoria = array[rango_categorias] of categoria;

  compras = record 
    dni:integer;
    categoria:categoria;
    cantKG:real;
  end; 

  lista = ^nodo;
  nodo = record 
    data:compras;
    sig:lista;
  end; 

  vmonto = array[rango_categorias] of real; 

procedure cargarcompra(L:lista); //se dispone 


procedure cargardatos(var vc:vcategoria);
var 
  i:integer; r:categoria; codigo:rango_categorias;
begin 
  for i:=1 to categorias do begin 
    readln(vc[i].nombre);
    readln(codigo);
    readln(vc[i].precio);

    vc[codigo]:= r;
  end; 
end; 

procedure punto1(cantCompras:integer; dni:integer; var max,p1:integer);
begin 
  if (cantCompras > max) then begin 
    max:= cantCompras;
    p1:= dni;
  end; 
end; 

function cumplePares(dni:integer):boolean;
var 
  par:integer;
begin 
  par:= 0; 
  while (dni > 0) do begin 
    if (dni mod 10 mod 2 = 0) then 
      par:= par +1;

  dni:= dni div 10;
  end; 
  cumplePares:= (par >= 3);
end; 

procedure procesardatos(L:lista; vc:categoria);
var 
  cantCompras,cant3,max,p1:integer;
  montoTotal:real; 

begin 
  cantCompras:= 0; cant3:= 0; max:= -1; p1:= 0;

  while (L <> nil) do begin 

    cantCompras:= cantCompras +1; 
    punto1(cantcompras,L^.data.dni,max,p1);

    if (cumplePares(L^.data.dni)) then 
      cant3:= cant3 +1;
    
    montoTotal:= vc[L^.data.categoria].precio * L^.data.cantKG;

  L:= L^.sig; 
  end;
  writeln(p1);
  writeln(montoTotal);
  writeln(cant3);

end; 

var 
  L:lista; vc:vcategoria;
begin 
  L:= nil; 

  cargardatos(vc); 
  cargarcompra(L); // se dispone;
  procesardatos(L,vc);
end.
