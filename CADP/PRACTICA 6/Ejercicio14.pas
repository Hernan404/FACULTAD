{La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes
realizados por una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el
código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1.
colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en
cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una
estructura de datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe
procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte}


program EJ14P6;
const  
  alumnos = 1300;
  rango_medios = 5;
type 
  rango_alumnos = 1..alumnos;

  alumno = record 
    codigo:rango_alumnos;
    dia:1..31;
    facultad:string;
    medio:rango_medios;
  end;


  vmedios = array [rango_medios] of integer;
  vviajes = array [1..31] of integer;


procedure cargardatos(L:lista);
var 
  r:alumno;
begin 
  with r do begin 
    readln(codigo);
    readln(dia);
    readln(facultad);
    readln(medio);
  end;
end; 

procedure cargarlista(var L:lista; r:alumno);
var 
  aux:lista;
begin 
  new(aux);
  aux^.data:= r;
  aux^.sig:= L;
  L:= aux; 
end; 

procedure inivectores (var vv:vviajes; vc:vmedios);
var 
  i,x:integer;
begin 
  for i:= 1 to medios do 
    vc[i]:= 0;
  for x:=1 to 31 do 
    vv[i]:= 0;
end; 

procedure puntoC(vc:vmedios; max1:integer; max2:integer; p1:integer; p2:integer);
var 
  i:integer;
begin 
  for i:=1 to 31 do begin 
    if (vc[i] > max1) then begin 
        max2:= max1;
        p2:= p1;
        max1:= v[i];
        p1:= i;
    end 
    else if (vc[i] > max2) then begin 
            max2:= v[i];
            p2:= i; 
    end;
  end; 
end; 

procedure procesardatos(L:lista);
var 
  // cantidad de medios usados 
  vc:vmedios;

  // gasto por dia 
  vg:vgastos;

  // cantidad de viajes por dia 
  vv:vviajes;

  codigoACT, diaACT, i, totalViajes: integer;
  usoBici, usoOtro: boolean;
  gasto: real;
  max1,max2,p1,p2:integer;
  cantA,puntoB,cantD:integer; 
begin 
  cantA:= 0; puntoB:= 0; cantD:= 0; 
  max1:= -1; max2:= -1; p1:= 0; p2:= 0; 
  cantA 
  inivectores(vc,vv);

  while (L <> nil) do begin
     codigoACT:= L^.data.codigo; 
     while (L <> nil) and (L^.data.codigo = codigoACT) do begin 
          diaACT:= L^.data.dia;
          viajes:= 0;
          gasto:= 0;
          usoBici:= false;
          usoOtro:= false; 

          while (L <> nil) and (L^.data.dia = diaACT) and L^.data.codigo = codigoACT) then begin 
                viajes:= viajes + 1; 

                // cantidad de viajes por medio 
                vc[L^.data.medio]:= vc[L^.data.medio] +1;

                // gastos por dia 
                gasto:= gasto + precios[L^.data.medio];

               // viajes por dia 
                vv[diaACT]:= vv[diaACT] +1; 

              if (L^.data.medio = 5) then 
                  usoBici := true
              else 
                  usoOtro := true;
              
           L:= L^.sig;
          end;
      
          if (viajes > 6) then 
            cantA:= cantA +1; 
          if (gasto > 80) then 
            puntoB:= puntoB +1;

          if (usoBici) and (usoOtro) then 
            cantD:= cantD +1; 
      L := L^.sig;
    end;

  L:= L^.sig;
  end; 
  puntoC(vc,max1,max2,p1,p2);

  writeln(cantA);
  writeln(puntoB);
  writeln(p1,p2);
  writeln(cantD);
end;

var 
  L:lista; 
begin 
  cargardatos(L);
  procesardatos(L);
end. 


