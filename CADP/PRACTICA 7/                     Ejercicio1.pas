{Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal}


program EJ1P7;
const 
    generos = 5;
type 
    rango_generos = 1..5;
    casting = record 
        DNI:integer;
        apellidoYnombre:string;
        edad:integer;
        codigo:rango_generos;
    end;

    lista = ^nodo;
    nodo = record 
        data:casting;
        sig:lista;
    end;

    vector = array [rango_generos] of integer;

procedure armarlista (var L:lista; c:casting);
var 
    aux:lista;
begin 
    new(aux);
    aux^.data:= c;
    aux^.sig:= L;
    L:= aux;
end;

procedure inivector (var v:vector);
var 
    i:rango_generos;
begin 
    for i:= 1 to 5 do begin 
        v[i]:= 0;
    end;
end;

procedure leer(var c:casting);
begin 
    with c do begin
        readln(DNI);
        readln(apellidoYnombre);
        readln(edad);
        readln(codigo);
    end; 
end;

procedure cargardatos(L:lista);
var 
	c:casting;
begin 
    leer(c);
     repeat
        armarlista(L,c);
        leer(c);
     until (c.DNI <> 33555444); 
end;

function puntoA (num:integer):boolean;
var 
    par,impar:integer;
begin
	par:= 0;
	impar:= 0;
	while (num mod 10 > 0) do begin 
			
		if (num mod 2 = 0) then   
			par:= par +1
		else  
			impar:= impar +1;

		num:= num div 10;
	end;
	puntoA:= (par > impar);
	
end;

procedure eliminar (var pri:lista; var c:casting; var exito:boolean);
var 
    dni:integer;
    ant,act:lista;
begin 
    
    exito:= false;
    act:= pri;

    writeln(' INGRESE DNI A ELIMINAR');
    readln(dni);
    
    while (act <> nil) and (act^.data.DNI <> dni) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (act <> nil) then begin 
        exito:= true;
        if(act = pri) then 
            pri:= act^.sig
        else 
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

procedure puntoB (v:vector ;var max1,max2,p1,p2:integer);
var 
    i:rango_generos;
begin  
    for i:= 1 to generos do begin
        if (v[i] > max1) then begin
            max2:= max1;
            p2:= p1;
            max1:= v[i];
            p1:= i;
        end 
        else begin 
            if (v[i] > max2) then 
                max2:= v[i];
                p2:= i;
        end;
    end;
end;

procedure procesarDatos(L:lista);
var 
	v:vector;
	c:casting;
    max1,max2,p1,p2,cantA:integer;
    exito:boolean;
begin 
	max1:= -1;
    max2:= -1;
    p1:= 0;
    p2:= 0;
    
    inivector(v);
    cantA:= 0;
    while (L <> nil) do begin 

        if (puntoA(L^.data.DNI)) then 
            cantA:= cantA +1;

        puntoB(v,max1,max2,p1,p2);

	L:= L^.sig;
    end;
    writeln('cantidad de personas con DNI pares: ', cantA);
    writeln('los dos codigos de genero: ', p1,p2);
    eliminar(L,c,exito);
end;

var 
    L:lista;
begin 
    L:= NIL;
    cargardatos(L);
    procesarDatos(L);
end.
