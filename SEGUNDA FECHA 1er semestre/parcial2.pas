	
{PARCIAL SEGUNDA FECHA 2DO SEMESTRE
el productor musical bizarrap organiza sesiones musicales con diferentes artistas. se dispone
de una estructura de datos con la informacin de las seciones de bizarrap. de cada sesion se conoce:
titulo, nombre del artista, genero musical (1: trap latino, 2: reggaeton, 3:urban, 4:electronica,
5: pop rap), año de estreno y cantidad de reproducciones en spotify. la informacion no posee un orden especifico

A. informar los dos codigos de genero musical con menor cantidad de reproducciones en spotify
B. generar una lista ordenada por año que contenga las sesiones del genero "trap latino" y "urban" cuya suma de los 
digitos de la cantidad de reproducciones sea multiplo de 5.
C. realizar un modulo que reciba la lista generada en el punto anterior e informe para cada año la cantidad de sesiones realizadas
junto al total de reproducciones de spotify de esas sesiones}

program parcialSegundafecha1er
type 
	genero = 1..5;
	sesion = record 
		titulo:string;
		nombre:string;
		genero:generos;
		anio:integer;
		cant_views:integer;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:sesion;
		sig:lista;
	end;

	vector = array [generos] of integer

procedure leer(var r:sesion); // se dispone

procedure cargardatos(var L:lista); // se dispone

procedure inivector(var v:vector); 
var 
  i:integer;
begin 
    for i:=1 to 5 do begin 
      v[i]:= 0;
    end;
end;

procedure armarlista(var L:lista; r:sesion); // se dispone

procedure procesardatos(L:lista);
var 
	v:vector; min1,min2,c1,c2:integer;
begin 
	min1:= 999; min2:= 999; c1:= 0; c2:= 0;
	
	inivector(v);
	while (L <> nil) do begin 
		v[L^.data.genero]:= L^.data.cant_views + v[L^.data.genero]
		
		if (puntoB(L^.data)) then begin 
			armarlista(L2,r);
			puntoA(v,min1,min2,c1,c2);
		end;
	end;
	writeln(c1,c2);

end;

procedure procesardatosB(L2:lista);
var 
	anioACT:integer; totalC:integer; cantsesiones:integer;
begin 
	while (L2 <> nil) do begin 
		anioACT:= L2^.data.anio;
		totalC:= 0; cantsesiones:= 0;
		while (L2 <> nil) and (L2^.data.anio = anioACT) do begin 
			totalC:= totalC + L^.data.cantviews;
			cantsesiones:= cantsesiones +1;
			L2:= L2^.sig;
		end;
		writeln(cantsesiones, anioACT, totalC);
	end;
end;


var 
	L,L2:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
	procesardatosB(L2);
end;
