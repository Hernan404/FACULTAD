ej14

1300 alumnos 
codigo (1..1300), 
dia del mes, 
facultad, 
trasporte (1..5) 

program Ejercico11;
type
    marzo=1..30;
    trans=1..5;
    str20=string[20];    
    alumno=record
        codigo:integer;
        dia_mes:marzo;
        Facultad:str20;
        transporte:integer;
    end;
    Lista=^nodo;
    nodo=record
        Datos:alumno;
        sig:Lista; 
    end;
    vector=array [1..1300] of alumno; 
    vector_contador= array [1..5] of integer;
//____________________________________________________
procedure LeerAlumno (var alumnoF:alumno;var cant_viajes:integer;var gasto_total:integer);
var
    i:integer;
begin
    
    i:=1;
    
        WriteLn('Codigo (1..1300): ');  ReadLn(alumnoF.codigo);
        if alumnoF.codigo <> -1 then
        begin
            WriteLn('Dia de marzo (1..30) : ');  ReadLn(alumnoF.dia_mes);
            WriteLn('Facultad  (string): ');  ReadLn(alumnoF.Facultad);
            WriteLn('Cantidad de viajes: '); ReadLn(cant_viajes);
            while i < cant_viajes do
            begin
                WriteLn('Transporte  (1..5): ');  ReadLn(alumnoF.transporte);
                case alumnoF.transporte of
                    1:  begin
                            gasto_total:=gasto_total+1;
                        end;
                    2:  begin
                            gasto_total:=gasto_total+2;
                        end;
                    3:  begin
                            gasto_total:=gasto_total+3;
                        end;
                    4:  begin
                            gasto_total:=gasto_total+4;
                        end;
                    5:  begin
                            gasto_total:=gasto_total+5;
                        end;
                end;
                i:=i+1;  
            end;
            
        end;
        
    end;

//____________________________________________________
procedure armarLista(var Lf:Lista;Al:alumno);
var
    aux : Lista;
begin
    new(aux);
    aux^.Datos := Al;
    aux^.sig := Lf;
    Lf := aux;
end;
//____________________________________________________
procedure CargarLista (var L:Lista);
var
    alumF:alumno;
    gasto_total:integer;
    cant_viajes:integer;
    viajes_dia:integer;
    cant_gastan:integer;
begin

    gasto_total:=0;
    cant_viajes:=0;
    LeerAlumno(alumF,gasto_total,cant_viajes);
    while (alumF.codigo <> -1) do
    begin
        armarLista(L,alumF);
        LeerAlumno(alumF,gasto_total,cant_viajes);  
        if (cant_viajes>6)then
        begin
            viajes_dia:=viajes_dia+1;
        end;
        if (gasto_total>80)then
        begin
            cant_gastan:=cant_gastan+1;
        end;
    end;
end;

//____________________________________________________
procedure RecorrerLista (L:Lista);
begin
    while L <> nil do
    begin
        L:=L^.sig;
    end;
end;
//____________________________________________________
var
    L:Lista;
begin
    L:=nil;
    CargarLista(L); 
    RecorrerLista(L);
end.
