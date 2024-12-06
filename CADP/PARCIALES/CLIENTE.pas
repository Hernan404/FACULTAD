{Una tienda virtual necesita un programa para administrar la informacion de sus clientes
de cada cliente se lee: numero, DNI, apellido y nombre, fecha de nacimiento (dia,mes,año)
nivel(1..5) y puntaje. la lectura finaliza cuando se lee el cliente con dni 33444555 que debe procesarse

se pide: 
A) generar una estructura que contenga numero, apellido y nombre de aquellos clientes con dni 
compuestos unicamente por digitos impares
B) informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000
C) implementar un modulo que elimine de la estructura generada la informacion relacionada a un 
numero de cliente recibido por parametro, tener en cuenta que dicho numero puede no existir.}
program CLIENTES;
const 
  niveles = 5;
type 
  rango_niveles = 1..niveles;

  nacimiento = record 
    dia: integer;
    mes: integer;
    año: integer;
  end; 

  cliente = record 
    numero: integer;
    dni: integer;
    apellidoynombre: string[50];
    fecha: nacimiento;
    nivel: rango_niveles;
    puntaje: real;
  end; 

  lista = ^nodo;
  nodo = record 
    data: cliente;
    sig: lista;
  end; 

  vniveles = array[rango_niveles] of real;

procedure leer(var r: cliente);
begin
  with r do begin
    writeln('Ingrese numero de cliente: ');
    readln(numero);
    writeln('Ingrese DNI: ');
    readln(dni);
    writeln('Ingrese apellido y nombre: ');
    readln(apellidoynombre);
    writeln('Ingrese fecha de nacimiento (dia, mes, año): ');
    readln(fecha.dia, fecha.mes, fecha.año);
    writeln('Ingrese nivel (1..5): ');
    readln(nivel);
    writeln('Ingrese puntaje: ');
    readln(puntaje);
  end;
end;

procedure armarlista(var L: lista; r: cliente);
var 
  aux: lista;
begin 
  new(aux);
  aux^.data := r;
  aux^.sig := L;
  L := aux;
end;

procedure cargardatos(var L: lista);
var 
  r: cliente;
begin 
  repeat 
    leer(r);
    armarlista(L, r);
  until (r.dni = 33444555); // Detener cuando el DNI sea 33444555
end;

function cumpleImpares(dni: integer): boolean;
var 
  esImpar: boolean;
begin 
  esImpar := true;
  while (dni > 0) and esImpar do begin 
    if ((dni mod 10) mod 2 = 0) then 
      esImpar := false; // Si algún dígito es par, no cumple
    dni := dni div 10;
  end;
  cumpleImpares := esImpar;
end;

procedure armarlista2(var L2: lista; r: cliente);
var 
  aux: lista;
begin 
  new(aux);
  aux^.data.numero := r.numero;
  aux^.data.apellidoynombre := r.apellidoynombre;
  aux^.sig := L2;
  L2 := aux;
end;

procedure mayorYmenorNivel(vn: vniveles; var max, min: real; var pMax, pMin: integer);
var 
  i: rango_niveles;
begin 
  max := -1;
  min := High(real); // Inicializar a un valor muy alto
  for i := 1 to niveles do begin 
    if (vn[i] > max) then begin 
      max := vn[i];
      pMax := i;
    end;

    if (vn[i] < min) then begin 
      min := vn[i];
      pMin := i;
    end;
  end; 
end;

procedure borrarElemento(var L: lista; numero: integer; var exito: boolean);
var 
  ant, act: lista;
begin 
  exito := false;
  act := L;
  ant := nil;

  while (act <> nil) and (act^.data.numero <> numero) do begin 
    ant := act;
    act := act^.sig;
  end;

  if (act <> nil) then begin 
    exito := true;
    if (act = L) then 
      L := act^.sig
    else 
      ant^.sig := act^.sig;
    dispose(act);
  end;
end;

procedure procesardatos(L: lista);
var 
  L2: lista; 
  vn: vniveles;
  max, min: real;
  pMax, pMin: integer;
  i: rango_niveles;
begin 
  L2 := nil;
  for i := 1 to niveles do 
    vn[i] := 0;

  while (L <> nil) do begin 
    if cumpleImpares(L^.data.dni) then 
      armarlista2(L2, L^.data);

    if (L^.data.fecha.año < 2000) then 
      vn[L^.data.nivel] := vn[L^.data.nivel] + L^.data.puntaje;

    L := L^.sig;
  end;

  mayorYmenorNivel(vn, max, min, pMax, pMin);
  writeln('Nivel con mayor puntaje: ', pMax, ' (', max:0:2, ')');
  writeln('Nivel con menor puntaje: ', pMin, ' (', min:0:2, ')');
end;

var 
  L: lista; 
  num: integer; 
  exito: boolean;
begin 
  L := nil;
  cargardatos(L);
  procesardatos(L);

  writeln('Ingrese el numero de cliente a eliminar: ');
  readln(num);
  borrarElemento(L, num, exito);
  if exito then
    writeln('Cliente eliminado correctamente.')
  else
    writeln('El cliente no existe.');
end.
