{implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}


program EJ2P7;
type 
    poliza = 1..6;
    cliente = record 
        codigo: integer;
        DNI: integer;
        apellido: string;
        nombre: string;
        cod_poliza: poliza;
        monto: real;
    end;

    lista = ^nodo; 
    nodo = record
        data: cliente;
        sig: lista;
    end;

    vector = array [poliza] of real;

procedure inivector(var v: vector);
begin 
    // Aquí se inicializa el vector con los valores adicionales por cada póliza
    v[1] := 50.0; // Ejemplo de valores, cambiar por los reales
    v[2] := 75.0;
    v[3] := 100.0;
    v[4] := 125.0;
    v[5] := 150.0;
    v[6] := 175.0;
end;

procedure leer(var r: cliente);
begin 
    with r do begin 
        writeln('Ingrese el código de cliente:');
        readln(codigo);
        writeln('Ingrese el DNI:');
        readln(DNI);
        writeln('Ingrese el apellido:');
        readln(apellido);
        writeln('Ingrese el nombre:');
        readln(nombre);
        writeln('Ingrese el código de póliza (1..6):');
        readln(cod_poliza);
        writeln('Ingrese el monto básico que abona mensualmente:');
        readln(monto);
    end;
end;

procedure armarnodo(var L: lista; r: cliente);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

procedure cargardatos(var L: lista);
var 
    r: cliente;
begin 
    leer(r);
    while (r.codigo <> 1122) do begin 
        armarnodo(L, r);
        leer(r);
    end;
    armarnodo(L, r); // Procesa el cliente con código 1122
end;

function cumpleB(dni: integer): boolean;
var 
    dig9: integer;
begin 
    dig9 := 0;
    while (dni > 0) do begin 
        if (dni mod 10 = 9) then 
            dig9 := dig9 + 1;
        dni := dni div 10;
    end;
    cumpleB := (dig9 >= 2);
end;

procedure eliminar(var pri: lista; var exito: boolean);
var 
    ant, act: lista;
    cod: integer;
begin 
    exito := false;
    writeln('Ingrese código a eliminar:');
    readln(cod);
    act := pri;
    ant := nil; // Inicializar ant

    while (act <> nil) and (act^.data.codigo <> cod) do begin
        ant := act;
        act := act^.sig;
    end;   

    if (act <> nil) then begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;

procedure procesardatos(var L: lista);
var 
    v: vector; montoAD: real; exito: boolean;
begin 
    inivector(v);
    while (L <> nil) do begin 
        montoAD := L^.data.monto + v[L^.data.cod_poliza];

        writeln('Nombre: ', L^.data.nombre, ' Apellido: ', L^.data.apellido, ' DNI: ', L^.data.DNI, ' Monto Completo: ', montoAD:0:2);

        if cumpleB(L^.data.DNI) then 
            writeln('Cliente con dos dígitos 9 en el DNI - Apellido: ', L^.data.apellido, ' Nombre: ', L^.data.nombre);
        
        L := L^.sig;
    end;

    eliminar(L, exito);
    if exito then
        writeln('Cliente eliminado correctamente.')
    else
        writeln('El código ingresado no corresponde a ningún cliente.');
end;

var 
    L: lista;
begin 
    L := nil;
    cargardatos(L);
    procesardatos(L);
end.

