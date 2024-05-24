

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

procedure armarlista (L:lista; r:empresa);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= r;
    aux^.sig:= L;
    L:= aux;
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

//punto B

function dosceros (codigo:integer; vc:vector; diml:integer):boolean;
var 
    digito,cero:integer;
begin 
    cero:= 0;
    while (digito > 0) and not (puntoB) do begin 
        digito:= num mod 10;
        if (digito = 0) then 
            cero:= cero +1;
    end;
    dosceros:= (cero = 2);
end;

function puntoB (L:lista; c:cultivo; e:empresa):boolean;
begin 
    (e.nombre_ciudad = 'san miguel del monte') and (v[i].tipo = 'trigo') and (dosceros(L^.data.codigo);
end;

procedure puntoD (var max:integer; var p1:string; c:cultivo; e:empresa);
var 
    i:integer;
begin 
    i:= 1;
    while (i <= diml) do begin 
        i:= i +1;
    if (v[i].meses > max) then begin 
        max:= v[i].meses;
        p1:= e.nombre;
    end;
end;

procedure puntoE (c:cultivo; e:empresa):boolean;
var 
    i:integer;
begin 
    puntoE:=(v[i].tipo = 'girasol') and (v[i].cantHec < 5) and (e.est_o_priv = 'privada') and (i <= diml);
        i:= i +1;
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
    i:integer;
begin 
    i:= 0;
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
        
        for i:=1 to diml do 
            if (v[i].tipo = 'soja') then  
                HECsoja:= v[i].cantHec + HECsoja;
                
        //punto D 
        if (v[i].tipo = 'maiz') then   
            puntoD(max1,p1,e,c);

        //punto E 
        if (puntoE(e,c)) then  
            v[i].cantMeses:= v[i].cantMeses +1;
    
        else  
            i:= i +1;
        end;
        
        L:= L^.sig;
    end;
        writeln('PUNTO C ',  (HECsoja*TotalHEC)/100);
    
end; 

var 
    L:lista;
begin 
    L:= niL;
    procesardatos(L);
    cargardatos(L);
end.
