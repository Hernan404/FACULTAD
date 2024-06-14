{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado}

program EJ4P4P2;
const 
    dimf = 1000;
type 
    alumno = record 
        numero:integer;
        asistencia:integer;
        nombre:string;
	apellido:string;
    end;

    vector = array [1..dimf] of alumno;

procedure cargardatos(var v:vector; var diml:integer);
var 
	num:integer;
begin 
	num:= 100;

	while (diml < dimf) and (num < 1000) do begin 
		diml:= diml +1;
		num:= num + 1;
		
		v[diml].num:= num;
		v[diml].apellido:= apellido;
		v[diml].nombre:= nombre;
		v[diml].asistencia:= asistencia;

		num:= num +1; 
	end;
end;

function puntoF (v:vector; diml,num:integer):integer;
var 
    i:integer;
begin 
    i:= 1;
    while (num <> v[i].num) and (i <= diml) do 
        i:= i +1;
    if (i <= diml) then 
        puntoF:= i;
end;

procedure puntoA(v:vector; diml:integer);
var 
    num:integer;
begin 
    readln(num);
    writeln('numero de alumno', num, 'se encuentra en posicion ' puntoF(v,diml,num));
end;

procedure puntoB(var v:vector; var diml:integer);
var 
    i:integer;
    r:alumno;
begin 
    with r do begin 
        readln(r.num);
        readln(r.apellido);
        readln(r.nombre);
        readln(r.asistencia);
    end;
    if (diml < dimf) then begin 
        i:= diml;
        while (r.num < v[i].num) do begin
            v[i + 1]:= v[i];
            i:= i - 1;
        end;
        v[i + 1]:= r;
    end;
    diml:= diml +1;
end;

procedure incisoC(var v:vector; var diml:integer);
var 
    i,posicion:integer;
begin 
    readln(posicion);
    if (posicion > 0) then 
        if (posicion < diml) then 
            for i:=posicion to diml -1 do 
                v[i]:= v[i + 1];
        diml:= diml -1;
end; 

procedure puntoD (var v:vector; var diml:integer);
var 
    i,x,reset:integer;
begin 
    reset:= 0;
    i:= 1;
    while (i < diml) do begin 
        if (v[i].asistencia = 0) then begin 
            x:= i;
            while (x < diml) do begin 
                v[x]:= v[x -1];
                x:= x +1;
            end;
            reset:= reset +1;
        end
        else 
            i:= i +1;
    end;
    diml:= diml - reset; 
end;

var 
    v:vector;
    diml:integer;
begin 
    diml:= 0;
    cargardatos(v,diml);
    puntoA(v,diml);
    puntoB(v,diml);
    puntoC(v,diml);
    puntoD(v,diml);
end.
