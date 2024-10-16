
Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
var
  ant, act: lista;
  //ant: un papel en el que voy anotando lo que revise 
  //act: la caja que estoy revisando actualmente
begin 
    exito := false;
    act := pri; //arranco el recorrido desde el primero

	//miro la fila de cajas hasta encontrar el numero de caja que quiero sacar
    while  (act <> NIL)  and (act^.datos.nom <> nom) do 
    begin
        ant := act; //me anoto la caja que revise
        act := act^.sig //revise esta caja pero no es la que estoy buscando, siguiente..
    end; 

	// si encontre la caja que buscaba entonces
    if (act <> NIL) then begin

        exito := true; //aviso que encontre la caja
		
		//si la caja que voy a quitar es la primera de la fila
        if (act = pri) then  
            pri := act^.sig; 
			{aviso que voy a sacar la primera
			y que la columna pasa a comenzar con la caja siguiente a esta}
        else  
            ant^.sig:= act^.sig; // si no es la primera, las voy a conectar despues de quitar
        
		dispose (act); //quito la caja
    end;
end;
