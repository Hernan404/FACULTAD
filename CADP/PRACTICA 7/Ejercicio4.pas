
Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y 
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un 
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso. 
b. El aumento de peso total de cada embarazada durante el embarazo.


program EJ4P7; 
type 
    pacientes = record 
        Nya:string;
        pesoprimerdia:vsemana;

    end;

    lista = nodo 
    nodo = record 
        datos:pacientes;
        lista:sig;
    end;

    vsemana = array [1..42] of integer;

procedure inicializarVector(); {se dispone}
procedure leer (); {se dispone}
procedure cargarvector (); {se dispone}

procedure maspeso (vs:vsemana);
var 
    i:integer;
begin 
    for i:=1 to 42 do begin 
    if (v[i] > max) then 
        max:=vs[i];
        
    end;
end;

procedure recorrolista (L:lista; p:lista);
begin 
    while (L <> nil) do begin 
    pesoInicial:= L.p.pesoprimerdia;
    maspeso(vs);
    aumentopeso:= max - pesoInicial;
    end; 

end;

var 
    v:vector;
    L:lista;
    p:pacientes;
    max:integer;
begin 
    max:= -1;
    recorroLista(L:lista; p:lista);
    writeln('para la embarazada ', L.datos.nombre, esta es la semana con mayor peso);
end.


