Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,

Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
(que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz 

program EJ6P3;
type 
	data = record 
		marca:string;
		linea:string;
		cant_nucleos:integer;
		reloj:real;
		size_nm:integer;
		size_trans:integer;
end;

procedure leer(var r:data);
begin 
	with r do begin 
		writeln('MARCA');
		readln(marca);
		writeln('LINEA');
		readln(linea);
		writeln('CANTIDAD DE NUCLEOS');
		readln(cant_nucleos);
		writeln('RELOJ');
		readln(reloj);
		writeln('TAMAÑO DE NANOMETROS');
		readln(size_nm);
		writeln('TAMAÑO DE TRANSISTORES');
		readln(size_trans);
	end;
end;

procedure proceso (r:data; var multi:integer; var marcaA,lineaA:string);
begin 
	if (r.cant_nucleos >  1) and ((r.marca = 'intel') or (r.marca = 'AMD')) and (r.reloj >= 2) then begin 
		multi:= multi +1;
	end;
	
	if (r.cant_nucleos > 2) and (r.size_nm <= 22) then begin 
		marcaA:= r.marca;
		lineaA:= r.linea;
	end;
end;

procedure mayor (var r:data; var cant:integer; var max1,max2:integer; var m1,m2:string);
begin 
	if (cant > max1) then begin 
		max2:= max1;
		m2:= m1;
		max1:= cant;
		m1:= r.marca;
	end
	else if (max1 > max2) then begin 
			max2:= cant;
			m2:= r.marca;
	end;
end;

var 
	r:data;
	max1,max2:integer;
	marcaA,lineaA:string;
	m1,m2:string;
	multi:integer;
	marcaACT:string;
	cant:integer;
begin 
	max1:=-1; max2:= -1; m1:= ''; m2:= ''; multi:= 0;
	leer(r);
	while (r.cant_nucleos <> 0) do begin 
		marcaA:= ''; lineaA:= ''; cant:= 0;
		marcaACT:= r.marca;
		while (marcaACT = r.marca) do begin 
			proceso(r,multi,marcaA,lineaA);
			cant:= cant +1;
			mayor(r,cant,max1,max2,m1,m2);
			leer(r);
		end;
		writeln('Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm: ', 'MARCA: ', marcaA , 'LINEA: ', lineaA);
	end;
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: ', m1 , m2);
	
	writeln('Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz: ', multi);
end.
