{el productor musical bizarrap organiza sesiones musicales con diferentes artistas. se dispone
de una estructura de datos con la informacin de las seciones de bizarrap. de cada sesion se conoce:
titulo, nombre del artista, genero musical (1: trap latino, 2: reggaeton, 3:urban, 4:electronica,
5: pop rap), año de estreno y cantidad de reproducciones en spotify. la informacion no posee un orden especifico

A. informar los dos codigos de genero musical con menor cantidad de reproducciones en spotify
B. generar una lista ordenada por año que contenga las sesiones del genero "trap latino" y "urban" cuya suma de los 
digitos de la cantidad de reproducciones sea multiplo de 5.
C. realizar un modulo que reciba la lista generada en el punto anterior e informe para cada año la cantidad de sesiones realizadas
junto al total de reproducciones de spotify de esas sesiones}


program BIZARRAP;

const 
  generos = 5;

type 
  rango_generos = 1..generos;

  sesion = record 
    titulo: string;
    nombre: string;
    genero: rango_generos;
    estreno: integer;
    cantReproducciones: integer;
  end; 

  lista = ^nodo;
  nodo = record 
    data: sesion;
    sig: lista;
  end; 

  vcant = array [rango_generos] of integer;

procedure cargardatos(var L: lista); //se dispone 

procedure puntoA(var min1, min2: integer; p1, p2: integer; vc: vcant);
var 
  i: integer;
begin 
  for i := 1 to generos do 
  begin 
    if (vc[i] < min1) then 
    begin 
        min2 := min1;
        p2 := p1;
        min1 := vc[i];
        p1 := i;
    end 
    else if (vc[i] < min2) then 
    begin 
        min2 := vc[i];
        p2 := i;
    end; 
  end;
end; 

procedure armarlista2(var L2: lista; r: sesion);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := r;
    act := L2;
    ant := L2;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act <> NIL) and (act^.data.estreno < r.estreno) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act) then 
        L2 := nue   {el dato va al principio}
    else  
        ant^.sig := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

function cumple(r: sesion): boolean;
var 
  dig: integer;
begin 
  dig := 0;

  while (r.cantReproducciones > 0) do 
  begin 
    dig := dig + r.cantReproducciones mod 10; 
    r.cantReproducciones := r.cantReproducciones div 10;
  end;
  
  cumple := ((dig mod 5 = 0) and ((r.genero = 1) or (r.genero = 3)));
end; 

procedure puntoC(L2: lista); 
var 
  totalReproducciones, cantSesiones: integer;
  estrenoACT: integer;
begin 
  totalReproducciones := 0; 
  while (L2 <> nil) do 
  begin 
      cantSesiones := 0; 
      estrenoACT := L2^.data.estreno; 

      while (L2 <> nil) and (L2^.data.estreno = estrenoACT) do 
      begin 
          cantSesiones := cantSesiones + 1;
          totalReproducciones := totalReproducciones + L2^.data.cantReproducciones;
          L2 := L2^.sig; 
      end; 
      writeln('Año: ', estrenoACT, ' Cantidad de sesiones: ', cantSesiones);
      writeln('Total de reproducciones: ', totalReproducciones);
  end; 
end; 

procedure procesardatos(L: lista);
var 
  vc: vcant; min1, min2, p1, p2: integer; L2: lista;
begin 
  min1 := 999; min2 := 999; p1 := 0; p2 := 0;
  L2 := nil;
  
  for i := 1 to generos do 
    vc[i] := 0; 
    
  while (L <> nil) do 
  begin 
    vc[L^.data.genero] := vc[L^.data.genero] + L^.data.cantReproducciones;

    if (cumple(L^.data)) then 
      armarlista2(L2, L^.data);

    L := L^.sig;
  end;

  puntoA(min1, min2, p1, p2, vc);
  writeln('Géneros con menor cantidad de reproducciones: ', p1, ' y ', p2);

  puntoC(L2);
end;

var 
  L: lista;
begin 
  L := nil;
  cargardatos(L);
  procesardatos(L);
end. 
