program EJ2P7;
type
    cliente = record 
    codigo:integer;
    DNI:integer;
    apellidoYnombre:string;
    codigoPoliza:1..6;
    montoBasico:real;
    end;

    lista = ^nodo; 
    nodo = record 
        datos:cliente;
        sig:lista;
    end;

    vector = array [1..6] of integer;

procedure leer (var d:cliente);
begin 
    with d do begin 
		writeln('codigo');
        readln(codigo);
        writeln('DNI');
        readln(DNI);
        writeln('apellido y nombre');
        readln(apellidoYnombre);
        writeln('codigo poliza');
        readln(codigoPoliza);
        writeln('monto basico');
        readln(montoBasico);
    end;
end;

procedure armarlista (L:lista; d:cliente);
var 
    aux:lista;
begin 
    new(aux);
    aux^.datos:= d;
    aux^.sig:= L;
    L:= aux;
end;

procedure inivector (var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 6 do begin 
        v[i]:= 0;
    end;
end; 

procedure cargarLista (var L:lista);
var 
	d:cliente;
begin 
    repeat  
        leer(d);
        armarlista(L,d);
        
    until (d.codigo = 1122);
end;

procedure puntoA (var d:cliente; var montoAD:real);
begin 
    writeln('Estos son sus datos');
    writeln('DNI: ', d.DNI);
    writeln('Apellido y nombre', d.apellidoYnombre);
    writeln('Monto completo que paga mensual: ', d.montoBasico + montoAD);
end;


function puntoB (DNI:integer): boolean;
  var
    cant: integer;
  begin
    puntoB:= false;
    cant:= 0;
    while (dni > 0) and not(puntoB) do
      begin
        if ((dni mod 10) = 9) then
          cant:= cant + 1;
        if (cant = 2) then
          puntoB:= true
        else
          dni:= dni div 10;
      end;
      puntoB:= (cant >=2);
     
  end;

procedure eliminar (var pri:lista; d:cliente; var exito:boolean);
var 
    ant,act:lista;
begin 
    exito:= false;
    act:= pri;

    while (act <> nil) and (pri^.datos.codigo <> d.codigo) do begin 
        ant:= act;
        act:= act^.sig;
    end;

    if (act <> nil) then begin 
        exito := true;
        if (act = pri) then 
            pri:= act^.sig
        else 
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesarDatos (L:lista);
var 
	exito:boolean;
	d:cliente;
    v:vector;
    montoAD:real;
    dnidel:integer;
    cumpleB:string;
begin 
	montoAD:= 0;
	cumpleB:= '';
    inivector(v);
    while (L <> nil) do begin
        puntoA(d,montoAD);
        
        if puntoB(L^.datos.DNI) then 
			writeln(L^.datos.apellidoYnombre);
	L:= L^.sig;
    end;

     writeln('nombre de los que tienen al menos 2 digitos 9', cumpleB);
   
    writeln('ingrese dni a borrar');
    readln(dnidel);
    if (dnidel <> 0) then begin 
        eliminar(L,d,exito);
    end;
   
end;

var 
    L:lista;
begin 
    cargarLista(L);
    procesarDatos(L);
end.
