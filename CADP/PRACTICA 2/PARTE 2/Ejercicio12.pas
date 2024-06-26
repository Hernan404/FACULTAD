 Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona
estándar, 3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico
esperado de dicha plantación. Para calcular el rendimiento económico esperado debe considerar el siguiente
rendimiento por tipo de zona:

Tipo de zona Rendimiento por ha
1 6 toneladas por ha
2 2,6 toneladas por ha
3 1,4 toneladas por ha


program EJ12P2P2;


procedure proceso (var tipo_zona:integer; var precio,canthec:real);
var 
    t1,t2,t3,total:real;
begin 
	total:= 0;
	t1:=0;
	t2:=0;
	t3:=0;
    if (tipo_zona = 1) then begin 
        t1:= canthec * 6;
        t1:= t1 * precio;
    end;
   
    if (tipo_zona = 2) then begin 
        t2:= canthec * 2.6;
        t2:= t2 * precio;
    end;
    
    if (tipo_zona = 3) then begin 
        t3:= canthec * 1.4;
        t3:= t3 * precio;
	end;

	total:= t1 + t2 + t3;
    
    writeln('RENDIMIENTO DE ZONA 1: ', t1:2:0);
    writeln('RENDIMIENTO DE ZONA 2: ', t2:2:0);
    writeln('RENDIMIENTO DE ZONA 3: ', t3:2:0);
    writeln('RENDIMIENTO TOTAL: ', total:2:0);
end;

var 
    canthec:real;
    tipo_zona:integer;
    precio:real;
begin 
    writeln('INGRESE CANTIDAD DE HECTAREAS');
    readln(canthec);
    writeln('INGRESE TIPO DE ZONA');
    readln(tipo_zona);
    writeln('INGRESE PRECIO');
    readln(precio);

    proceso(tipo_zona,precio,canthec);
end.
