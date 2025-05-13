{una empresa de alquiler de vehiculos dispone de una estructura donde tiene almaacenado toda la informacion de cada alquiler realizado durante el año 2023.

de cada alquiler se conoce: patente de vehiculo, tipo de vehiculo (1..8), kms del automovil al retirarlo,
kms del automovil al devolverlo, dni de la persona que lo alquilo, ciudad de retiro del vehiculo, ciudad de devolucion del vehiculo, fecha de retiro de vehiculo y cantidad de dias de alquiler. 
esta informacion se encuentra ordenada por patente de manera ascendente.

ademas la empresa dispone de una tabla con los montos de alquiler por dia de cada tipo de vehiculo 

A partir de la informacion del os alquileres se pide:

a. generar una nueva estructura que contenga para cada patente del vehiculo, el totla de kms realizados durante todo el 2023. esta informacion debe quedar ordenada por patente en forma ascendente. 

b. informar la patente del vehiculo que recaudo mas dinero en alquiler durante todo el año 2023. 

c. informar el porcentaje de alquileres realizados cuyos automoviles se retiran en una ciudad y se devuelven en otra ciudad 

d. informar el mes en que se retiraron menos vehiculos alquilados }


program TERCERA_FECHA;
const 
  tipos = 8;
type 
  rango_tipos = 1..tipos;

  fecha = record 
    dia:integer;
    mes:1..12;
  end; 

  alquiler = record 
    patente:string;
    tipo:rango_tipos;
    kms_retiro:real;
    kms_vuelta:real;
    dni:integer;
    ciudad_retiro:string;
    ciudad_vuelta:string;
    fechas:fecha;
    diasAlquiler:integer;
  end; 

  lista = ^nodo;
  nodo = record 
    data:alquiler;
    sig:lista;
  end; 

  lista2 = ^nodo;
  nodo = record 
    patente:string;
    total:real;
  end; 


  vMontos = array [rango_tipos] of real;

procedure leer(var r:alquiler); // se dispone 
procedure armarlista (var L:lista; r:alquiler); // se dispone 
procedure tablaMontos (var vM:vMontos); // se dispone 



procedure armarlista2(var L2:lista2; total_kms:real; patente:string);
var 
  ant,act,nue:lista2;
begin 
  new(nue);
  nue^.data.patente:= patente;
  nue^.data.total:= total_kms;
  act:= L2;
  ant:= L2;

  while (act <> nil) and (act^.data.pantente < patente) do begin 
      ant:= act; 
    act:= act^.sig;
  end; 

  if (ant = act) then 
      pri:= nue;
  else 
    ant^sig:= nue; 
  nue^.sig:= act; 
end; 

procedure procesardatos(L:lista);
var 
  L2:lista2; vm:vMontos; 
begin 
    L2:= nil; 


    while (L <> nil) do begin 
      // punto A 
      patenteACT:= L^.data.patente;
      total_kms:= 0; 
      while (L <> nil) and (patenteACT = L^.data.patente) do begin 
          total_kms:= total_kms + (L^.data.kms_retiro - L^.data.kms_vuelta);
          armarlista2(L2,total_kms,L^.data.patente);

          dinero:= dinero + (L^.data.diasAlquiler + vm[L^.data.tipo])

      
          if (dinero > max) then begin 
              max:= dinero;
              p1:= patenteACT; 
          end; 
      end; 
      L:= L^.sig;
   

      cant_alquileres:= cant_alquileres + 1; 
      

      // punto C 
      if (L^.data.ciudad_retiro <> L^.data.ciudad_vuelta) then 
          cantPorcentaje:= cantPorcentaje + 1; 

      // punto D 
      if (cant_alquileres < min) then 
          min:= cant_alquileres
          
    L:= L^.sig;
    end; 
    
    porcentaje:= (cant_alquileres/cantPorcentaje)*100; 

    
end; 

var 
  L:lista;
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
end. 
