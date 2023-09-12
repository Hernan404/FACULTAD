program ejemplo
type

ciudad = record 
    provincia: string;
    nombre:string;
    cantAct:integer;
    cantVis:integer;
end;

procedure leer(var c: tciudad);
begin
  With c do begin
    readln(prov);
    if (prov <> 'fin') then begin
    readln(nombre);
    readln(cantAct);
    readln(cantVis);
    end;
  end;
end; 

procedure actualizarMax(cantidad:integer; nombreAct:string; var max:integer; var nommax:string);
begin 
    {si cantidad actual es mayor que max pones la cantidad actual en max y
     el nombre actual en nombre maximo}
    if (cantAct > max) then begin 
        max:= cantAct;
        nommax:= nombreAct;
    end;

var 
    c:ciudad;
    max,cantidad:integer;
    nomMax,provActual:string;
begin 
    nomMax:= '';
    max:= -1;
    leer(c);
    while (c.provincia <> 'fin') do begin {mientras sea distinto de la condicion con la que tiene que terminar} 
        provActual:= c.provincia; {variable condicion en actual}
        cantidad:= 0; {se quiere contar la cantidad de visitantes por provincia asi que hacemos un contador}
        while (c.provincia = provActual) do begin {mientras la variable condicion actual sea igual a la variable condiccion ingresada} 
            cantidad:= cantidad + c.cantVis {contamos la cantidad de visitantes en la provincia actual}
            leer(c) {y listo ahora leemos los datos que siguen}
        end;
        actualizarMax();
    end;
    writeln('')
end;
