
Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y 
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un 
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso. 
b. El aumento de peso total de cada embarazada durante el embarazo.



program EJ4P7; 
type 
    pacientes = record 
        Nya:string;
        pesoprimerdia:integer;
    end;

    lista = nodo 
    nodo = record 
        datos:pacientes;
        lista:sig;
    end;

    vsemana = array [1..42] of integer;

procedure inicializarVector(); {se dispone}
procedure leer (); {se dispone}
procedure cargardatos (); {se dispone}

procedure puntoA (v:vsemana; var max,p1:integer);
var 
    i:integer;
begin 
    for i:=1 to 42 do begin 
        if (v[i] > max) then begin 
            max:=v[i];
            p1:= i;
        end;
    end;
end;

procedure procesardatos (L:lista);
var 
    r:pacientes;
    max,p1:integer;
    pesoInicial,aumentopeso:integer;
begin 
    
    max:= -1;
    p1:= 0;
    while (L <> nil) do begin 
        pesoInicial:= L^.data.pesoprimerdia;

        puntoA(v,max1,p1);
        aumentopeso:= max - pesoInicial;
    L:= L^.sig;
    end; 
    writeln('punto A', p1);
    writeln('punto B', aumentopeso);
end;

var 
    L:lista;
begin 
   L:= nil;
   cargardatos(L);
   procesardatos(L);
end.

