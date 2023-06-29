La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial. Para ello, la cátedra DISPONE de un listado con todos alumnos que ingresaron este año a la facultad. De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y si estuvo presente o ausente en cada una de las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de datos que contenga sólo aquellos alumnos que podrán rendir el parcial. Para poder rendir el parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.

b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla:

1. Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso

2. Turno con mayor cantidad de alumnos en condiciones de rendir el examen.

3. Cantidad de alumnos que no posean ningún dígito cero en su DNI.

NOTA: Implementar el programa principal

program REPASOPARCIAL; 
type 
    alumnos = record 
        DNI:integer;
        nombreYapellido:string;
        nota:1..4;
        turno: 1..4;
        presente: 1..12;
    
    lista = ^nodo
    nodo = record 
        datos:alumnos;
    end;

    vector = array [4..10] of integer;
    vpresente = array [1..12] of integer;

procedure inivector(v:vector; vp:vpresente);
var 
    i:integer;
begin 
    for i:=1 to 4 do begin 
        v[i]:= 0;
    end;
    for i:=1 to 12 do begin 
        vp[i] := 0;
    end;
end;

procedure cargarLista (L:lista; d:alumnos);
begin 
    leer(d);
    while (d.DNI <> 0) do begin 
        leer(d);
        armarnodo(d,L);
    end;

end;

procedure listaAlumnos (L:lista; d:alumnos);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= sig;
end;

procedure cargarvector (v,vc:integer;);
var 
    i:integer;
begin 
    for i:=1 to 4 do begin 
        v[i]:= d.nota;
        vc[i]:= d.turno;
    end;

    if (d.presente = 'presente') then begin 
        for i:=1 to 12 do 
        vp[i]:= v[i] +1;

end;

procedure puntoA(vp:vpresente; L:lista; d:alumnos);
var 
    i:integer;
begin 
    for i:=1 to 12 do begin 
        if (vp[i] > 8) then 
            listaAlumnos (L,d); 
    end;
end;

procedure puntoB(var L:lista);
begin 
    while (L <> nil) do begin 
        writeln(L^.datos);
        L:= L^.sig;
    end;
end;

procedure punto1 (d:alumnos; var nombre_cumple1:integer; var dni_cumple:integer;);
begin 
    if (d.nota >= 8) then begin 
        nombre_cumple1:= d.nombreYapellido;
        dni_cumple:= d.DNI;
    end;
end;

procedure punto2 (vc:vector; v:vector; L:lista; cumple2:integer);
begin 
    for i:=1 to 4 do begin 
        if (v[i] = L^.datos.turno)
            vc[i]:= v[i] +1;
    end;

    if (vc[i] > max) then begin 
        max:= v[i];
        cumple2:= v[i]
    end;
end;

procedure punto3 (var cumple3:integer; d:alumnos);
var 
    digitos:integer;
begin 
    digitos:= d.DNI mod 10 
    if (digitos = 0) then
        cumple3:= cumple3 +1; 
        
    d.DNI:= d.DNI div 10;
end;

procedure procesarDatos (L:lista);
var 
    d:alumnos;
    v:vector;
    vc:vector;
    L:lista;

    max:integer;
    nombre_cumple1:string;
    dni_cumple:integer;

    cumple2:integer;
    cumple3:integer;
begin 
    cumple2:= 0;
    cumple3:= 0;
    max:= -1;
    inivector(v);
    while (L <> nil) do begin 
    cantAlumnos:= cantAlumnos +1;
    
    puntoA(vp,L,d);
    puntoB(L);

    L:=L^.sig;
    punto1(d,nombre_cumple1,dni_cumple);
    punto2(vc,v,L,cumple2);
    punto3(cumple3,d);
    end;
    
    writeln('punto 1 ', nombre_cumple1 , dni_cumple)
    writeln('punto 2 ', cumple2);
    writeln('punto 3 ', cumple3);
end;

var 
    L:lista;
begin 
    L:= nil;
    cargarLista();
    procesarDatos();
end;
