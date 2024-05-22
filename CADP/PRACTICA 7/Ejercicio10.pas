
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

{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la
ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se
registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de
meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se
ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa
se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de
empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al
total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program EJ10P7;
type 
    empresa = reco rd 
        codigo:integer;
        nombre:string;
        estado:string;
        ciudad:string;
        cultivos:tipos;
    end;

    tipos = record 
        tipo:string;
        cant_hectareas:integer;
        cant_meses:integer;
    end;

    lista = ^nodo 
    nodo = record 
        data:empresa;
        sig:lista;
    end;

    vector = array [1..20] of tipos;

procedure inivecor (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to diml
end;

procedure cargardatos(L:lista; L2:lista_cultivos);
var 
    r:empresa;
    c:tipos;
    diml:integer;
begin
    diml:= 0;

    leer_empresa(r);
    while(r.codigo <> -1) do begin 
        armarlista_empresa(L,r);
        leer_cultivos(c);

        while (c.cant_hectareas <> 0) and (diml < 20) do begin 
            // CARGAR EN VECTOR
            diml:= diml +1;
            leer_cultivos(c);
        end;

        leer_empresa(r);
    end;
end;



procedure puntoB();

procedure puntoC();

procedure puntoD();




procedure puntoE ();
var 

begin 
end;


procedure procesardatos(L:lista; L2:lista_cultivos);
var 
    v:vector;
begin 

    while (L <> nil) do begin 

        for i:=1 to diml do begin 
        //PUNTO B
        if(L^.data.ciudad = 'san miguel') and (v[i].tipo = 'trigo') and (cumple0(L^.data)) then 
            writeln(L^.data.nombre);

        //PUNTO C
        total_hec:= total_hec + v[i].cant_hectareas;

        if (v[i].tipo = 'soja') then begin 
            cantC:= cantC +1;
            puntoC:= cantC/total_hec;
        end;

        if (v[i].tipo = 'maiz') then begin 
            if (v[i].cant_meses > max) then begin  
                max:= v[i].cant_meses;
                p1:= L^.data.nombre;
            end;
        end;

        if (v[i].tipo = 'girasol') and (v[i].cant_hectareas < 5) and (L^.data.estado = 'privada')


    end;
end;




var 
    L:= lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.









program EJ10P7;
type 
    tipos = record 
        tipo:string;
        cant_hectareas:integer;
        cant_meses:integer;
    end;

    empresa = record 
        codigo:integer;
        nombre:string;
        estado:string;
        ciudad:string;
        cultivos: array [1..20] of tipos;
        cant_cultivos: integer; // para llevar el registro del número de cultivos
    end;

    lista = ^nodo; 
    nodo = record 
        data:empresa;
        sig:lista;
    end;

procedure leer_empresa(var e:empresa);
begin
    // Aquí deberías implementar la lógica para leer los datos de la empresa
end;

procedure armarlista_empresa(var L:lista; e:empresa);
begin
    // Aquí deberías implementar la lógica para agregar una empresa a la lista
end;

procedure leer_cultivos(var c:tipos);
begin
    // Aquí deberías implementar la lógica para leer los datos de los cultivos
end;

function cumple0(e:empresa): boolean;
begin
    // Aquí deberías implementar la lógica para verificar si un código de empresa tiene al menos dos ceros
end;

procedure incrementar_meses_girasol(var e:empresa);
begin
    // Aquí deberías implementar la lógica para incrementar en un mes los cultivos de girasol con menos de 5 hectáreas
end;

procedure cargardatos(var L:lista);
var 
    r:empresa;
begin
    leer_empresa(r);
    while (r.codigo <> -1) do 
    begin
        armarlista_empresa(L, r);
        leer_empresa(r);
    end;
end;

procedure puntoB(L:lista);
var 
    temp:lista;
begin
    temp := L;
    while temp <> nil do
    begin
        // Aquí deberías implementar la lógica para el punto B
        temp := temp^.sig;
    end;
end;

procedure puntoC(L:lista);
var 
    temp:lista;
    total_hec, cant_soja: integer;
begin
    temp := L;
    total_hec := 0;
    cant_soja := 0;

    while temp <> nil do
    begin
        // Aquí deberías implementar la lógica para el punto C
        temp := temp^.sig;
    end;

    // Aquí deberías imprimir el resultado
end;

procedure puntoD(L:lista);
var 
    temp:lista;
    max_meses: integer;
    empresa_maiz: string;
begin
    temp := L;
    max_meses := 0;

    while temp <> nil do
    begin
        // Aquí deberías implementar la lógica para el punto D
        temp := temp^.sig;
    end;

    // Aquí deberías imprimir el resultado
end;

procedure procesardatos(L:lista);
var 
    temp:lista;
begin
    temp := L;
    while temp <> nil do
    begin
        // Aquí deberías implementar la lógica general para procesar los datos
        puntoB(temp);
        puntoC(temp);
        puntoD(temp);
        incrementar_meses_girasol(temp^.data);
        temp := temp^.sig;
    end;
end;

var 
    L: lista;
begin 
    L:= nil;
    cargardatos(L);
    procesardatos(L);
end.
