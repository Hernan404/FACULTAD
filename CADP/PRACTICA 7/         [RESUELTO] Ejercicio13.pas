{La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon
cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia,
Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces
que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la editorial
“Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con más
de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial y el
título de cada libro con más de 250 ventas.}

program EJ13P7;
const 
  areas = 35;  // Cantidad de áreas temáticas
type 
  rango_areas = 1..35;
  
  // Registro que representa los datos de un libro
  libro = record 
    titulo: string;
    nombre: string;  // Nombre de la editorial
    cant_paginas: integer;
    anio: integer;
    cant_ventas: integer;
    codigo: rango_areas;  // Código del área temática
  end;
  
  // Lista enlazada para almacenar libros
  lista = ^nodo;
  nodo = record 
    data: libro;
    sig: lista;
  end;
  
  vector = array [rango_areas] of string;  // Vector para guardar nombres de áreas temáticas

// Procedimiento para inicializar nombres de áreas temáticas
procedure cargarAreas(var v: vector);
begin
  v[1] := 'Arte y Cultura';
  v[2] := 'Historia';
  v[3] := 'Literatura';
  // Completar con el resto de áreas temáticas
end;

procedure leer(var r: libro);
begin 
  // Leer la información de un libro
  with r do begin 
    writeln('Ingrese el título del libro:');
    readln(titulo);
    writeln('Ingrese el nombre de la editorial:');
    readln(nombre);
    writeln('Ingrese la cantidad de páginas:');
    readln(cant_paginas);
    writeln('Ingrese el año de edición:');
    readln(anio);
    writeln('Ingrese la cantidad de ventas:');
    readln(cant_ventas);
    writeln('Ingrese el código del área temática (1..35):');
    readln(codigo);
  end;
end;

procedure armarlista(var L: lista; r: libro);
var
  nuevo: lista;
begin
  new(nuevo);           // Crear un nuevo nodo
  nuevo^.data := r;     // Asignar los datos del libro al nodo
  nuevo^.sig := L;      // Insertar el nodo al inicio de la lista
  L := nuevo;           // Actualizar la lista
end;

procedure cargardatos(var L: lista); 
var 
  r: libro;
begin 
  repeat
    leer(r);  // Leer los datos del libro
    armarlista(L, r);  // Agregar el libro a la lista
  until LowerCase(r.titulo) = 'relato de un náufrago';  // Condición de finalización con case insensitive
end;

procedure procesarLibrosEditorial(L: lista; v: vector);
var 
  cant_editados, total, anio_antiguo: integer;
begin 
  cant_editados := 0;
  total := 0;
  anio_antiguo := 9999;  // Inicializamos con un año grande para encontrar el más antiguo
  
  // Recorremos la lista de libros
  while (L <> nil) do begin 
    // Si el libro pertenece a la editorial "Planeta Libros"
    if (L^.data.nombre = 'Planeta Libros') then begin
      // Encontrar el libro más antiguo
      if (L^.data.anio < anio_antiguo) then
        anio_antiguo := L^.data.anio;
      
      // Contar la cantidad de libros editados
      cant_editados := cant_editados + 1;
      
      // Acumular las ventas
      total := total + L^.data.cant_ventas;
      
      // Mostrar detalle de libros con más de 250 ventas
      if (L^.data.cant_ventas > 250) then begin
        writeln('Título: ', L^.data.titulo, ', Área temática: ', v[L^.data.codigo], ', Páginas: ', L^.data.cant_paginas);
      end;
    end;
    
    L := L^.sig;  // Avanzar al siguiente libro en la lista
  end;
  
  // Mostrar resultados finales
  writeln('Editorial: Planeta Libros');
  writeln('Año del libro más antiguo: ', anio_antiguo);
  writeln('Cantidad de libros editados: ', cant_editados);
  writeln('Total de ventas de todos los libros: ', total);
end;

// Procedimiento que imprime el nombre de la editorial y el título de cada libro con más de 250 ventas
procedure imprimirLibrosMasDe250Ventas(L: lista);
begin
  writeln('Libros con más de 250 ventas:');
  
  // Recorremos la lista de libros
  while (L <> nil) do begin
    // Si el libro tiene más de 250 ventas
    if (L^.data.cant_ventas > 250) then
      writeln('Editorial: ', L^.data.nombre, ', Título: ', L^.data.titulo);
    
    L := L^.sig;  // Avanzar al siguiente libro en la lista
  end;
end;

var 
  L: lista;
  v: vector;
begin 
  L := nil;  // Inicializar la lista vacía
  cargarAreas(v);  // Cargar nombres de áreas temáticas
  cargardatos(L);  // Cargar los datos de los libros
  procesarLibrosEditorial(L, v);  // Procesar los datos para la editorial "Planeta Libros"
  imprimirLibrosMasDe250Ventas(L);  // Imprimir libros con más de 250 ventas
end.
