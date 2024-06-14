{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el
monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato
(los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes}

program EJ5P4P2;
const 
    dimf = 500;
type 
    fecha = record 
        dia:integer;
        mes:integer;
        anio:integer;
    end;

    aws = record 
        fechas:fecha;
        categoria:char;
        codigo:integer;
        monto:real;
    end;

    montoC = record 
        cliente:integer;
        ciudad:integer;
    end;

    vector = array [1..dimf] of aws;
    vcategoria = array ['A..F'] of integer;
    vcliente = array [1..2400] of integer;
    vciudad = array [1..10] of montoC;

procedure cargarvector (var v:vector);
var 
    i,dia,mes,anio,categoria:integer;
begin 
    dia:= -1; 
    mes:= -1;
    anio:= 2020;

    for i:=1 to dimf do begin 
        v[i].fecha.dia:= dia;
        v[i].fecha.mes:= mes;
        v[i].fecha.anio:= anio;
        dia:= dia + 1;
    
        if (dia > 30) then begin 
            dia:= 1;
            mes:= mes +1;
            if (mes > 12) then begin 
                mes:= 1;
                anio:= anio +1;
            end;
        end;
        categoria:= categoria +1;
    end;
end;

procedure puntoA(v:vector);
var 
    i:integer;
    mes,anio,cantmes,max,max,cant:integer;
begin 
    i:= 1;
    max:= -1;
    while (i < dimf) do begin 
        cant:= 0;
        anio:= v[i].fecha.anio;
        while ((v[i]).fecha = anio) and (i < dimf) do begin 
            cantmes:= 0;
            mes:= v[i].fecha.mes;
            while (v[i].fecha.mes = mes) do begin 
                cantmes:= cantmes +1;
                i:= i +1;
            end;
            writeln('este mes tuvo', cantmes,'contratos');
            cant:= cant + cantmes;
        end;
        if (max < cant) then begin 
            max:= cant;
            anio:= anio;
        end;
        writeln('el anio tuvo ', cant,'contratos');
    end;
    writeln('el anio que mas contratos firmo fue ', max);
end;

procedure puntoB (v:vector);
var 
    i:integer; x:char;
    vc:vcategoria;
begin 
    for i:= 'A' to 'F' do 
        vc[x]:= 0;
    for i:= 1 to dimf do 
        vc[v[i].categoria]:= vc[v[i].categoria] +1;
    for x:= 'A' to 'F' do 
        writeln('la categoria',y,'tuvo',vc[y],'clientes');
end;

procedure puntoC(v:vector);
var 
    i,x,z:integer;
    vm:vcliente;
    vc:vciudad;
    cumple:boolean;
begin 
    for i:=1 to 10 do 
        vc[i].clientes:= 0;
    
    for i:=1 to dimf do 
        vm[v[i].codigo]:= vm[v[i].codigo] +1;
    
  for x:=1 to 2400 do
      begin
        cumple:= true;
        y:= 1;
        while (cumple) and (y <= 10) do
          begin
            if (vm[x] > vc[y].clientes) then
              begin
                for z:=9 downto y do
                  begin
                    vc[z+1].clientes:= vc[z].clientes;
                    vc[z+1].ciudad:= vc[z].ciudad;
                  end;
                vc[y].clientes:=vm[x];
                vc[y].ciudad:= x;
                cumple:= false;
              end
            else
              y:= y + 1;
          end;
      end;
    writeln ('Las ciudades que mas clientes tiene son: ');
    for x:= 1 to 10 do
      writeln (vc[x].ciudad,'.');
  end;

procedure incisoD (v: vector);
  var
    x: integer;
    prom: real;
    clientes: integer;
  begin
    clientes:= 0;
    prom:= 0;
    for x:=1 to dimF do
      prom:= prom + v[x].monto;

    prom:= prom / dimF;

    for x:=1 to dimF do
      begin
        if (prom < v[x].monto) then
          clientes:= clientes + 1;
      end;
    
    writeln ('La cantidad de clientes que superan el promedio son ',clientes,'.');
  end;

var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarV(v); //Para agilizar la carga lo hago de forma automatica, pero habria que hacerlo manual
  //=================================
  incisoA(v);
  incisoB(v);
  incisoC(v);
  incisoD(v);
end.





