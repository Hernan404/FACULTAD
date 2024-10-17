{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso y las
notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el alumno
con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a cada alumno
deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente
por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se
recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la
estructura generada en el inciso 1. El alumno puede no existir}

program EJ7P7;
const 
    materias = 24;
type 
	rango_materias = 1..24;
	
	vnotas = array [rango_materias] of real;

	
    alumno = record 
        numero:integer;
        apellido:string;
        nombre:string;
        mail:string;
        ingreso:integer;
        egreso:integer;
        notas:vnotas;
    end;

    lista = ^nodo;
    nodo = record 
        data:alumno;
        sig:lista;
    end;

    vector = array [rango_materias] of integer;
 
 
 procedure leer(var r:alumno);
 var 
	i,x:integer; diml:integer; nota:real;
 begin 
	with r do begin 
	
		for x:= 1 to materias do 
			notas[x]:= 0;  //donde guardo las notas ordenadas
			
		if (numero <> -1) then begin 
			readln(numero);
			readln(apellido);
			readln(nombre);
			readln(mail);
			readln(ingreso);
			readln(egreso);
			for i:=1 to materias do begin
				readln(nota);
				diml:= 1;
				while (notas[diml] > nota) do  //Se busca la posición adecuada para la nueva nota en el arreglo notas. Esto se hace comparando la nueva nota con las notas existentes en el arreglo notas, avanzando diml hasta encontrar la posición correcta (donde notas[diml] sea menor o igual que la nueva nota
						diml:= diml +1;
				
				for x:= materias downto diml do 
					notas[i]:= notas[i - 1]; // // Una vez encontrada la posición correcta, se realiza un desplazamiento hacia la derecha de las notas existentes en el arreglo notas para hacer espacio para la nueva nota. Este desplazamiento se realiza desde el final del arreglo hasta la posición diml.
				notas[diml]:= nota;    //Finalmente, se inserta la nueva nota en la posición diml del arreglo notas.

			end;
		end;
	end;
end;


procedure armarlista (var L:Lista; r:alumno);
var
 nue: Lista;
begin
    New(nue);
    nue^.data:= r;
    nue^.sig:= L;
    L:= nue;  
end;
 
 procedure inivector(var v:vector);
 var 
	i:rango_materias;
begin 
	for i:=1 to materias do v[i]:= 0;
end;

procedure cargardatos(var L:lista);
var 
	r:alumno;
begin 
	leer(r);
	while (r.numero <> -1) do begin 
		armarlista(L,r);
		leer(r);
	end;
end;

function cumpleimpar(numero:integer):boolean;
var 
	impar:boolean;
begin 
	impar:= false;
	while (numero > 0) do begin 
		if (((numero mod 10) mod 2) = 1) then 
			impar:= true;
			
		numero:= numero div 10;
	end;
	cumpleimpar:= (impar)
end;

function cumpleB(r:alumno):boolean;
begin 
	cumpleB:= (r.ingreso = 2012) and (cumpleimpar(r.numero));
end;

procedure puntoC (r:alumno; min1,min2:integer; a1,a2,d1,d2,n1,n2:string);
var 
	resta:integer;
begin
	resta:= r.egreso - r.ingreso;
	if (resta < min1) then begin 
		min2:= min1;
		a2:= a1;
		d2:= d1;
		n2:= n1;
		min1:= resta;
		a1:= r.apellido;
		d1:= r.mail;
		n1:= r.nombre
	end
	else if (min1 > min2) then begin 
			min2:= resta;
			a2:= r.apellido;
			n2:= r.nombre;
			d2:= r.mail;
	end;
end;

procedure eliminar (var pri:lista; var r:alumno; var exito: boolean);
var
	ant, act: lista; num:integer;
begin 
	writeln('NUMERO A ELIMINAR'); readln(num);
	readln(r.numero);
    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.data.numero <> num) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
            pri := act^.sig
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;





procedure procesardatos(L:lista);
var 
	v:vector; cantB,i:integer; min1,min2:integer;
	a1,a2:string; d1,d2:string; n1,n2:string;
	exito:boolean;
	r:alumno; promedio_notas:real;
begin 
	a1:= ''; a2:= ''; d1:= ''; d2:= ''; n1:= ''; n2:= ''; min1:= 999; min2:= 999;
	cantB:= 0; 
	
	inivector(v);
	while (L <> nil) do begin 
		
		promedio_notas:= 0;
		for i:=1 to materias do 
			promedio_notas:= L^.data.notas[i] + promedio_notas;
			
		if (cumpleB(L^.data)) then 
			cantB:= cantB +1;
			
		puntoC(L^.data,min1,min2,a1,a2,d1,d2,n1,n2);
			
		writeln('El promedio de notas obtenido por cada alumno.', (promedio_notas/materias):2:0);
	
	L:=L^.sig;
	end;
	writeln('cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares ', cantB);
	writeln('El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se recibieron ', a1,a2,d1,d2,n1,n2);
	eliminar(L,r,exito);
end;
 
var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.

