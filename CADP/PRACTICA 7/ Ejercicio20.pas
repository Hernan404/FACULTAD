program EJ20P7;
const 
	temas = 10;
	libros = 1500;
type 	
	rango_temas = 1..10;
	rango_libros = 1..1500;


//------DISPONGO-----------
	libro = record 
		titulo: string;
		autor: string;
		edicion: string;
		año: integer;
		tema: rango_temas;
	end;
//-------------------------

	infoPrestamo = record 
		codigo: rango_libros;
		fecha: integer;
	end;

	socio = record 
		numero: integer;
		mail: string;
		prestamo: infoPrestamo;
	end;

	socio2 = record
		numero: integer;
		cantPrestamo: integer;
	end;

	lista = ^nodo;
	nodo = record 
		data: socio;
		sig: lista;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record 
		data: socio2;
		sig: lista2;
	end;
		

	vector = array [rango_temas] of integer;
	vLibro = array [rango_libros] of libro;

procedure leer(var r: socio; var r2: socio2);
begin 
	readln(r.numero);
	if (r.numero <> -1) then begin 
		readln(r.mail);
		r2.cantPrestamo := 0;
		readln(r.prestamo.codigo); 
		while (r.prestamo.codigo <> -1) do begin 
			r2.cantPrestamo := r2.cantPrestamo + 1;
			r.prestamo.codigo := codigo;
			readln(r.prestamo.fecha);
			readln(r.prestamo.codigo); 
		end;
	end;
end;

procedure armarlista(var L: lista; r: socio);
var 
	aux: lista;
begin 
	new(aux);
	aux^.data := r;
	aux^.sig := L;
	L := aux;
end;

procedure cargardatos(var L: lista; var r2: socio2);
var 
	r: socio; 
begin 
	leer(r, r2);
	while (r.numero <> -1) do begin 
		armarlista(L, r);
		leer(r, r2);
	end;
end;

procedure armarlista2(var L2: lista2; r2: socio2; numero: integer);
var 
	aux: lista2;
begin 
	new(aux);
	aux^.data.numero := numero;
	aux^.data.cantPrestamo := r2.cantPrestamo;
	aux^.sig := L2;
	L2 := aux;
end;

procedure puntoB(vc: vector; var max, p1: integer);
var 
	i: integer;
begin 
	for i := 1 to temas do begin 
		if (vc[i] > max) then begin
			max := vc[i];
			p1 := i;
		end;
	end;
	writeln('Número de tema con mayor cantidad de préstamos: ', p1);
end;

procedure puntoC(L2: lista2; valor: integer);
var 
	impar, par, digito: integer;
	paresImpares: boolean;
	numero: integer;
begin 
	while (L2 <> nil) do begin 
		numero := L2^.data.numero;
		impar := 0; 
		par := 0;
		paresImpares := false;

		while (numero > 0) do begin 
			digito := numero mod 10;
			if (digito mod 2 = 0) then 
				par := par + 1
			else 
				impar := impar + 1;
			numero := numero div 10;
		end;

		paresImpares := (par = impar);

		if (paresImpares) and (L2^.data.cantPrestamo = valor) then 
			writeln(L2^.data.numero);

		L2 := L2^.sig;
	end;
end;

procedure procesardatos(var L: lista; var r2: socio2);
var 
	vc: vector; 
	i: integer;
	L2: lista2; 
	totalPrestamo: integer;
	max: integer;
	valor: integer;
	p1: integer;
begin 
	totalPrestamo := 0;
	max := -1;
	L2 := nil; 
	valor := 0;
	p1 := 0;

	for i := 1 to temas do 
		vc[i] := 0;

	while (L <> nil) do begin
		// i
		if (r2.cantPrestamo > 20) then 
			armarlista2(L2, r2, L^.data.numero);

		// ii
		vc[L^.data.prestamo.codigo] := vc[L^.data.prestamo.codigo] + r2.cantPrestamo;

		// iii
		totalPrestamo := totalPrestamo + r2.cantPrestamo;
		L := L^.sig;
	end;

	puntoB(vc, max, p1);

	readln(valor);
	puntoC(L2, valor);
end;

var 
	r2: socio2;
	L: lista; 
	vL: vLibro; 
	p: libro;
begin 
	L := nil;
	// cargarlibros(vL, p); // se dispone (comentado ya que no se define)
	cargardatos(L, r2);
	procesardatos(L, r2);
end.

