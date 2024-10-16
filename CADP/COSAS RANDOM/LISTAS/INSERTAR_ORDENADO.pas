procedure insertar (var pri:lista; r:registro);
var 
	ant,nue,act:lista; 
	{nue: MI CAJA DONDE GUARDO LO QUE HAY QUE INSERTAR.
	 act: MI BUSCADOR PARA VER DONDE DEBE IR CADA COSA
	 ant: MI ORDENADOR, ME MANTIENE ORDENADITO LO QUE QUIERA GUARDAR
	}
begin 
	new(nue);  // RESERVO ESPACIO PARA EL DATO NUEVO
	nue^.data:= r; // ASIGO EL DATO A ESE ESPACIO
	act:= pri; // ACTUAL EN PRIMERO PARA COMENZAR RECORRIDO
	ant:= pri; // ANTERIOREN PRIMERO PORQUE NO NECESITO NADA TODAVIA

	//mientras la columna de cajas no halla tocado el techo y la caja que revise sea mas liviana que la que tengo en las manos..
	while (act <> nil) and (act^.data.dni < r.dni) do begin 
		ant:= act; //La última caja que conté es la que voy a tener en cuenta por si tengo que insertar la nueva caja entre esta y la siguiente
		act:=act^.sig; //ok, esta caja ya la revise, miro la siguiente.
	end;

	if (ant = act) then //si la caja que tengo en las manos es mas liviana que TODAS las de la columna
		pri:= nue; //la pongo encima de todo

	else //sino, tengo que ponerla entre otras o al final 
		ant^.sig:= nue; //la siguiente caja despues de ant sera la nueva caja nue
	nue^.sig:= act; //Voy a colocar la nueva caja entre la caja que acababa de revisar (ant) y la caja que venía después


end;
