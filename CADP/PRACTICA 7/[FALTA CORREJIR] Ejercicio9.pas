{Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5:
comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura
no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe
leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee
el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que
impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
parámetro (el mismo puede no existir)}




program EJ9P7;
const 
	generos = 8;
type 
	rango_generos = 1..8;
	
	pelicula = record 
		codigo:integer;
		titulo:string;
		genero:rango_generos;
		puntaje:real;
	end;
	
	critico = record 
		dni:integer;
		apeynom:string;
		codigo_pelicula:integer;
		puntaje_otorgado:real;
	end;
	
	
	lista = ^nodo;
	nodo = record 
		data:pelicula;
		sig:lista;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record;
		data:critico;
		sig:lista2;
	end;
	
	vector = array [rango_genero] of integer;


procedure inivector(var v:vector); 
var 
	i:integer;
begin 
	for i:=1 to generos do v[i]:= 0;
end;

procedure leer(var r:pelicula);
begin 
	readln(codigo);
	readln(titulo);
	readln(genero);
	readln(puntaje);
end;

Procedure armarlista (var L:lista; r:pelicula);
Var 
    nue:Lista;
Begin  
    New(nue);  
    nue^.datos:=r;  
    nue^.sig:=L;  
    L:=nue;
End;

procedure leer_critico(var c:critico);
begin 
	readln(dni);
	readln(apeynom);
	readln(codigo_pelicula);
	readln(puntaje);
end;


Procedure armarlista2 ( var pri: lista; c:critico);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := c;
    act := pri;
    ant := pri;
    while (act<>NIL) and (act^.data.codigo_pelicula < c.codigo_pelicula) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue  
    else  
        ant^.sig  := nue;
    nue^.sig := act ;
end;



procedure cargarPelicula(L:lista);
var 
	r:pelicula; c:critico;
begin 
	leer(r);
	while (r.codigo <> -1) do begin //no aclara asi que me invento la condicion
			armarlista(L,r);
			leer(r);
	end;
end;

procedure cargarCritico (L2:lista);
var 
	c:critico;
begin 
	leer_critico(c);
	while (c.codigo_pelicula <> -1) do begin 
		armarlista2(L2,c);
		leer_critico(c);
	end;
end;

procedure puntoB(promedio:real; var max:integer; var p1:integer);
begin 
	if (promedio > max) then begin 
		max:= promedio;
		p1:= r.genero;
	end;
end;

Procedure eliminar (var pri:lista; r:pelicula; var exito: boolean);
var ant, act: lista;
begin 
	readln(r.codigo);
    exito := false;
    act := pri;
    while  (act <> NIL)  and (act^.data.cod <> cod) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig;
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesardatos(L:lista; L2:lista2);
var 
	v:vector;
	r:pelicula;
	cantpelis:integer; codigoACT:integer; promedio:real; max,p1:integer; 
	exito:boolean;
begin 
	promedio:= 0; max:= -1; p1:= 0;
	
	while (L <> nil) do begin 
		codigoACT:= L^.data.codigo;
		cantpelis:= 0;
	
		while (L <> nil) and (L^.data.codigo = codigoACT) do begin 
			promedio:= L^.data.puntaje + prom;
			cantpelis:= cantpelis +1;
			
			if (cumplepares(L2^.data.dni)) then 
				writeln('el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que impares en su DNI', L2^.data.apeynom);
		
			L:=L^.sig;
		end;
	
	end;
	puntoB(promedio,max,p1);
	promedio:= prom/cantpelis;
	
	auxL:= L;
    while (auxL <> nil) and (auxL^.dato.codPeli <> codigoACT) do
          auxL:= auxL^.sig;
        auxL^.dato.puntaje:= promedio;
        
    writeln(' el código de género que más puntaje obtuvo entre todas las críticas. ', p1);
    
    eliminar(L,r,exito);
end;

var 
	L:lista;
	L2:lista2;
begin 
	L:= nil;
	L2:= nil;
	cargardatos(L);
	cargarPelicula(L);
	cargarCritico(L,L2);
end.
