//almacena en una estructura nueva el año leido
procedure buscar(L:lista; año:integer):boolean;
begin 
	while (L <> nil) do begin 
		if (L^.data.año = año) then 
			armarlista(L2,r);
		L:= L^.sig;
	end;
end.
