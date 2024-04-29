La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el
programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el
docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el
nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La
información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar
un programa que lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no
debe procesarse), e informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada
localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e
impares.


program EJ9P3;
type
	data_doc = record 
	 dni:integer;
	 nombre:string;
	 apellido:string;
	end;

	data = record 
	 codigo:integer;
	 titulo:string;
	 docente: data_doc;
	 cantalu:integer;
	 nom_esc:string;
	 localidad:string;	
	 anio:integer;
	end;
	


procedure leer(var r:data; var ra:data_doc);
begin 
	with r do begin 
		writeln('TITULO');
		readln(titulo);
		writeln('DATOS DEL DOCENTE');
		with ra do begin 
			writeln('DNI');
			readln(dni);
			writeln('NOMBRE');
			readln(nombre);
			writeln('APELLIDO');
			readln(apellido);
		end;
		writeln('CANTIDAD DE ALUMNOS');
		readln(cantalu);
		writeln('NOMBRE DE ESCUELA');
		readln(nom_esc);
		writeln('LOCALIDAD');
		readln(localidad);
		writeln('ANIO');
		readln(anio);
	end;
end;

function cumplepar (num:integer):boolean;
var 
	par,impar:integer;
begin 
	impar:= 0;
	par:= 0;
	while (num > 0) do begin
		num:= num mod 10; 
		if ((num mod 2) = 0) then begin 
			par:= par +1;
		end
		else begin 
			impar:= impar +1;
		end;
			num:= num div 10;
	end;
	cumplepar:= (par = impar)
end;

procedure mayores (r:data; var max1,max2:integer; var n1,n2:string);
begin 
	if (r.cantalu > max1) then begin 
		max2:= max1;
		n2:= n1;
		max1:= r.cantalu;
		n1:= r.nom_esc;
	end
	else if (max1 > max2) then begin
		max2:= r.cantalu;
		n2:= r.nom_esc;
	end;  
end;

procedure procesardatos(var r:data; var ra:data_doc);
var 
	canttotal,cantlocal,max1,max2:integer;
	n1,n2,localACT:string;
	tituloC:string;
begin 
	cantlocal:= 0; max1:= -1; max2:= -1; n1:= ''; n2:= '';
	tituloC:= ''; canttotal:= 0;
	while (r.codigo <> -1) do begin 
		localACT:= r.localidad;
		cantlocal:= 0;
		while (localACT = r.localidad) do begin 
			mayores(r,max1,max2,n1,n2);
			if (r.localidad = 'daireaux') and (cumplepar(r.codigo)) then 
				tituloC:= r.titulo;
			cantlocal:= cantlocal +1;
			if (r.anio = 2018) then 
				canttotal:= canttotal +1;

		    leer(r,ra);
		end;
	writeln('cantidad de escuelas por cada localidad: ', cantlocal);
	end;
	writeln('Nombres de las dos escuelas con mayor cantidad de alumnos participantes: ', n1,' y ',n2);
	writeln('Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares: ', tituloC);
	writeln('Cantidad total de escuelas que participan en la convocatoria 2018: ', canttotal);
end;

var 
	r:data; ra:data_doc; 
begin 
	leer(r,ra);
	procesardatos(r,ra);
end.
