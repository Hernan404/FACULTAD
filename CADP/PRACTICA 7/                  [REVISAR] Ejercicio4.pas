{una fabrica de automoviles necesita un programa para administrar las piezas de los diferentes modelos de automoviles
que fabrica. de cada pieza, se conoce: codigo de pieza, descripcion, cantidad en stock, costo de la pieza, codigo de 
modelo al que pertenece(1 al 10), stock minimo. la lectura finaliza al leer el codigo de pieza 9999 el cual debe procesarse 

A. leer y almacenar la informacion de las piezaas en una estructura de datos adecuada. la informacion debe quedar 
almacenada en el mismo orden que fue leida 

B. a partir de la estructura generada en A) calcular e informar 
    1. los 2 codigos de modelo d automoviles mas baratos de fabricar 
    2. el promedio de piezas con codigo de modelo 3 y cuyo codigo de pieza comienza en 9 
    3. cual es el codigo de peiza en que la fabrica debera gastar mas dinero para que su stock actual supere
    en una unidad a su stock minimo.}


program EJ4P7;
const 
  semanas = 42;
type 
  rango_semanas = 1..semanas;

  vector = array[rango_semanas] of real;

  paciente = record 
    nombre: string;
    apellido: string;
    peso: vector; // Vector de pesos registrados por semana
  end; 

  lista = ^nodo;
  nodo = record 
    data: paciente;
    sig: lista;
  end;

procedure leer(var r: paciente; var diml: integer);
var
  i: integer;
begin
    with r do begin
        readln(nombre);
        if nombre <> 'ZZZ' then begin
            readln(apellido);
            for i := 1 to diml do
                readln(peso[i]);
        end;
    end;
end;

procedure armarlista(var L: lista; r: paciente);
var
  nue, act: lista;
begin
    new(nue);
    nue^.data := r;
    nue^.sig := nil;
    if L = nil then
        L := nue
    else begin
        act := L;
        while act^.sig <> nil do
            act := act^.sig;
        act^.sig := nue;
    end;
end;

procedure cargardatos(var L: lista; var diml: integer);
var 
  r: paciente;
begin 
  diml := semanas; // Siempre se considerarán hasta 42 semanas
  repeat
      leer(r, diml);
      if r.nombre <> 'ZZZ' then
          armarlista(L, r);
  until r.nombre = 'ZZZ';
end; 

procedure procesardatos(L: lista; diml: integer);
var
  i, s1: integer;
  max, total, aumento: real;
begin
  while L <> nil do begin
      max := -1;
      total := 0;
      s1 := 0;

      // Calcular semana con mayor aumento de peso
      for i := 2 to diml do begin
          aumento := L^.data.peso[i] - L^.data.peso[i - 1];
          if aumento > max then begin
              max := aumento;
              s1 := i;
          end;
      end;

      // Calcular aumento total de peso
      for i := 1 to diml do
          total := total + L^.data.peso[i];

      writeln('Paciente: ', L^.data.nombre, ' ', L^.data.apellido);
      writeln('Semana con mayor aumento de peso: Semana ', s1, ' con un aumento de ', max:0:2, ' kg');
      writeln('Aumento total de peso: ', total:0:2, ' kg');
    

      L := L^.sig;
  end;
end;

var 
  L: lista;
  diml: integer;
begin 
  L := nil;
  cargardatos(L, diml);
  procesardatos(L, diml);
end.
