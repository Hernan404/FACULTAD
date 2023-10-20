program EJ10P7;
const 
    dimf = 20;
type 
    empresa = record 
        codigo:integer;
        nombre:string;
        est_o_priv:string;
        nombre_ciudad:string;
        tipocultivo:vector;
    end;

    cultivo = record 
        tipo:string;
        cantHec:integer;
        cantMeses:integer;
    end;

    vector = array [1..dimf] of cultivo;

procedure leer(var e:empresa);
var 
    ha:integer;
begin 
    with e do begin 
        writeln('codigo empresa');
        readln(codigo);
        if (codigo <> -1) then begin 
            writeln('nombre empresa');
            readln(nombre);
            writeln('privada o estatal');
            readln(est_o_priv);
            writeln('ciudad');
            readln(nombre_ciudad);

        diml:= 0;

        writeln('cantidad hectareas');
        readln(ha);
    
        while (diml <= dimf) and (ha <> 0) do begin 
            diml:= diml +1;
            writeln('tipo de cultivo');
            readln(cultivo[diml].tipo);
            writeln('cantida de meses');
            readln(cultivo[diml].meses);

            cultivo[diml].hectareas:= ha;

            writeln('cant hectareas');
            readln(ha);
        end;
    end;
end;

end;


procedure cargardatos (L:lista); 
var 
    e:empresa;
begin 
    leer(e);
    while (e.codigo <> -1) do begin 
        armarlista(L,e);
        leer(e);
    end;
end;


var 
    L:lista;
begin 
    cargardatos(L);
    procesardatos(L);
end.
