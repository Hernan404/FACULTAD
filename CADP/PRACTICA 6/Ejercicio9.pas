{realize un modulo EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario}

program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
	num : integer;
	sig : lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

procedure puntoD(L:lista; numD:integer);
begin 
	readln(numD);
	while (L <> nil) do begin 
		L^.num:= L^.num + numD; 
		L:= L^.sig;
	end;
end;

procedure imprimir (L:lista; num:integer);
begin 
	while (L <> nil) then  
		writeln(L^.num);
		L:= L^.sig;
end; 

function estaOrdenada(L:lista):boolean;
var 
	x:integer;
	aux:lista;
begin 
	aux:= L^.sig;
	if (aux <> nil) then begin 
		if(aux^.num > L^.num) then begin 
			x:= 0;
			while (L <> nil) and (L^.num > x) do begin 
				x:= L^.num;
				L:= L^.sig;
			end;
		end
	else begin 
		x:= 32767;
		while (L <> nil) and (L^.num < x) do begin 
			x:= L^.num;
			L:= L^.sig;
		end;
	end;
	estaOrdenada:= (L = nil);
end;

procedure crearSublista (var L: lista; n: integer);
  var
    nue: lista;
  begin
    New(nue);
    nue^.num:= n;
    nue^.sig:= L;
    L:= nue;
  end;

// ================ INCISO C,D y E
procedure sublista (L: lista; var listaSub: lista);
  var
    a,b: integer;
  begin
    write ('Numero A: '); 
	readln(a);
    write ('Numero B: '); 
	readln(b);
    while (L <> nil) do
      begin
        if (L^.num > a) and (L^.num < b) then
          crearSublista(listaSub,L^.num);
        L:= L^.sig;
      end;
  end;

var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	puntoD(pri,valor);
	
	imprimir(pri,valor);
	
end.
