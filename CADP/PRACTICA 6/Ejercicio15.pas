program EJ15P6;
type 
    alumnos = record 
        DNI:integer;
        apellidoYnombre:string;
        nota:integer;
    end;

    lista = ^nodo
    nodo = record 
        data:alumnos;
        sig:lista;
    end;

    vecLista = array [1..5] of lista;
    vecEqui = array [1..5] of integer;

procedure armarlista(var L:lista); //se dispone

procedure procesarDatos(L:lista);
var 
    vE:vecEqui;
    vL:vecLista;
begin
    for x:= 1 to 5 do begin 
        vE:= 0;
    end;
    
    while (L <> nil) do begin 
        if (L^.data.nota >= 8) then 
            if (vE[1] <= vE [4]) then begin 
                armarlista(vL[1],L^.data);
                vE[1]:= vE[1] +1;
            end
            else
                begin 
                    armarlista(vL[4],L^.dato);
                    vE[4]:= vE[4] +1;
                end; 

        if (L^.data.nota > 5) and (L^.data.nota < 8) then 
            if (vE[2] <= vE[3]) and (vE[2] <= vE[5]) then begin 
                armarlista(vlista[2],L^.dato);
                vE[2]:= vE[2] +1;
            end
            else 
                begin 
                    armarlista(vL[5],L^.dato);
                    vE[5]:= v[5] +1;
                end;
            end;
        L:= L^.sig;
    end;
end;

procedure imprimir (v:vlista);
var 
    i:integer;
begin 
    for i:= 1 to 5 do begin 
        writeln('Lista del turno',i,':');
        while (v[i] <> nil) do begin 
            writeln('DNI: ',v[i]^.data.DNI, 'nombre y apellido', v[i]^.dato.nombreYapellido);
            writeln();
            v[i]:= v[i]^.sig;
    
        end;
    end;



end;

var 
    a:alumnos;
    L1,L2,L3,L4,L5:lista;
begin 
    cargarlista(L,a);

    for i:=1 to 5 do  
        vlista[i]:= nil;
        procesarDatos(L,vlista);
    
    imprimir(vlista);
    
end.
