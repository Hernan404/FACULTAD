{
La empresa Amazon Web Services (AWS) dispone de la información de sus 500 (dimf) clientes monotributistas más
grandes del país. De cada cliente conoce la 
* 
* fecha de firma del contrato con AWS, (registro fecha)
* la categoría del monotributo (entre la A y la F), 
* el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
* el monto mensual acordado en el contrato.

La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).

Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.

Una vez almacenados los datos, procesar dicha estructura para obtener:

a. Cantidad de contratos por cada mes y cada año, (vector de vectores) (1994-2023)
*  y año en que se firmó la mayor cantidad de contratos (recorrer y calcular max)
b. Cantidad de clientes para cada categoría de monotributo (vector contador, array 'A'..'F')
c. Cantidad de clientes por ciudad (vector contador 1..2400)
*  Código de las 10 ciudades con mayor cantidad (vector de maximos 1..10)(vector ordenado mayor a menor)
* 
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.(variable contador)(calcular promedio en la lectura)
   
   
}


program ejer;
Const 
  dimF = 500;

Type 
  rangoMes = 1..12;
  rangoDia=1..31;
  rangoAnio=1994..2023;
  rangoCod=1..2400;
  cate = 'A'..'F';
  
  Fecha = Record
    dia: rangoDia;
    mes: rangoMes;
    anio: rangoAnio;
  End;
  
  cliente = Record
    fecha: Fecha;
    categoria: cate;
    cod: rangoCod;
    montoMes: real;
  End;
  
  infoMax = record
	cantidad:integer;
	cod:rangoCod;
  end;
  
  vecAmazon = array [1..dimF] Of cliente;
  vecMeses = array [rangoMes] Of integer;
  vecAnios = array [rangoAnio] Of vecMeses;
  vecCategorias = array ['A'..'F'] of integer;
  vecCiudades = array [rangoCod] of integer;
  
  vecMaximos = array [1..10] of  infoMax;{me guardo cod y cantidad de cada ciudad}
  


procedure inicializarVecAnios(var vCantA:vecAnios);
begin
	for i:=1994 to 2023 then
		for j:=1 to 12 then
			vCantA[i][j]:=0;
end;

procedure inivMax(v:vecMaximos);
begin
	for i:=1 to 10 do begin
		v[i].cantidad:=-1;
	end;
end;


procedure insertarOrdenado(info:infoMax;pos:integer; var vMax:vecMaximos);

begin
	if(pos <> 10) then
		for i:=9 downto pos 
			vMax[i+1]:=vMax[i];
	
	vMax[pos] := info;
end;

procedure actualizarMaximo(cantidad:integer;codCiudad:integer; var vMax:vecMaximos);
var
	i:integer;
	auxInfo:infoMax;
begin
	pos:=1;
	while (pos <= 10) and ( cantidad < vMax[pos]) do begin
		pos:=pos+1;
	end;
	
	if (cantidad > vMax[pos]) then begin   
		auxInfo.cantidad:=cantidad;
		auxInfo.cod:=codCiudad;
		insertarOrdenado(auxInfo,pos,vMax);
	end;	

end;

procedure calcular10Max(var v:vecCiudades)
var
	vMax:vecMaximos;
	
begin
	inicializarvMax(vMax);
	
	for i:=1 to 2400 do begin
		
		actualizarMaximo(v[i],i,vMax);
		
		
	end;

end;

procedure procesarVectorClientes (va: vecAmazon; promedioMontos:real);
var
	vCiu:vecCiudades;
	
	i:integer;
	
	cantSuperanPromedio:integer;
	
	vCantA:vecAnios;
	
	vCantCategorias: vecCategorias;
	
	vCantCiudades:vecCiudades;

begin
	inicializarVecAnios(vCantA);
	inivCantCategorias(vCantCategorias);
	inivCantCiudad(vCantCiudades);
	cantSuperanPromedio:=0;
	
	for i:=1 to dimf do begin
		
		if(va[i].monto > promedioMontos) then cantSuperanPromedio:=cantidadSuperanPromedio+1;
		
		vCantA[va[i].fecha.anio][va[i].fecha.mes]:=vCantA[va[i].fecha.anio][va[i].fecha.mes]+1;
		
		vCantCategorias[va[i].categoria] := vCantCategorias[va[i].categoria]+1;
	
		vCantCiudades[va[i].cod]:=vCantCiudades[va[i].cod] +1; 
	
	end;




	calcularAnioMasContratos(vCantA);
	calcular10Max(vCiu);
	
	{informar lo que corresponda}
end;




var

vA:vecAmazon;

promedioMontos:real;

BEGIN

	cargarVectorClientes(vA,promedioMontos);{es un for y calcula el promedio}
	
	procesarVectorClientes(vA,promedioMontos);
	
	
	
	
END.

