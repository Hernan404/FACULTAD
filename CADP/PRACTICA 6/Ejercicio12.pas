{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de
Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee
(medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un
programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program EJ12P6;
type 
  dispositivo = record 
    version: real;
    tamanio: real;  // Tamaño de la pantalla (en pulgadas)
    cantRAM: real;  // Cantidad de memoria RAM (en GB)
  end; 

  lista = ^nodo;
  nodo = record 
    data: dispositivo;
    sig: lista;
  end;

// Se dispone
procedure cargardatos(var L: lista); 
begin

end;

procedure procesardatos(L: lista);
var 
  versionACT: real;
  cantA, cantB, cantC: integer;
  sumaTamanios, promedio: real;
begin 
  cantB := 0;
  cantC := 0;
  sumaTamanios := 0.0;
  
  while (L <> nil) do begin
    // PUNTO A: Contar dispositivos por versión de Android
    versionACT := L^.data.version; 
    cantA := 0;  // Contador de dispositivos para la versión actual

    while (L <> nil) and (L^.data.version = versionACT) do begin
      cantA := cantA + 1;

      // PUNTO B: Contar dispositivos con más de 3 GB de RAM y pantalla <= 5 pulgadas
      if (L^.data.cantRAM > 3) and (L^.data.tamanio <= 5) then 
        cantB := cantB + 1;

      // PUNTO C: Acumular tamaños de pantallas para promedio
      sumaTamanios := sumaTamanios + L^.data.tamanio;
      cantC := cantC + 1;  // Contador total de dispositivos

      L := L^.sig;
    end;

    // Imprimir la cantidad de dispositivos para la versión actual
    writeln('Version ', versionACT:0:1, ': ', cantA, ' dispositivos');
  end;

  // Mostrar resultados finales
  writeln('Cantidad de dispositivos con más de 3GB de RAM y pantallas <= 5 pulgadas: ', cantB);
  
  promedio := sumaTamanios / cantC;
  writeln('Tamaño promedio de las pantallas: ', promedio:0:2, ' pulgadas');
  
end;

var 
  L: lista;
begin 
  L := nil;
  cargardatos(L);  // Se dispone
  procesardatos(L);
end.

