{El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}
program EJ13P6;
type 
	usuario = record 
		email: string;
		rol: 1..4;
		revista: string;
		cant_acceso: integer;
	end;
	
	lista = ^nodo;
	nodo = record 
		data: usuario;
		sig: lista;
	end;
	
	vector = array [1..4] of integer;

procedure leer(var r:usuario); // se dispone
begin 
	// leer datos del usuario
end; 

procedure armarlista(var L:lista; r:usuario);  // se dispone
begin 
	// cargar lista de usuarios
end;

procedure cargardatos(var L:lista); // se dispone
begin 
	// cargar datos llamando a leer y agregando a la lista
end; 	

procedure inivector(var v:vector);
var 
	i: integer;
begin 
	for i := 1 to 4 do 
		v[i] := 0; // inicializar el vector de contadores
end; 

procedure armarlista2(var pri: lista; r:usuario);
var 
	ant, nue, act: lista;
begin
	new (nue);
	nue^.data := r;
	act := pri;
	ant := pri;
	
	// Recorrer mientras no se encuentre la posición correcta
	while (act <> NIL) and (act^.data.cant_acceso < r.cant_acceso) do begin
		ant := act;
		act := act^.sig;
	end;
	
	// Insertar al principio o en el medio/final
	if (ant = act) then begin
		nue^.sig := pri; 
		pri := nue;   // Dato va al principio
	end else begin
		ant^.sig := nue; // Dato va entre otros dos o al final
		nue^.sig := act;
	end;
end;

procedure puntoC(r:usuario; var max1, max2: integer; var u1, u2: string);
begin 
	// Verificar y actualizar los usuarios que hace más tiempo no acceden
	if (r.cant_acceso > max1) then begin  
		max2 := max1;
		u2 := u1;
		max1 := r.cant_acceso;
		u1 := r.email;
	end
	else if (r.cant_acceso > max2) then begin 
		max2 := r.cant_acceso;
		u2 := r.email;
	end;
end;

procedure procesardatos(L:lista; var L2:lista);
var 
	max1, max2: integer; 
	u1, u2: string; 
	v: vector; 
	i: integer;
begin 
	max1 := -1; 
	max2 := -1; 
	u1 := ''; 
	u2 := '';
	inivector(v); // Inicializar el vector de roles
	
	// Procesar la lista original
	while (L <> nil) do begin 
		if (L^.data.revista = 'Económica') then 
			armarlista2(L2, L^.data); // Ordenar por días de acceso
		
		v[L^.data.rol] := v[L^.data.rol] + 1; // Contar usuarios por rol
		
		puntoC(L^.data, max1, max2, u1, u2); // Encontrar los usuarios con más días sin acceder
		
		L := L^.sig;
	end;
	
	// Imprimir usuarios de la revista Económica en orden ascendente
	writeln('Usuarios de la revista Económica:');
	while (L2 <> nil) do begin 
		writeln('Usuario: ', L2^.data.email, ', Días desde el último acceso: ', L2^.data.cant_acceso);
		L2 := L2^.sig;
	end;
	
	// Imprimir la cantidad de usuarios por rol
	writeln('Cantidad de usuarios por rol:');
	for i := 1 to 4 do 
		writeln('Rol ', i, ': ', v[i], ' usuarios');
	
	// Imprimir los emails de los dos usuarios que hace más tiempo no ingresan al portal
	writeln('Emails de los dos usuarios que hace más tiempo no ingresan: ', u1, ', ', u2);
end;
	
var 
	L, L2: lista;
begin 
	L := nil;
	L2 := nil;
	cargardatos(L); // Cargar datos en la lista L
	procesardatos(L, L2); // Procesar datos y realizar las tareas solicitadas
end.
