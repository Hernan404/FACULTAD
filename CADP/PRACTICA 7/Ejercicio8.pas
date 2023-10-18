program EJ8P7;
type 
    transferencia = record 
        numero:integer;
        DNI_origen:integer;
        num_destino:integer;
        hora,fecha:integer;
        monto:real;
        cod_motivo:1..7;
    end;

    lista = ^nodo 
    nodo = record
        data:transferencia;
        sig:lista;
    end;

    vector = array [1..7] of integer;


{procedure cargardatos (L:lista);
var 
    t:transferencia;
begin 
    leer(t);
    while (numero <> -1) do begin 
        armarlista(L,t);
        leer(t);
    end;
end;}

procedure armarlista (var pri:lista; var t:transferencia);
var 
    ant,nue,act:lista;
begin 
    new(nue);
    nue^.datos:= per;
    act:= pri;
    ant:= pri;

    while (act <> nil) and (act^.data.DNI_origen < t.DNI_origen);
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure puntoC(v:vector; var max:integer; var p1:integer);
var 
    i:integer;
begin 
    for i:=1 to 7 do begin 
    if (v[i] > max) then 
        max:= v[i];
        p1:= i;
    end;
end;

function pares (num:integer):boolean;
var 
    digito,par,impar:integer;
begin 
    par:= 0;
    impar:= 0;
    while (digito > 0) do begin 
        digito:= num mod 10;

        if (digito mod 10 = 0) then begin  
            par:= par +1;
        end 
        else begin 
            impar:= impar +1;
        end;
    end;
    pares(par < impar);
end;

function puntoD (t:transferencia):boolean;
begin 
    puntoD:= (t.mes = 'junio') and (pares(L^.data.num_destino));
end;

procedure procesarDatos (L:lista);
var 
    t:transferencia;
    max:integer;
    v:vector;
    montoTotal:real;
    p1:integer;
    cantD:integer;
begin
    cantD:= 0;
    p1:= 0;
    max:= -1;
    while (L <> nil) do begin
        
        montoTotal:= 0;
        dniaux:= L^.data.DNI_origen;
        while (L <> nil) and (L^.data.DNI_origen = dniaux);
           // punto A 
            if (L^.data.DNI_origen <> L^.data.DNI_destino) then 
                armarlista2(L,t);
           
            // punto B
            v[L^.data.cod_motivo]:= v[L^.data.cod_motivo] +1;

            montoTotal:= L^.data.monto + montoTotal;

            puntoC(v,max,p1);

            if puntoD(L^.data) then 
                cantD:= cantD +1;
        L:=L^.sig;
    end;

end;

var 
    L:lista;
begin
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
