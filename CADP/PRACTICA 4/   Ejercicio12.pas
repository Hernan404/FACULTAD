{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. 

Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program EJ12P4;
const 
	dimf = 53;
type 
	galaxia = record 
		nombre: string;
		tipo: 1..4;
		masa: real;
		distancia: integer;
	end;

	vector = array [1..dimf] of galaxia;
	vcant = array [1..4] of integer;

procedure leer(var v: vector);
var 
  i: integer;
begin 
	for i := 1 to dimf do begin 
		writeln('Ingrese nombre de la galaxia:');
		readln(v[i].nombre);
		writeln('Ingrese tipo de galaxia (1-4):');
		readln(v[i].tipo);
		writeln('Ingrese masa de la galaxia:');
		readln(v[i].masa);
		writeln('Ingrese distancia de la galaxia (en pc):');
		readln(v[i].distancia);
	end;
end;

procedure procesar(v: vector; var vc: vcant; var cantC: integer; var masaTOTAL: real; 
  var max1, max2, min1, min2: real; var p1, p2, m1, m2: string);
var 
  i: integer;
  masaTotalGalaxias: real;
begin
  masaTotalGalaxias := 0;
  max1 := -1; max2 := -1;
  min1 := 1e30; min2 := 1e30;

	for i := 1 to dimf do begin
    { Contar cantidad de galaxias de cada tipo }
		vc[v[i].tipo] := vc[v[i].tipo] + 1;

    { Acumular masa total de las galaxias principales }
		if (v[i].nombre = 'via lactea') or (v[i].nombre = 'andromeda') or (v[i].nombre = 'triangulo') then 
			masaTOTAL := masaTOTAL + v[i].masa;

    { Acumular la masa total de todas las galaxias }
    masaTotalGalaxias := masaTotalGalaxias + v[i].masa;
		
    { Contar galaxias no irregulares a menos de 1000 pc }
		if (v[i].distancia < 1000) and (v[i].tipo <> 4) then 
			  cantC := cantC + 1;

    { Buscar las dos galaxias con mayor masa }
    if (v[i].masa > max1) then begin  
        max2 := max1;
        p2 := p1;
        max1 := v[i].masa;
        p1 := v[i].nombre;
    end
    else if (v[i].masa > max2) then begin 
        max2 := v[i].masa;
        p2 := v[i].nombre;
    end;

    { Buscar las dos galaxias con menor masa }
    if (v[i].masa < min1) then begin 
        min2 := min1;
        m2 := m1;
        min1 := v[i].masa;
        m1 := v[i].nombre;
    end 
    else if (v[i].masa < min2) then begin 
        min2 := v[i].masa;
        m2 := v[i].nombre;
		end;
	end;

  { Calcular porcentaje de masa de las galaxias principales }
  if masaTotalGalaxias > 0 then
    masaTOTAL := (masaTOTAL / masaTotalGalaxias) * 100;
end;

var 
  masaTOTAL: real;
  i, cantC: integer;
  max1, max2, min1, min2: real; 
  p1, p2, m1, m2: string;
  v: vector; 
  vc: vcant;
begin 
  cantC := 0;
  masaTOTAL := 0;
  for i := 1 to 4 do 
    vc[i] := 0;

  leer(v);
  procesar(v, vc, cantC, masaTOTAL, max1, max2, p1, p2, min1, min2, m1, m2);
  
  { Informar cantidad de galaxias de cada tipo }
  for i := 1 to 4 do 
    writeln('Cantidad de galaxias de tipo ', i, ': ', vc[i]);

  { Informar masa total de las galaxias principales y su porcentaje }
  writeln('Masa total de las galaxias principales: ', masaTOTAL:0:2, '%');

  { Informar cantidad de galaxias no irregulares a menos de 1000 pc }
  writeln('Cantidad de galaxias no irregulares a menos de 1000 pc: ', cantC);

  { Informar las galaxias con mayor y menor masa }
  writeln('Galaxias con mayor masa: ', p1, ' y ', p2);
  writeln('Galaxias con menor masa: ', m1, ' y ', m2);
end.
