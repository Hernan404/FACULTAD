{La FIFA desea procesar informacion del torneo "Copa del Mundo" entre paises. para ello,
dispone de una estructura de datos con la informacion de cada pais que ha participado
alguna vez del evento. de cada pais se conoce el nombre del pais, cantidad total de copas obtenidas,
la cantidad de participaciones en mundiales e informacion de dichas participaciones (a lo sumo 22)
de cada participacion se conoce el año y en que instancia finalizo (1: fase de grupos, 2: octavos de final, 3: cuartos de final, 4:semifinal; 5:final)
realizar un programa
a. lea la informacion de un nuevo pais y la incorpore en la estructura de datos que se dispone del nuevo pais 
se lee el nombre del pais, la cnatidad de copas obtenidas, la cantidad de participaciones y la infomracion de cada 
participacion (año y en que instancia finalizo en dicha participacion) 
b. una vez cargado el nuevo pais, procese los datos de todos los paises, e informe: 
	1. para cada pais ,a la cantida de participaciones realizadas en años anteirores al 1998 en las que 
	superaros los octavos de final 
	2. los nombres de los dos paises que llegaron mas veces a instancias de final 
	3. el promedio de participantes en copas del mundo entre todos los paises}


program TERCERA_FECHA;
const 
  instancias = 5;
type 
  rango_instancias = 1..instancias;
  
  info = record 
    año:integer;
    instancia:rango_instancias;
  end; 

  pais = record 
    nombre:string;
    cant_copas:integer;
    cant_participaciones:integer;
    participacion:vector; // Cambiado de 'info' a 'vector' para coincidir con el array
  end;

  vector = array [1..22] of info;

  lista = ^nodo;
  nodo = record 
    data:pais;
    sig:lista;
  end;

  vcant = array[1..instancias] of integer; // Tipo agregado para el vector vc

procedure armarlista(var L:lista; r:pais); // se dispone 
begin
  // Implementación del procedimiento (se dispone)
end;

procedure cargardatos(var L:lista); // Agregado parámetro var
var 
  r:pais; 
  i:integer;
begin 
  with r do begin 
    readln(nombre);
    readln(cant_copas);
    readln(cant_participaciones);
    for i:=1 to cant_participaciones do begin 
      readln(participacion[i].año); // Corregido para usar el campo participacion
      readln(participacion[i].instancia);
    end; 
    armarlista(L, r);
  end;
end; 

procedure procesardatos (L:lista); 
var 
  vc:vcant;
  equipoACT: string;
  cantA, cantB, cantequipos, cantpromedio: integer;
  max1, max2: integer;
  p1, p2: string;
  promedio: real;
  i: integer;
begin 
  // Inicialización de variables
  cantA := 0;
  cantB := 0;
  cantequipos := 0;
  cantpromedio := 0;
  max1 := -1;
  max2 := -1;
  p1 := '';
  p2 := '';
  promedio := 0;

  while (L <> nil) do begin 
    equipoACT := L^.data.nombre;
    cantA := 0;
    cantequipos := cantequipos + 1; // Asumo que es por equipo, no por participaciones

    while (L <> nil) and (L^.data.nombre = equipoACT) do begin 
      for i:=1 to L^.data.cant_participaciones do begin 
        if (L^.data.participacion[i].año > 1998) and (L^.data.participacion[i].instancia > 2) then 
          cantA := cantA + 1; 

        if (L^.data.participacion[i].instancia = 5) then 
          cantB := cantB + 1; 

        cantpromedio := cantpromedio + 1; 
      end;

      // Actualización de máximos para puntoB
      if cantB > max1 then begin
        max2 := max1;
        p2 := p1;
        max1 := cantB;
        p1 := equipoACT;
      end
      else if cantB > max2 then begin
        max2 := cantB;
        p2 := equipoACT;
      end;

      L := L^.sig;
    end;
  end; 

  if cantpromedio > 0 then
    promedio := cantequipos / cantpromedio 
  else
    promedio := 0;

  // Aquí debería haber algún output de los resultados
  writeln('País con más veces en 5ta instancia: ', p1);
  writeln('Segundo país con más veces en 5ta instancia: ', p2);
  writeln('Promedio: ', promedio:0:2);
end; 

var
  L:lista;
begin 
  L := nil; 
  cargardatos(L);
  procesardatos(L);
end.
