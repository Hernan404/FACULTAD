program EJ15P6;
type 
    alumnos = record 
        DNI:integer;
        apellidoYnombre:string;
        nota:integer;
    end;

    lista = ^nodo
    nodo = record 
        data:alumnos;
        sig:lista;
    end;

    vecLista = array [1..5] of lista;
    vecEqui = array [1..5] of integer;

procedure armarlista(var L:lista); //se dispone

procedure procesarDatos(L:lista);
var 
    vE:vecEqui;
    vL:vecLista;
begin
    for x:= 1 to 5 do begin 
        vE:= 0;
    end;
    
    while (L <> nil) do begin 
        if (L^.data.nota >= 8) then 
            if (vE[1] <= vE [4]) then begin 
                armarlista(vL[1],L^.data);
                vE[1]:= vE[1] +1;
            end
            else
                begin 
                    armarlista(vL[4],L^.dato);
                    vE[4]:= vE[4] +1;
                end; 

        if (L^.data.nota > 5) and (L^.data.nota < 8) then 
            if (vE[2] <= vE[3]) and (vE[2] <= vE[5]) then begin 
                armarlista(vlista[2],L^.dato);
                vE[2]:= vE[2] +1;
            end
            else 
                begin 
                    armarlista(vL[5],L^.dato);
                    vE[5]:= v[5] +1;
                end;
            end;
        L:= L^.sig;
    end;
end;

procedure imprimir (v:vlista);
var 
    i:integer;
begin 
    for i:= 1 to 5 do begin 
        writeln('Lista del turno',i,':');
        while (v[i] <> nil) do begin 
            writeln('DNI: ',v[i]^.data.DNI, 'nombre y apellido', v[i]^.dato.nombreYapellido);
            writeln();
            v[i]:= v[i]^.sig;
    
        end;
    end;



end;

var 
    a:alumnos;
    L1,L2,L3,L4,L5:lista;
begin 
    cargarlista(L,a);

    for i:=1 to 5 do  
        vlista[i]:= nil;
        procesarDatos(L,vlista);
    
    imprimir(vlista);
    
end.
---------------------------------------------------------
---------------------------------------------------------




La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota
obtenida. Escribir un programa que procese la información de alumnos disponible y los distribuya en
turnos utilizando los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.

program EJ15P6;
type 
	alumnos = record 
		DNI:Integer;
		apellido:string;
		nombre:string;
		nota:integer;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:alumnos;
		sig:lista;
	end;

procedure leer(var r:alumnos);
begin 
	with r do begin 
		writeln('DNI');
		readln(DNI);
		writeln('APELLIDO');
		readln(apellido);
		writeln('NOMBRE');
		readln(nombre);
		writeln('NOTA');
		readln(nota);
	end;
end;

procedure turnos(L:lista; r:alumnos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;
	
procedure cargardatos(L:lista);
var 
		r:alumnos;
begin 
	leer(r);
	while (r.DNI <> 0) do begin
		turnos(L,r);
		leer(r);
	end; 
end;

procedure puntoA(L1,L4:lista; r:alumnos; var cant1,cant4:integer);
begin 
		if (r.nota >= 8) then begin 
			if (cant1 < cant4) then begin 
				turnos(L1,r);
				cant1:= cant1 + 1
			end
			else 
				turnos(L4,r);
				cant4:= cant4 + 1;
		end;
end;

procedure puntoB(L2,L3,L5:lista; var cant2,cant3,cant5:integer; r:alumnos);
begin 
		if (r.nota > 5) and (r.nota < 8) then begin 
		
			if (cant2 < cant3) or (cant3 < cant5) then begin 
				turnos(L2,r);
				cant2:= cant2 + 1; 
			end
			else 
				turnos(L3,r);
				cant3:= cant3 + 1; 
				
			if (cant5 < cant3) or (cant5 < cant2) then begin 
				turnos(L2,r);
				cant5:= cant5 +1;
			end
			else 
				turnos(L3,r);
				cant3:= cant3 + 1; 
				
		end;		
end;

procedure imprimir (L1,L2,L3,L4,L5:lista; r:alumnos);
begin 
		
	writeln('== TURNO 1 ==');
	while (L1 <> nil) do begin 
			writeln(r.apellido);
	end;
	writeln('== TURNO 2 ==');
	while (L2 <> nil) do begin 
			writeln(r.apellido);
	end;
	writeln('== TURNO 3 ==');
	while (L3 <> nil) do begin 
			writeln(r.apellido);
	end;
	writeln('== TURNO 4 ==');
	while (L4 <> nil) do begin 
			writeln(r.apellido);
	end;
	writeln('== TURNO 5 ==');
	while (L5 <> nil) do begin 
			writeln(r.apellido);
	end;
	
	
end;

procedure procesardatos(L:lista);
var 
	L1, L2,L3,L4,L5:lista;
	cant1,cant2,cant3,cant4,cant5:integer;
begin 
	cant1:= 0;
	cant2:= 0;
	cant3:= 0;
	cant4:= 0;
	cant5:= 0;
	
	L1:= NIL; L2:= nil; L3:= NIL; L4:= NIL; L5:= NIL;
	
	while (L <> nil) do begin 
		puntoA(L1,L4,L^.data,cant1,cant4);
		puntoB(L2,L3,L5,cant2,cant3,cant5,L^.data);
	
	end;
		imprimir(L1,L2,L3,L4,L5,L^.data);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.

