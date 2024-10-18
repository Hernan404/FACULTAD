{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector}

program EJ4P4;
const 
    dimf = 100;
type 
    vector = array [1..dimf] of integer;

procedure posicion(x: integer; v: vector; var pos: integer);
var 
    i: integer;
begin 
    pos := -1;
    for i := 1 to dimf do 
    begin 
        if (v[i] = x) then 
        begin
            pos := i;
            exit; // Sale del bucle una vez encontrado
        end;
    end;
end;

procedure intercambio(x, y: integer; var v: vector);
var 
    aux: integer;
begin
    aux := v[x];
    v[x] := v[y];
    v[y] := aux;
end;

procedure sumavector(v: vector; var suma: integer);
var 
    i: integer;
begin 
    suma := 0; // Inicializa la suma en 0
    for i := 1 to dimf do 
    begin 
        suma := suma + v[i];
    end;
end;

procedure promedio(v: vector; var prom: real);
var 
    i, total: integer;
begin 
    total := 0; // Inicializa el total en 0
    for i := 1 to dimf do 
    begin 
        total := total + v[i];
    end;
    prom := total / dimf;
end;

procedure elementomaximo(v: vector; var posMAX: integer);
var 
    i, max: integer;
begin 
    max := v[1]; // Inicializa max con el primer elemento del vector
    posMAX := 1;
    for i := 2 to dimf do 
    begin 
        if (v[i] > max) then 
        begin 
            max := v[i];
            posMAX := i;
        end;
    end;
end;

procedure elementominimo(v: vector; var posMIN: integer);
var 
    i, min: integer; 
begin 
    min := v[1]; // Inicializa min con el primer elemento del vector
    posMIN := 1;
    for i := 2 to dimf do 
    begin 
        if (v[i] < min) then 
        begin 
            min := v[i];
            posMIN := i;
        end;
    end;
end;

var 
    v: vector; 
    posMIN, posMAX, x, y, pos, suma: integer; 
    prom: real;
begin 
    // Inicializa el vector v con valores aquí si es necesario
    
    x := 5; // Ejemplo de valor para buscar
    y := 10; // Ejemplo de valor para intercambio
    
    posicion(x, v, pos);
    intercambio(2, 5, v);
    sumavector(v, suma);
    promedio(v, prom);
    elementomaximo(v, posMAX);
    elementominimo(v, posMIN);
end.

