{TEMA 1: un fabricante de dispositivos electronicos desea procesar informacion de repuestos que compro. el fabricante
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

procedure punto1(vc:vcant):integer;
var 
	suma,i,cant,promedio:real;
begin 
	for i:=1 to paises do
		suma:= suma + vc[i]

	promedio:= suma/paises;
	cant:= 0;

	for i:=1 to paises do
		if (vc[i] > promedio) then 
		cant:= cant +1;
end;

procedure punto2(var max:real; precio:real);
begin
	if (precioNUE > max) then 
		max:= precio;  
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


procedure procesardatos(L: lista; vpa: vpais);
var 
    vc: vcant; vp:vprecio; total, cant3, cantMenorPromedio: integer; 
    max: real; promedio: real;
    i: integer;
begin 

	while (L <> nil) do begin 
		vc[L^.data.codigo]:= vc[L^.data.codigo] +1;

		punto1(vp);

		punto2(vp[L^.data.codigo], L^.data.precio);  

		if (cumple3(L^.data.codigo)) then 
			cant3:= cant3 +1;
	end;
	writeln('punto 1: ', cant);

	for i:=1 to paises do 
		writeln('repuesto de pais mas caro ', vp[i],'cuesta ', vpa[i]);
	
	writeln('cantidad de repuestos con 3 ceros', cant3);
end;

var 
	L:lista; vpa:vpais;
begin 
	L:= nil;
	cargarpais(vp);
	cargardatos(L);
	procesardatos(L,vpa);
end,
