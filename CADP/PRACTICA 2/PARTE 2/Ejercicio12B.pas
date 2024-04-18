ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de
zona (1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse.
El precio de la soja es de U$S320 por tn. Informar:

● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.


program EJ12P2P2;


procedure proceso (var localidad:string; var tipo_zona:integer; var precio,canthec:real; var cant:integer);
var 
    t1,t2,t3,total:real; max,min:real; r1,p1:string; promedio:real; puntoA:integer;
begin 
	promedio:= 0;
	total:= 0;
	t1:=0;
	t2:=0;
	t3:=0;
	max:= -1;
	min:= 9999;
	r1:= '';
	p1:= '';
	puntoA:= 0;
	cant:=0;
	
    if (canthec <> 900) then begin 
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

        
        if (localidad = 'tres de febrero') and (total > 10.000) then begin 
            puntoA:= puntoA +1;
        end;

        if (total > max) then begin 
            max:= total;
            r1:= localidad;
        end;

        if (total < min) then begin 
            min:= total;
            p1:= localidad;
        end; 
    end; 
    promedio:= cant/total;

    writeln('RENDIMIENTO DE ZONA 1: ', t1:2:0);
    writeln('RENDIMIENTO DE ZONA 2: ', t2:2:0);
    writeln('RENDIMIENTO DE ZONA 3: ', t3:2:0);
    writeln('RENDIMIENTO TOTAL: ', total:2:0);

    writeln('cantidad de campos de la localidad tres de febrero de mas de 10k: ', puntoA);
    writeln('La localidad del campo con mayor rendimiento economico esperado: ', r1); 
    writeln('La localidad del campo con menor rendimiento economico esperado: ', p1);
    writeln('rendimiento promedio: ', promedio:2:0);
end;

var 
    canthec:real;
    tipo_zona:integer;
    precio:real;
    localidad:string;
    cant:integer;
begin 
	cant:= 0;
    repeat 
        writeln('LOCALIDAD');
        readln(localidad);
        writeln('INGRESE CANTIDAD DE HECTAREAS');
        readln(canthec);
        writeln('INGRESE TIPO DE ZONA');
        readln(tipo_zona);
        writeln('INGRESE PRECIO');
        readln(precio);
        cant:= cant +1;

    until (localidad = 'tres de febrero');

    proceso(localidad,tipo_zona,precio,canthec,cant);
end.
