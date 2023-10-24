
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


//punto A
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

procedure armarlista (L:lista; );


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

//punto B

function dosceros (num:integer):boolean;
var 
    digito,cero:integer;
begin 
    cero:= 0;
    while (digito > 0) do begin 
        digito:= num mod 10;
        if (digito = 0) then 
            cero:= cero +1;
    end;
    dosceros:= (cero = 2);
end;

function puntoB (L:lista; c:cultivo; e:empresa):boolean;
begin 
    puntoB:= (e.nombre_ciudad = 'san miguel del monte') and (v[i].tipo = 'trigo') and (dosceros(L^.data.codigo));
end;

procedure puntoD (var max:integer; var p1:string; c:cultivo; e:empresa);
begin 
    if (c.cantMeses > max) then begin 
        max:= c.cantMeses;
        p1:= e.nombre;
    end;
end;

procedure puntoE (c:cultivo; e:empresa):boolean;
begin 
    puntoE:= (v[i].tipo = 'girasol') and (v[i].cantHec < 5) and (e.est_o_priv = 'privada');
end;

procedure procesaardatos(L:lista);
var 
    v:vector;
    e:empresa;
    c:cultivo;
    TotalHEC:integer;
    HECsoja:integer;
    cumpleC:real;
    max1:integer;
    p1:string;
    i:= 0;
begin 
    max1:= -1;
    p1:= 0;
    HECsoja:= 0;
    TotalHEC:= 0;
    while (L <> nil) do begin 
        //punto B
        if puntoB(L,c,e) then 
            cumpleB:= L^.data.nombre;
        //punto C 
        TotalHEC:= v[c.cantHec] + TotalHEC;
        
        if (v[i].tipo = 'soja') then 
            HECsoja:= v[i].cantHec + HECsoja;
        end; 

        cumpleC:= (HECsoja*TotalHEC)/100;  

        //punto D 
        if (v[i].tipo = 'maiz') then begin  
            puntoD(max1,p1,e,c);
        end; 

        //punto E 
        if (puntoE(e,c)) then begin 
            v[i].cantMeses:= v[i].cantMeses +1;
    
        else  
            i:= i +1;
        end;
        
        L:= L^.sig;
    end;
    
end; 


var 
    L:lista;
begin 
    cargardatos(L);
    procesardatos(L);
end.

