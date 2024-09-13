    
    
program ej1 
const 
	dimf = 100;

type 
	vector = array [1..dimf] of real 
	

procedure cargarvector(var v:vector);
var 
	i:integer;
	precio:real;
begin 
		for i:=1 to dimf do begin 
			read(precio);
			v[i]:= precio;
		end; 
end;

procedure modificarprecio(var v:vector; aumento:real);
var 
	i:integer; monto_aumento:real;
begin 
	for i:=1 to dimf do begin 
		monto_aumentado:= v[i] * aumento/100;
		v[i]:= v[i] + monto_aumento;
	end;
end;

var 
	v:vector; aumento:real;
begin 
	cargarvector(v);
	read(aumento);
	modificarprecio(v,aumento);
end.
    
a) lea y alamacene precios de productos de supermercados ( a lo sumo 5000) 
la lectura finaliza cuando llega el precio 0
b) implemente un modulo que reciba un nuevo precio y lo agregue a la estructura 
c) implemente un modulo que reciba un nuevo precio y una posicion en la cual 
se debe insertar el nuevo precio
d) implemente un modulo que reciba una posicion y elimine el precio 
en dicha posicion
    
    
 rogram ej1 
const 
	dimf = 100;

type 
	vector = array [1..dimf] of real 
	

procedure cargarvector(var v:vector; var diml:integer);
var 
	precio:real;
begin 
	diml:= 0;
	read(precio);
	while (precio <> 0) and (diml < dimf) do begin 
		diml:= diml +1;
		v[diml]:= precio;
		read(precio);
	end;
end;

procedure agregar(var v:vector; var diml:integer; unprecio:real; var exito:boolean);
var 

begin 
		exito:= false;
		if (diml < dimf) then begin  
			diml:= diml +1;
			v[diml]:= valor;
			exito:= true;
		end;
end;

var 
	exito:boolean; v:vector; diml:integer;
begin 
	cargarvector(v,diml);
	read(unprecio);
	agregar(v,diml,unprecio,exito);
end.  
    
end.
