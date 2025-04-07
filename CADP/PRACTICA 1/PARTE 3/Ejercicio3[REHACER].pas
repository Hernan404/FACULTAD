{Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos}



program EJ3P1P3;
var 
	tanque:char;
	
	ancho:integer;
	largo:integer;
	alto:integer;
	
	radioC:integer;
	altoC:integer;
	
	pC,pR,volumenR,cantVentasR,cantVentasC,volumenC:integer;
	maxR,maxC:integer;
	cantMenoresALTO:integer;
	cantmenoresCUB:integer;
	

begin
	cantMenoresALTO:=0;
	cantmenoresCUB:= 0;
	maxR:= -1;
	maxC:= -1;
	maxC:= -1;
	cantVentasC:= 0;
	cantVentasR:= 0;
    pC:=0;
    pR:=0;
	
	writeln('====INGRESE TIPO DE TANQUE====  (R)  (C)  (Z)');
	readln(tanque);
		
	while (tanque <> 'Z') do begin
		
		
		if (tanque = 'R') then begin 
			writeln('ANCHO');
			readln(ancho);
			writeln('LARGO');
			readln(largo);
			writeln('ALTO');
			readln(alto);

            volumenR:= ancho * largo * alto;
			cantVentasR:= cantVentasR +1;	

            if (volumenR > maxR) then
				maxR:= volumenR;
				pR:= maxR;
            
            if (alto > 1.40) then 
                cantMenoresALTO:= cantMenoresALTO +1;

            if (volumenR < 800) then
                cantmenoresCUB:= cantmenoresCUB +1;

		end
		else if (tanque = 'C') then begin 
			writeln('RADIO');
			readln(radioC);
			writeln('ALTO');
			readln(altoC);

            volumenC:= altoC * radioC *2;
            cantVentasC:= cantventasC +1;

            if (volumenC > maxC) then 
				maxC:= volumenC;
				pC:= maxC;

            if (volumenC < 800) then 
				cantmenoresCUB:= cantmenoresCUB +1;


            if (altoC < 1.40) then 
				cantMenoresALTO:= cantMenoresALTO +1;
		end;


		writeln('====INGRESE TIPO DE TANQUE====  (R)  (C)  (Z)');
		readln(tanque);	 
	end;
	writeln('volumen de los mayores tanques vendidos ', pC , ' para cubicos ', pR, ' para rectangulares');
	writeln('volumen promedio de todos los cilindricos vendidos: ', volumenC/cantVentasC:2:0);
	writeln('volumen promedio de todos los rectangulares vendidos: ', volumenR/cantVentasR:2:0);
	writeln('cantidad de tanques cuyo volumen son menor a 1.40 metros: ', cantMenoresALTO);
	writeln('cantidad de tanques cuyo volumen son menor a 800 metros: ', cantmenoresCUB);
 	
end.

