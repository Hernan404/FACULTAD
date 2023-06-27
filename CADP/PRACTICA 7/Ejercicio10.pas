program EJ10P7;
type 
    empresa = record 
        codigo:integer;
        nombre:string;
        estado:string;
        nombreCiudad:string;
        cultivos:1..20;
    end;

    cultivo = record 
        tipo:lista;
        cantHec:integer;
        cantMeses:integer;
    end;

    vCultivos = array [1..20] of string;

procedure cargarLista ();
var 
    aux:lista;
begin 
    new(aux)
    aux^.datos:= d;
    aux^.sig:= L;
    sig:=lista;
end;

procedure puntoB (L:lista; v:vCultivos; d:empresa; var cumple:boolean);
begin 
    cumple:= false;
    for i:=1 to 20 do begin 
    if (d.nombreCiudad = 'San Miguel del monte') and (v[i] = 'trigo') then
        cargarLista();
        cumple:= true;
    end;
end;

procedure imprimirNombresA (var L:lista);
var 
    act:lista;
begin 
    act:= lista;
    if (cumple = true) then begin
        while (L <> nil) do  

            writeln('Nombres de empresas que cumplen A', act^.datos.nombre);
            act:= act^.sig;
    end;
end;

procedure puntoC (representa:real; cantHectareas:integer; d:empresa; v:vCultivos);

begin 
    if (v[i] = 'soja') then begin 
        cantHectareas:= cantHectareas +1;
        representa:=cantHectareas/d.cantHec;
    end;
end;

procedure puntoD (p:cultivo; d:empresa; max:integer; v:vCultivos);
var 
    i:integer;
begin 
    for i:=1 to 20 do begin 
    if (v[i] = 'maiz') then  
        if (d.cantMeses > max) then 
            max:=d.cantMeses;
            mastiempo:= d.nombre
    end;
end;

procedure puntoE (p:cultivo; d:empresa; v:vCultivos; var cantDias:integer);
begin 
    for i:=1 to 20 do begin 
        if (p.cantHec < 5) and (v[i] = 'girasol') and (d.estado = 'estatal') then begin 
            cantDias:= cantDias + 30;
    end;
end;

procedure procesarDatos ();
begin 
    inivector();
    while (d.codigo <> -1) and (c.cantHec <> 0) do begin 
        leerEmpresa();
        leerCultivo();
        cargarVector();

        puntoB();
        puntoC();
        puntoD();
        puntoE();
    end;
        writeln('punto C ', representa);
        writeln('punto D ',  )
    end;
end;

var 
    cantDias,mastiempo:integer;
    representa:= real;
begin 
    representa:= 0;
    cantDias:= 0;
    mastiempo:= 0;
end;







