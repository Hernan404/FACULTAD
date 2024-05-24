11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. 
De cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: 
cine, 3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas 
permitidas para el evento y costo de la entrada. Se pide:

1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se 
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de 
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.

2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que 
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de 
personas permitidas



program EJ11P7;
const 
    evento = 100;
    tipo = 5;
type 
    rango_evento = 1..100;
    rango_tipo = 1..5;
    event = record 
        nombre:string;
        tipo:1..5;
        lugar:string;
        cantpersonas:integer;
        costo:real;
    end;

    ventas = record 
        codigo:integer;
        numero:rango_evento;
        dni:integer;
        cantentradas:integer;
    end;

    vEvento = array [rango_evento] of integer;

    lista =  ^nodo 
    nodo = record 
        data:ventas;
        sig:lista;
    end;

procedure leer(r:ventas);
begin 
    with r do begin 
        readln(codigo);
        readln(numero);
        readln(dni);
        readln(cantentradas);
    end;
end;

procedure armarlista(L:lista; r:ventas);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= r;
    aux^.sig:= L;
    L:= aux;
end; 

procedure cargardatos (L:lista);
var 
    r:ventas;
begin 
    leer(r);
    repeat 
        leer(r);
        armarlista(L,r);
    until (r.codigo = -1);
end; 


procedure inivector (var v:vector);
var 
    i:rango_evento;
begin 
    for i:=1 to evento do begin 
        v[i]:= 0;
    end;
end;



procedure puntoA(ve:evento; var min,p1,p2:integer; recaudacion:real);
begin 
    for i:=1 to evento do begin 
        if (v[i].costo < min) then begin 
            min2:= min1;
            p2:= p1;
            min1:= v[i];
            p1:= i;
        end
        else 
            if (min2 < min1) then begin 
                min2:= v[i];
                p2:= i; 
            end;
        end;
    end;
end;


function pares (num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;

    while (digito > 0) do begin 
        digito:= num mod 10;
        if (digito mod 2 = 0) then begin  
            par := par +1;
        
        else 
            impar:= impar +1;
        end 
        num:= digito div 10;
    end;
    pares:= (par > impar);
end;

function puntoB (r:ventas; ve:evento):boolean;
begin 
    puntoB:= (pares(L^.data.DNI)) and (v[L^.data.numero].tipo = 3);
end;

function puntoC (r:ventas; v:vevento):boolean;
begin 
    puntoC := (v[i].cantpersonas = r.cantentradas)
end;

procedure procesarDatos(L:lista);
var 
    r:ventas;
    e:evento;
    v:vector;
    ve:vevento;
    entradas2b,p1,p2:integer;
begin 
    p1:= 0;
    p2:= 0;
    entradas2b:= 0;
    inivector(v);
    while (L <> nil) do begin
        recaudacion:= r.cantentradas + costo 
        puntoA(ve,min,p1,p2,recaudacion);
        if puntoB(e,r);
        entradas2b:= entradas2b + L^.data.cantentradas;

        if (L^.data.numero = 50) and (puntoC(L^.data,ve)) then 
            evento50:= evento50 + L^.data.cantentradas;
    end;
    writeln('punto A los eventos con menos recaudacion: ', p1,p2);
    writeln('punto B', entradas2b);
    if (v[50].capacidad < evento50) then 
        writeln('punto C no supero');
    else 
        writeln('punto C, supero');
end;

var 
    L:lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end. 



============================================



program EJ11P7;
type 
	eventos = 1..100;
	tipos = 1..5;
	
	evento = record 
		nombre:string;
		tipo:tipos;
		lugar:string;
		cant_personas:integer;
		costo:real;
	end;

	ventas = record 
		codigo:integer;
		numero:integer;
		DNI:integer;
		cant_entradas:integer;
	end;
	vector = array [eventos] of integer;
	vector2 = array [eventos] of evento;

	lista = ^nodo;
	nodo = record 
		data:ventas;
		sig:lista;
	end;
	
	
procedure inivector (var v:vector; var v2:vector2);
begin 

end;

procedure puntoA (v2:vector2; min1,min2:real; a1,a2,e1,e2:string);
var 
	i:integer;
begin 
	for i:=1 to 100 do begin 
		if (v2[i].costo < min1) then begin 
			min2:= min1;
			a2:= a1;
			e2:= e1;
			min1:= v2[i].costo;
			a1:= v2[i].nombre;
			e2:= v2[i].lugar;
		end
		else if (min1 < min2) then begin 
			min2:= v2[i].costo;
			a2:= v2[i].nombre;
			e2:= v2[i].lugar;
		end;
	end;
end;

function cumplePar(dni:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0;
	impar:= 0;
	while (dni > 0) do begin 
		dni:= dni mod 10;
		if (dni mod 2 = 0) then begin 
			par := par +1;
		end
		else 
			impar:= impar +1;
	end;	
	
	cumplePar:= (par > impar);
end;
	

procedure procesardatos(L:lista);
var 
	min1,min2:real; a1,a2,e1,e2:string; cantB:integer; maximoC:boolean;
	v:vector; v2:vector2;
	i:integer;
begin 
	cantB:= 0;
	a1:= ''; a2:= ''; e1:= ''; e2:= ''; min1:= 999; min2:= 999; maximoC:= false; 
	inivector(v,v2);
	while (L <> nil) do begin 
		
		puntoA(v2, min1,min2,a1,a2,e1,e2);
		//punto B
		if (v2[L^.data.numero].tipo = 3) and (cumplePar(L^.data.DNI)) then 
			cantB:= cantB + L^.data.cant_entradas;
			
		if (L^.data.numero = 50) and (v2[50].cant_personas < L^.data.numero) then 
			maximoC:= true;
	end;
		for i:=1 to 100 do 
			writeln('punto A', a1,a2,e1,e2);
			
		writeln('punto B', cantB);
		
		if (maximoC) then
			writeln('puntoC cumple ');
end;

var 
	L:lista;
begin 
	L:= nil;
	cargareventos(L); 
	cargarventas(L);
	procesardatos(L);
end.

