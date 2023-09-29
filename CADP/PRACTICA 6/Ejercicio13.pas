program EJ13P6;
type 
    usuarios = record 
        mail:string;
        rol:1..4;
        revista:string;
        dias:integer;
    end;

    lista = ^nodo 
    nodo = record 
        data:usuarios;
        sig:lista;
    end;

    vector = array [1..4] of integer;

// ==== INCISOS A
procedure crearOrdenado (var L: Lista; r: REG_user);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.dato.cantDias < r.cantDias) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure armarlista (L,L2:lista);
var 
    aux:lista;
begin 
    new(aux);
    aux.^data:= u;
    aux.^sig:= L;
    L:= L^.sig;
end;

procedure cargarlista(L:lista; u:usuarios);
begin 
    leer(u);
    while (u.rol <> 0) do begin 
        armarlista(L);
        leer(u);
    end;
end;

procedure puntoA (L:lista; u:usuarios);
begin 
     while (L <> nil) do begin 
        writeln(L2^.data.mail);
        writeln(L2^.data.dias);

     L:= L^.sig;
     end;
end;

procedure procesarDatos(L:lista);
var 

begin
    
    while (L <> nil) do begin
        v[L^.data.rol]:= v[L^.data.rol] +1;

        if (u.revista = 'economica') then 
            armarlista(L2,u);
    
    
    end;
    puntoA(L,u);
    for i:=1 to 4 do 
    writeln('cantidad de usuarios por cada rol' v[i]);
     
end;

var 
    u:usuarios;
    L:lista;
begin 
    procesarDatos(L);
end.

