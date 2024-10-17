program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
end;
//________________________________________________________________________________________________________
procedure insertarOrdenado (var L: lista; d:datos);
var
    aux : lista;
	ant,nue,act:lista;
begin
    new(aux);
    aux^.num := v;
	act := L;
	ant := L;
	
	while (act <> nil) and (act^.datos.nombre < d.nombre) do begin 
		ant:= act;
		act:= act^.sig;
	end;

	if (ant = act) then 
		pri := nue
	else 
		ant^.sig:= nue;
	nue^.sig := act;
end;
