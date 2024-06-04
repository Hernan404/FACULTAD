 procedure leer(var r:alumno);
 var 
	i,x:integer; diml:integer; notas:real;
 begin 
	for i:= 1 to materias do 
		notas[i]:= 0;  //donde guardo las notas ordenadas

	with r do begin 
		readln(numero);
		readln(apellido);
		readln(nombre);
		readln(mail);
		readln(ingreso);
		readln(egreso);
		for i:=1 to materias do begin
			readln(nota)
			diml:= 1;
			while (notas[diml] > nota) do  //Se busca la posición adecuada para la nueva nota en el arreglo notas. Esto se hace comparando la nueva nota con las notas existentes en el arreglo notas, avanzando diml hasta encontrar la posición correcta (donde notas[diml] sea menor o igual que la nueva nota
					diml:= diml +1;
			
			for x:= materias downto diml do 
				notas[x]:= nota[x - 1]; // // Una vez encontrada la posición correcta, se realiza un desplazamiento hacia la derecha de las notas existentes en el arreglo notas para hacer espacio para la nueva nota. Este desplazamiento se realiza desde el final del arreglo hasta la posición diml.
			notas[diml]:= nota;    //Finalmente, se inserta la nueva nota en la posición diml del arreglo notas.

		end;
	end;
end;
