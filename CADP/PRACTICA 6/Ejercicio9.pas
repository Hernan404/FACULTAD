

function buscar (l:lista; x:integer):boolean;
var 
	cumple:true;
begin 
	cumple:= false;
	while (L <> nil) and (not cumple) and (x > L^.dato) do begin 
		if (x = L^.dato) then 
			cumple:= true;
		else
			cumple:= false;
	end;
	buscar:= encontre;
end;	

procedure borrarElemento (var pri:lista; nom:string; var exito: boolean);
var 
	ant,act:lista;
begin
	exito := false;
	act := pri;
	
	while (act <> nil) and (act^.datos.nom <> nom) do begin 
		ant:= act;
		act:= act^.sig
	end;
	
	if (act <> nil) then begin 
		exito:= true;
		if (act = pri) then 
			pri := act^.sig;
		else
			ant^.sig:= act^.sig;
		dispose (act);
end;



procedure sublista(var L: lista; A, B: integer; var resultado: lista);
var
  nodo: lista;
begin
  nodo := L; // Creamos un nodo auxiliar para recorrer la lista

  while (nodo <> nil) do
  begin
    if (nodo^.datos > A) and (nodo^.datos < B) then
      agregarfinal(resultado, nodo^.datos); // Llamamos al módulo agregarfinal para agregar el elemento a la lista resultado

    nodo := nodo^.sig; // Avanzamos al siguiente nodo de la lista
  end;
end;

procedure agregarfinal(var L: lista; num: integer);
var
  nue: lista;
  nodo: lista;
begin
  new(nue);
  nue^.datos := num;
  nue^.sig := nil;

  if L = nil then
  begin
    L := nue;
  end
  else
  begin
    nodo := L;

    while (nodo^.sig <> nil) do
      nodo := nodo^.sig;

    nodo^.sig := nue;
  end;
end;

	
procedure Sublista(L: lista; A, B: integer; var nuevalista: lista);
begin
  while (L <> nil) and (L^.num <= B) do
  begin
    if (L^.num > A) then
    begin
      armarNodo(nuevalista, L^.num);
      Writeln('Cumple ', L^.num);
    end;
    L := L^.sig;
  end;
  Writeln('Cosa');
  imprimirNodo(nuevalista);
end;

var
	A,B:integer;
	pri : lista;
	valor : integer;
begin
	A:23;
	B:50;
	pri := nil;
	writeln(‘Ingrese un numero’);
	read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’);
		read(valor);
	end;
. . . { imprimir lista }
end.
