una tienda virtual necesita un programa para administrar la informacion de sus clientes. de cada cliente se lee 
numero, DNI, apellido y nombre, fecha de nacimiento (dia,mes y año)
nivel (1..5) y puntaje. la lectura finaliza cuando se lee el cliente con DNI 44555  

A) generar una estructura que contenga numero, apellido y nombre con los clientes cuyos DNI 
estan compuestos unicamente por digitos pares 

B) informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000

c) implementar un modulo que elimine, de la estructura generada, la informacion relacionada a un numero
de cliente recibido por parametro. tener en cuenta que dicho numero puede no existir en la estructura


program PARCIAL;

type 
    nacimiento = record 
        dia: 1..31;
        mes: 1..12;
        anio: 1900..2024;
    end;
     
    cliente = record 
        numero: integer;
        dni: integer;
        apeynom: string;
        fecha: nacimiento;   
        nivel: 1..5;
        puntaje: real;
    end;

    clienteA = record 
        numeroA: integer;
        apeynomA: string;
        fechaA: nacimiento;
        nivelA: 1..5;
    end;

    lista = ^nodo;
    nodo = record 
        data: cliente;
        sig: lista;
    end;

    listaA = ^nodoA;
    nodoA = record 
        data: clienteA;
        sig: listaA;
    end;

    vector = array [1..5] of real;

procedure leer(var r: cliente);
begin 
    with r do begin
		writeln('dni');
        readln(dni);
        writeln('apeynom');
        readln(apeynom);
        writeln('dia');
        readln(fecha.dia);
		writeln('mes');
        readln(fecha.mes);
        writeln('anio');
        readln(fecha.anio);
        writeln('nivel');
        readln(nivel);
        writeln('puntaje');
        readln(puntaje);
    end;
end;

procedure inivector(var v: vector);
var 
    i: integer;
begin 
    for i := 1 to 5 do begin 
        v[i] := 0;
    
    end;
end;

procedure armarlista(var L: lista; r: cliente);
var 
    aux: lista;
begin 
    new(aux);
    aux^.data := r;
    aux^.sig := L;
    L := aux;
end;

procedure armarlista2(var L2: listaA; rA: clienteA);
var 
    aux: listaA;
begin 
    new(aux);
    aux^.data := rA;
    aux^.sig := L2;
    L2 := aux;
end;

function cumpleA(DNI: integer): boolean;
var 
    digito: integer;
begin 
    while (DNI > 0) do begin 
        digito := DNI mod 10;
        if (digito mod 2 <> 0) then begin  
            cumpleA := false;
            exit;  { Sale del bucle si encuentra un dígito impar }
        end;
        DNI := DNI div 10;
    end;
    cumpleA := true;
end;

procedure puntoB(var v: vector; var min, max: real; var p1, p2: real);
var 
    i: integer;
begin 
    for i := 1 to 5 do begin 
        if (v[i] > max) then begin 
            max := v[i];
            p1 := i;
        end;

        if (v[i] < min) then begin 
            min := v[i];
            p2 := i;
        end;
    end;
end;

procedure puntoC(var pri: listaA; num: integer; var exito: boolean);
var 
    ant, act: listaA;
begin 
    exito := false;
    act := pri;

    while (act <> nil) and (act^.data.numeroA <> num) do begin
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

procedure procesardatos(L: lista);
var 
    
    v: vector;
    rA: clienteA;
    min, max, p1, p2: real;
    L2: listaA;
    exito: boolean;
    num: integer;
begin 
    min := 9999;
    max := -1;
    num := 0;
    inivector(v);

    while (L <> nil) do begin 
        if (cumpleA(L^.data.dni)) then begin 
            rA.numeroA := L^.data.numero;
            rA.apeynomA := L^.data.apeynom;
            armarlista2(L2, rA);
        end;

        if (L^.data.fecha.anio < 2000) then begin 
            v[L^.data.nivel] := L^.data.puntaje + v[L^.data.nivel];
            puntoB(v, min, max, p1, p2);
        end;
    
        L := L^.sig;
    end;

    writeln('Nivel con mayor puntaje y menor: ', p1, p2);

    writeln('Ingrese número de cliente a eliminar: ');
    readln(num);
    puntoC(L2, num, exito);
end;

procedure cargardatos(var L: lista);
var 
    r: cliente;
begin 
    repeat 
        leer(r);
        armarlista(L, r);
    until (r.dni = 355);
end;

var 
    L: lista;
begin 
    L := nil;
    cargardatos(L);
    procesardatos(L);
end.
