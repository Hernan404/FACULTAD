
program EJ1P7;
type 
    casting = record 
        DNI:integer;
        apellidoYnombre:string;
        edad:integer;
        codigo:1..5;
    end;

    lista = ^nodo;
    nodo = record 
        data:casting;
        sig:lista;
    end;

    vector = array [1..5] of integer;

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
    i:integer;
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
        leer(c);
        armarlista(L,c);
     until (c.DNI <> 33555444); 
end;

function puntoA (num:integer):boolean;
var 
    digito,par,impar:integer;
begin
	par:= 0;
	impar:= 0;
	digito:= num mod 10;
	while (digito > 0) do begin 
			
		if (digito mod 2 = 0) then begin  
			par:= par +1;
		end
		else begin 
			impar:= impar +1;
		end;

		num:= digito div 10;
		
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
    i:integer;
begin  
    

    for i:= 1 to 5 do begin
        if (v[i] > max1) then begin
            max2:= max1;
            p2:= p1;
            max1:= i;
            p1:= v[i];

        end 
        else begin 
            if (v[i] > max2) then 
                max2:= i;
                p2:= v[i];
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
        if puntoA(L^.data.DNI) then 
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
