
{La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrera
  
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor)}

program EJ11P6;
type 

  info = record 
    numero:integer;
    apellido:string;
    promedio:real;
  end;

  lista = ^nodo;
  nodo = record 
    data:info;
    sig:lista;
  end;


procedure leer(var r:info);
begin 
  with r do begin 
    readln(numero);
    readln(apellido);
    readln(promedio);
  end;
end;


procedure armarlista(var L:lista; r:info);
var 
  aux:lista;
begin 
  new(aux);
  aux^.data:= r;
  aux^.sig:= L;
  L:= aux;
end;


procedure cargardatos(L:lista);
var 
  r:info;
begin 
  leer(r);
  while (r.numero <> 0) do begin 
      armarlista(L,r);
      leer(r);
  end;
end;

procedure armarlista2(var L2:lista; r:info);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := r;
    act := L2;
    ant := nil;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.promedio > r.promedio) do begin   {el dato va al principio}
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        L2 := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure seleccion (r:info; var L2:lista; var cant:integer);
var 
  aux:lista;
begin 
  if (cant < 10) then begin
    armarlista2(L2, r);
    cant := cant + 1;
  end
  else if (r.promedio > L2^.data.promedio) then begin
    aux := L2;
    L2 := L2^.sig;
    dispose(aux);
    armarlista2(L2, r);
  end;
end;

procedure procesardatos(L:lista; var L2:lista);
var 
  cant: integer;
begin 
  cant := 0;
  while (L <> nil) do begin 
    seleccion(L^.data, L2, cant);
    L := L^.sig;
  end;

  writeln('DATOS DE EGRESADOS QUE RECIBIRAN PREMIO');
  while (L2 <> nil) do begin
    writeln('Apellido: ', L2^.data.apellido);
    writeln('Numero: ', L2^.data.numero);
    L2 := L2^.sig;
  end;
end;

var 
  L,L2:lista;

begin 
    L := nil;
    L2 := nil;
    cargardatos(L);
    procesardatos(L, L2);
end.
