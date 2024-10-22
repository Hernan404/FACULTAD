{La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de
préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información de los préstamos
realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el
libro, día del préstamo (1..31). La información de los préstamos se lee de manera ordenada por ISBN y finaliza
cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par.}


program EJ14P7;
const 
	dias = 31;
type 
	rango_dias = 1..31;
	
	prestamo = record 
		numero:integer;
		ISBN:integer;
		numero_socio:integer;
		dia:rango_dias;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:prestamo;
		sig:lista;
	end;
	
	vector = array [rango_dias] of integer;
	
procedure leer(var r:prestamo);
begin 
	with r do begin 
		readln(numero);
		readln(ISBN);
		readln(numero_socio);
		readln(dia);
	end;
end;

Procedure armarlista ( var pri: lista; r:prestamo);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := r;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.ISBN < r.ISBN) do //De menor a mayor
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


procedure cargardatos (var L:lista);
var 
	r:prestamo;
begin 
	leer(r);
	while (r.ISBN <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

procedure inivector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to dias do v[i]:= 0;
end;

procedure puntoB(v:vector; var min,p1:integer);
var 
	i:rango_dias;
begin 
	for i:=1 to dias do begin 
		if (v[i] < min) then begin 
			min:= v[i];
			p1:= i;
		end;
	end;
end;

function cumpleC(num,num_socio:integer):boolean;
begin 
	cumpleC:= ((num mod 2) = 1) and ((num_socio mod 2) = 0);
end;



procedure procesardatos(L:lista);
var 
	porcentaje:real; min,p1:integer; ISBNACT:integer; cant_prestado:integer;
	v:vector; cantC:real; total:integer;
begin 
	porcentaje:= 0; min:= 999; p1:= 0;  cantC:= 0; total:= 0;
	inivector(v);
	while (L <> nil) do begin 
		ISBNACT:= L^.data.ISBN;
		cant_prestado:= 0;
		//PUNTO A
		while (L <> nil) and (L^.data.ISBN = ISBNACT) do begin 
			cant_prestado:= cant_prestado +1;
			total:= total +1;
			//PUNTO C B
			v[L^.data.dia]:= v[L^.data.dia] +1;
			
			//PUNTO C
			if (cumpleC(L^.data.numero, L^.data.numero_socio)) then 
				cantC:= cantC +1;
		L:= L^.sig;
		end;
		writeln('ISB', ISBNACT, 'fue prestado', cant_prestado,'veces');
	end;
		//PUNTO C
		porcentaje:= (cantC/total)*100;
		puntoB(v,min,p1);
		
		writeln('el día del mes en que se realizaron menos préstamos. ', p1);
		writeln(' el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par ', porcentaje);

end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
