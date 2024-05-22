program EJ8P7;
type 
    motivo = 1..7;

    transferencia = record 
        num_origen:integer;
        dni_origen:integer;
        num_destino:integer;
        dni_destino:integer;
        fecha:fechas;
        hora:real;
        monto:real;
        codigo:motivo;
    end;

    fechas = record 
        dia:integer;
        mes:integer;
        anio:integer;
    end;

    lista = ^nodo 
    nodo = record 
        data:transferencia;
        sig:lista;
    end;



    vector = array [motivos] of integer;


Procedure armarlista2 ( var pri: lista; t:terceros);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := per;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.num_origen < t.num_origen) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure puntoA(L:lista; var L2:listaA; r:transferencia);
begin 
    if (L^data.num_origen <> L^.data.num_destino) then begin 
        armarlista2(L2,t)
        L2:= L^.sig;
    end;
end;

procedure puntoB(var max,p1:integer; v:vector);
begin 
    for i:=1 to motivo do begin 
        if (v[i] > max) then begin 
            max:= v[i];
            p1:= i;
        end;
    end;
end;

function cumplePares(t:transferencia):boolean;
var 
    par,impar,digito:integer;
begin 
    par:= 0;
    impar:= 0;
    while (digito > 0) do begin 
        digito:= r.num_destino mod 10;
        if (digito mod 2 = 0) then 
            par:= par +1;
        else 
            impar:= impar +1;
    
        digito:= digito div 10;
    end;

    cumplePares:= (par < impar);
end;

function puntoD(t:transferencia):boolean;
begin 
    puntoD:= (r.fecha.mes = 5) and (cumplePares(r));
end;

procedure procesardatos (L:lista);
var 
    v:vector; L2:lista;
begin 
    L2:= nil;

    puntoA(L2,L);
    while (L <> nil) do begin 
        //PUNTO A
        puntoA(L,L2,L2^.data);
        cuentaACT:= L^.data.num_origen;
        total:= 0;
        while (L <> nil) and (L^.data.num_origen = cuentaACT) do begin
            //PUNTO B
            total:= L^.data.monto + total;

            //PUNTO C
            v[L^.data.codigo]:= v[L^.data.codigo] +1;

            //PUNTO D
            if (puntoD(L^.data)) then 
                cantD:= cantD +1;
        end;
        //PUNTO B
        writeln(total);
        puntoC(max,p1,v);
    end;
    //punto C
    writeln(p1);
    //PUNTO D
    writeln(cantD);
end;

var 
    L:lista;
begin 
    cargardatos(L);
    procesardatos(L2);
end.
