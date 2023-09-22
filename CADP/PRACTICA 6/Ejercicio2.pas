program ejercicio2;
type
    lista = ^nodo; // 1 error
        persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    nodo = record
        dato: persona;
        sig: lista;
    end;
procedure leerPersona(p: persona); // 5 error
begin
        read(p.dni);
        if (p.dni <> 0)then begin // 4 error
            read(p.nombre);
            read(p.apellido);
        end;
end;

procedure agregarAdelante(l:lista;p:persona); // 8 error
var
    aux: lista;
begin
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;


{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista); //6 error
var
    p:nodo; // 9 error
begin
    leerPersona(p); // 2 error 
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
    end;
end;

procedure imprimirInformacion(var l:lista); //7 error
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); // 3 error
        l:= l^.sig;
    end;
end;

{Programa principal}
var
    l:lista;
begin
    generarLista(l);
    imprimirInformacion(l);
end.
