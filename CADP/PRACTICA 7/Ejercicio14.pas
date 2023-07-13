program EJ14P7;
type 
    prestamos = record 
        numero:integer;
        ISBN:integer;
        numsocio:integer;
        dia:1..31;
    end;

    vector = array [1..31] of integer;

    lista = nodo 
    nodo = record 
        datos:prestamos;
        sig:lista;
    end;

procedure iniciovector(v); //se dispone
procedure cargarlista(L); // se dispone
procedure leer(p); // se dispone
procedure insertarOrdenado(var pri:lista; p:prestamos);
var 
    ant,nue,act:lista;
begin 
    new(nue);
    nue^.datos:= p;
    act := pri;
    ant := pri;

    while (act <> nil) and (act.datos.IBSN < p.IBSN) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (ant = act) then 
        pri:= nue;
    else 
        ant^.sig:= nue;
    nue^.sig:= act;


procedure puntoB (vcantprestamos:vector; min:integer; var cumpleB:integer);
var 
    i:1..31;
begin 
    min:= 9999;
    for i:=1 to 31 do begin  
        if (vcantprestamos[i] < min) then begin 
            min:= vcantprestamos[i];
            cumpleB:= i;
        end;
end;

function puntoC (p:prestamos):boolean;
var 
    cumple1,cumple2:boolean; 
    par1,impar1,impar2,par2:integer;
begin 
    cumple1:= false;
    cumple2:= false;
    par1:= 0;
    impar1:= 0;
    par2:= 0;
    impar1:= 0;
    if (numero mod 2 = 0) then 
        par1:= +1;
    else 
        impar1:= impar1 +1;
    
    cumple1:= (par = 0) and (impar <> 0);

    if (cumple1) then begin 
        if (p.numsocio mod 2 = 0) then 
            par2:= par2 +1;
        else 
            impar2:= impar2 +1;
        
        cumple2:= (impar = 0) and (par <> 0);
    end;
    puntoC:= (cumple1) and (cumple2); 
end;

procedure procesardatos (L:lista);
var 
    v:vector;
    p:prestamos;
    cantcumpleC:integer;
begin 
    cantcumpleC:= cantcumpleC +1;
    while (L <> nil) do begin

        //inciso B
        vcantprestamos[L.datos.dia]:= vcantprestamos[L.datos.dia] + 1
        puntoB(vcantprestamos,min,cumpleB);

        //inciso C 
        if (cumpleC(L.datos)) then begin 
            cantcumpleC:= cantcumpleC +1;
        end;
    end;
    writeln('punto B', cumpleB);
    writeln('punto C', cantcumpleC);

end;

var 
    L:lista;
begin 
    cargarlista(L);
    procesarDatos(L);
end.
