program segundaFechaTema1;
type 


    rangoGenero = 1..5
    sesion = record 
        titulo: string;
        artista:string;
        genero:rangoGenero;
        visualizaciones:integer;
    end;

    lista = nodo 
    nodo = record 
        datos:sesion;
        sig:lista;
    end;

    vector = array [rangoGenero] of integer;

procedure inivector (var v:vector);
var 
    i:integer;
begin
    for i:=1 to 5 do begin 
        v[i]:= 0;
    end;
end;

procedure armarnodo();
procedure leer();
procedure cargarLista();

function paresimpares (num:integer):boolean;
var 
    pares,impares, digito:integer;
begin 
    pares:= 0;
    impares:= 0;
    while (num <> 0) do begin 
        digito:= (num mod 10);
        if (digito mod 2 = 0) then 
            pares := pares +1
        else 
            impares := impares +1;
        num:= num div 10;
    end;
    paresimpares:= (pares = impares);
end;
procedure cumple (s:sesion):boolean;
begin 
    cumple:= (s.genero = 2) and (paresImpares(s.visualizaciones));
end;

procedure maximos (v:vector; var cod1,cod2:rangoGenero);
var 
    max1,max2:integer;
    i:rangoGenero;
begin 
    max1:= -1;
    max2:= -1;
        for i:=1 to 5 do begin 
            if (v[i] > max1) then begin 
                max2:= max1;
                cod2:= cod1;
                cod1:= i;
                max1:= v[i];
            end
                else if (v[i] > max2) then begin  
                    max2:= v[i];
                    cod1:= i;
                end;
        end;
end;
procedure procesarLista(L);
var 
    max1,max2:integer;
    titulo:string;
begin 
    while (L <> nil) do begin 
        v[L.datos.genero]:= v[L.dato.genero] + L.datos.visualizaciones;
        if (cumple(L.dato)) then 
            cant:= cant +1;
        L:= L.sig;
    end;
    writeln(cant);
    end;
end;

var 
    L:lista;
    v:vector;
begin 
    L:= nil;
    inivector(v);
    cargarLista(L);
    procesarLista(L);  
    maximos(v,codmax1,codmax2);
    writeln(codmax1,codmax2);

    readln(titulo);
    eliminar(L);
end.
