

{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen

Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
el número de cuenta destino posea menos dígitos pares que impares}



program EJ8P7;
const 
	motivos = 7;
type 
	rango_motivos = 1..7;
	
	fechas = record 
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;
	
	trans = record
		numero_origen:integer;
		dni_origen:integer;
		numero_destino:integer;
		dni_destino:integer;
		fecha:fechas;
		hora:real;
		monto:real;
		motivo:rango_motivos;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:trans;
		sig:lista;
	end;
	
	vector = array [rango_motivos] of integer;
	
procedure leer(var r:trans);
begin 
	with r do begin 
		readln(numero_origen);
		readln(dni_origen);
		readln(numero_destino);
		readln(dni_destino);
		readln(fecha.dia);
		readln(fecha.mes);
		readln(fecha.anio);
		readln(hora);
		readln(monto);
		readln(motivo);
	end;
end;

procedure inivector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to motivos do v[i]:= 0;
end;

Procedure armarlista (var L:lista; r:trans);
Var 
    nue:Lista;
Begin  
    New(nue);  
    nue^.data :=r;  
    nue^.sig:=L;  
    L:=nue;
End;

Procedure armarlista2 ( var pri: lista; var t:trans);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.data := t;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.numero_origen < t.numero_origen) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;


procedure cargardatos (var L:lista);
var 
	r:trans;
begin 
	leer(r);
	while (r.numero_origen <> -1) do begin 
		armarlista(L,r);
		leer(r);
	L:= L^.sig;
	end;
end;
	
procedure cargarterceros(var L2:lista; L:lista);
begin 
	if (L^.data.dni_origen <> L^.data.dni_destino) then 
		armarlista2(L2,L^.data);
end;

procedure puntoB (v:vector; var max,p1:integer);
var 
	i:integer;
begin 
	for i:=1 to motivos do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			p1:= i
		end;
	end;
end;

function pares(num:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0; impar:= 0;
	while (num > 0) do begin 
		if (((num mod 10) mod 2) = 0) then 
			par:= par +1
		else 
			impar:= impar +1;
		num:= num div 10;
	end;
	pares:= (par < impar);
end;

function cumpleD(t:trans):boolean;
begin 
	cumpleD:= (t.fecha.mes = 6) and (pares(t.numero_destino));
end;

procedure procesardatos(L2:lista);
var 
	v:vector; montoTotal:real; max,p1:integer; cantD:integer;
	numeroACT:integer;
begin 
	max:= -1; p1:= 0; cantD:= 0;
	inivector(v);
	while (L2 <> nil) do begin 
		numeroACT:= L2^.data.numero_origen;
		montoTotal:= 0;
		while (L2 <> NIL) and (L2^.data.numero_origen = numeroACT) do begin 
			
			montoTotal:= L2^.data.monto + montoTotal;
			
			v[L2^.data.motivo]:= v[L2^.data.motivo] +1;
			
			if (cumpleD(L2^.data)) then 
				cantD:= cantD +1;
			
		L2:= L2^.sig;
		end;
		writeln('cuenta de origen el monto total transferido a terceros. ', montoTotal);
	end;
		puntoB(v,max,p1);

		writeln('código de motivo que más transferencias a terceros tuvo. ', p1);
		writeln('la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares. ', cantD);
end;
	
	
var 
	L,L2:lista;
begin 
	L:= nil;
	L2:= Nil;
	cargardatos(L);
	cargarterceros(L,L2);
	procesardatos(L2);
end.

