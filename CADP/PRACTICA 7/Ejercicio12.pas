program EJ12P7;
type 
	cliente = record 
		nombre:string;
		DNI:integer;
		edad:integer;
		tipo:1..4;
	end;
	
	cliente2 = record 
		nombre:string;
		DNI:integer;
	end;
	
	lista = ^nodo 
	nodo = record 
		data:cliente;
		sig:lista;
	end;
	
	lista2 = ^nodo2 
	nodo2 = record 
		data:cliente2;
		sig:lista2;
	end;
	
	vcostos = array [1..4] of real;
	vcontador = array [1..4] of integer;
	
procedure leer(var r:cliente);

procedure cargardatos(L:lista);



	
procedure inivectores (v:vcostos; vc:vcontador);
var 
	i:integer;
begin 
	for i:=1 to 4 do begin 
		v[i]:= 0;
	end;
	
	{se dispone 
	for i:=1 to 4 do begin 
		vc[1]:= 232 
		vc[2]:= 432
		vc[3]:= 543
		vc[4]:= 324
	end;}
end;

procedure puntoB (v:vector; min1,min2,s1,s2:integer);
begin 
	for i:=1 to 4 do begin 
		if (v[i]> max1) then begin 
			max2:= max1;
			s2:= s1;
			max1:= v[i];
			s1:= i;
		end
		else if (max1 > max2) then begin 
			max2:= v[i];
			s2:= i;
		end; 	
end;

procedure armarlista2 (L2:lista2; nombre:string; DNI:Integer);
var 
	aux,ant,act:lista2;
  begin
    New(aux);
    nue^.dato.nombre:= nombre;
    nue^.dato.DNI:= DNI;
    nue^.sig:= nil;

    if (L = nil) then
      L:= aux;
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.data.DNI < DNI) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        if (ant = act) then
          L:= aux
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure procesardatos(L:lista);
var 
	vc:vcostos; v:vcontador;
	max1,max2,s1,s2:integer;
begin 
	max1:= 0; max2:= 0; s1:= 0; s2:= 0;
	inivector(v,vc);
	while (L <> nil) do begin 
		//punto A
		total:= vc[L^.data.tipo] + total;
		//punto B
		v[L^.data.tipo]:= v[L^.data.tipo] +1;
		puntoB(v,max1,max2,s1,s2);
		//punto C
		if (L^.data.edad > 40) and (L^.data.tipo = 1) or (L^.data.tipo = 4) then 
			armarlista2(L2,L^.data.nombre,L^.data.DNI);
	end;
     writeln(total);
     wirteln(s1,s2);
     

var 
	L:lista;
begin 
	cargardatos(L); // se dispone;
	procesardatos(L);
end;
