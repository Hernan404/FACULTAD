
 {Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De cada
 evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3: obra de
 teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas para el evento
 y costo de la entrada. Se pide:
 1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se debe
 guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de entradas
 adquiridas. La lectura de las ventas finaliza con código de venta-1.
 2. Unavezleída y almacenada la información de las ventas, calcular e informar:
 a. Elnombreylugar de los dos eventos que han tenido menos recaudación.
 b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares
 y que sean para el evento de tipo “obra de teatro”.
 c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
 personas permitidas}
 
program EJ11P7;
const 
	eventos = 100;
type 
	rango_eventos = 1..100;
	rango_tipos = 1..5;
	
	
	
	evento = record 
		nombre:string;
		tipo:rango_tipos;
		lugar:string;
		cant_personas:integer;
		costo:real;
		capacidad:integer;
	end;

	ventas = record 
		codigo:integer;
		numero:integer;
		DNI:integer;
		cant_entradas:integer;
	end;
	
	vector = array [rango_eventos] of evento;
	vpuntoA = array [rango_eventos] of real;

	lista = ^nodo;
	nodo = record 
		data:ventas;
		sig:lista;
	end;
	
	
procedure cargar_evento (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to eventos do begin 
		readln(v[i].nombre);
		readln(v[i].tipo);
		readln(v[i].lugar);
		readln(v[i].cant_personas);
		readln(v[i].costo);
	end;
end;



procedure leer_ventas (var r:ventas);
begin 
	with r do begin 
		readln(codigo);
		readln(DNI);
		readln(numero);
		readln(cant_entradas);
	end;
end;


procedure armarlista (var L: Lista; r:ventas);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.data:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure cargardatos(var L:lista);
var 
	 r:ventas;
begin 
	leer_ventas(r);
	while (r.codigo <> -1) do begin 
		armarlista(L,r);
		leer_ventas(r);
	end;
end;

procedure puntoA (v:vector; var min1,min2:real; var a1,a2,e1,e2:string);
var 
	i:integer;
begin 
	for i:=1 to 100 do begin 
		if (v[i].costo < min1) then begin 
			min2:= min1;
			a2:= a1;
			e2:= e1;
			min1:= v[i].costo;
			a1:= v[i].nombre;
			e2:= v[i].lugar;
		end
		else if (min1 < min2) then begin 
			min2:= v[i].costo;
			a2:= v[i].nombre;
			e2:= v[i].lugar;
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
		if (dni mod 2 = 0) then  
			par := par +1
		else 
			impar:= impar +1;
		dni:= dni div 10;
	end;	
	
	cumplePar:= (par > impar);
end;
	

procedure procesardatos(L:lista; var v:vector);
var 
	min1,min2:real; a1,a2,e1,e2:string; cantB:integer; 
	vp2:vpuntoA; 
	i:integer;
	cantC:integer;
	costo:real;
begin 
	cantB:= 0; costo:= 0;
	cantC:= 0;
	
	for i:=1 to eventos do 
		vp2[i]:= 0; 
		
	a1:= ''; a2:= ''; e1:= ''; e2:= ''; min1:= 999; min2:= 999;  
	while (L <> nil) do begin 
	
		//punto A
		costo:= v[L^.data.numero].costo * L^.data.cant_entradas;
		vp2[L^.data.numero]:= vp2[L^.data.numero] + costo; 
		
		//punto B
		if (v[L^.data.numero].tipo = 3) and (cumplePar(L^.data.DNI)) then 
			cantB:= cantB + L^.data.cant_entradas;
		
		//punto C
		if (L^.data.numero = 50) then  
			cantC:= cantC +1;
		
		L:= L^.sig;
	end;
		puntoA(v, min1,min2,a1,a2,e1,e2);
		writeln('Punto A:');
        writeln('Evento con menor recaudacion: ', a1, ' en ', e1);
        writeln('Segundo evento con menor recaudacion: ', a2, ' en ', e2);       

		
        writeln('Punto B: Cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo "obra de teatro": ', cantB);

		
		if (v[50].capacidad < cantC) then 
			writeln('Punto C: La cantidad de entradas vendidas para el evento número 50 supero o alcanzo la cantidad máxima de personas permitidas')

		else 
			writeln('Punto C: La cantidad de entradas vendidas para el evento número 50 no alcanzo la cantidad máxima de personas permitidas');

end;

var 
	L:lista; v:vector;
begin 
	L:= nil;
	cargar_evento(v);
	cargardatos(L);
	procesardatos(L,v);
end.
