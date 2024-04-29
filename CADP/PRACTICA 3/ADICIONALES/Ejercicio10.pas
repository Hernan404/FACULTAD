Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con
las que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo
de planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical,
desértico, etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada
por tipo de planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'.
Al finalizar la lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países

program EJ10P3;
type 
	data = record 
		nombre:string;
		tiempo:integer;
		tipo:string;
		clima:string;
		pais:string;
	end;

procedure leer(var r:data);
begin 
	with r do begin 
		writeln('NOMBRE');
		readln(nombre);
		writeln('TIEMPO');
		readln(tiempo);
		writeln('CLIMA');
		readln(clima);
		writeln('PAIS');
		readln(pais);
	end;
end;


procedure menor(r:data; cantplantas:integer; var min:integer; var t1:string);
begin 
	if (cantplantas < min) then begin  
		min:= cantplantas;
		t1:= r.tipo;
	end;
end;

procedure mayor (r:data; var max1,max2:integer; var n1,n2:string);
begin 
	if (r.tiempo > max1) then begin  
		max2:= max1;
		n2:= n1;
		max1:= r.tiempo;
		n1:= r.nombre;
	end
	else if (max1 > max2) then begin 
		max2:= r.tiempo;
		n2:= r.nombre;
	end;
end;

procedure maspais(r:data; var max:integer; var cantpais:integer;  var  n3:string);
begin 
	if (cantpais > max) then begin  
		max:= cantpais;
		n3:= r.pais;
	end;
end;

procedure procesardatos(var r:data);
var 
	min:integer; t1:string; prome:real;max, max1,max2:integer; n1,n2,n3:string; 
	paisB:string; tipoACT:string; cantpais:integer; cumple:boolean; cantplantas:integer;
begin 
	cumple:= false;
	min:= 9999; t1:= ''; cantpais:= 0; max1:= -1; max2:= -1; n1:= ''; n2:= '';
	max:= -1;
	n3:= '';
	cantplantas:= 0;
	paisB:= '';
	while (r.pais <> 'zzz') do begin 
		tipoACT:= r.tipo;
		prome:= 0;
		
		while (tipoACT = r.tipo) do begin 
			cantplantas:= cantplantas +1;
			menor(r,cantplantas,min,t1);
			mayor(r,max1,max2,n1,n2);
			
			if (r.pais = 'argentina') and (r.clima = 'subtropical') then
				cumple:= true;
			leer(r);
		end;
			if (paisB <> r.pais) then begin 
				cantpais:= cantpais +1;
				paisB:= r.pais;
				maspais(r,max,cantpais,n3);
			end;
			if (cumple) then 
		writeln('Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical: ', r.nombre);

		prome:= r.tiempo/12;
	writeln('El tiempo promedio de vida de las plantas de cada tipo: ', prome);
	end;
	writeln('El tipo de planta con menor cantidad de plantas: ', t1);
	writeln('El nombre científico de las dos plantas más longevas: ', n1,' y ', n2);
	writeln('El nombre de la planta que se encuentra en más países: ', n3);
end;

var 
	r:data;
begin 
	leer(r);
	procesardatos(r);
end.
