{El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido
en los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió
en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de
proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a. El monto total invertido en desarrolladores con residencia en Argentina.
b. La cantidad total de horas trabajadas por Administradores de bases de datos.
c. El código del proyecto con menor monto invertido.
d. La cantidad de Arquitectos de software de cada proyecto}

program EJ14P4;

type 
  participante = record 
    pais: string;
    codigo: integer;
    nombre: string;
    rol: 1..5;
    cantHoras: integer;
  end;

  resultados = record 
    montoDesarrollador: real;
    cantHoras: integer;
    menorMonto: real;
    cantRol: integer;
  end;

  vrol = array [1..5] of real;
  vcodigo = array [1..1000] of resultados;

procedure cargar(var r: participante);
begin 
  with r do 
  begin 
    writeln('Ingrese país de residencia:');
    readln(pais);
    writeln('Ingrese código de proyecto:');
    readln(codigo);
    if (codigo <> -1) then
    begin
      writeln('Ingrese nombre del proyecto:');
      readln(nombre);
      writeln('Ingrese rol (1-5):');
      readln(rol);
      writeln('Ingrese cantidad de horas trabajadas:');
      readln(cantHoras);
    end;
  end;
end;

procedure cargarroles(var vr: vrol);
begin 
  vr[1] := 35.20;  // Analista Funcional
  vr[2] := 27.45;  // Programador
  vr[3] := 31.03;  // Administrador de bases de datos
  vr[4] := 44.28;  // Arquitecto de software
  vr[5] := 39.87;  // Administrador de redes y seguridad
end;

procedure inicializarCodigos(var v: vcodigo);
var 
  i: integer;
begin 
  for i := 1 to 1000 do 
  begin 
    v[i].montoDesarrollador := 0;
    v[i].cantHoras := 0;
    v[i].menorMonto := 0;
    v[i].cantRol := 0;
  end;
end;

procedure procesar(var r: participante; var v: vcodigo; vr: vrol);
begin 
  if (r.pais = 'argentina') then 
    v[r.codigo].montoDesarrollador := v[r.codigo].montoDesarrollador + (vr[r.rol] * r.cantHoras);

  if (r.rol = 3) then 
    v[r.codigo].cantHoras := v[r.codigo].cantHoras + r.cantHoras;

  v[r.codigo].menorMonto := v[r.codigo].montoDesarrollador;

  if (r.rol = 4) then 
    v[r.codigo].cantRol := v[r.codigo].cantRol + 1; 
end;

procedure imprimir(v: vcodigo);
var 
  i, codigoMenorMonto: integer;
  montoTotalArgentina, totalHorasDB, menorMonto: real;
begin 
  montoTotalArgentina := 0;
  totalHorasDB := 0;
  menorMonto := 1E+10; // Inicializa con un valor muy alto para asegurar que se actualice

  for i := 1 to 1000 do 
  begin 
    montoTotalArgentina := montoTotalArgentina + v[i].montoDesarrollador;
    totalHorasDB := totalHorasDB + v[i].cantHoras;

    if (v[i].montoDesarrollador < menorMonto) and (v[i].montoDesarrollador > 0) then 
    begin 
      menorMonto := v[i].montoDesarrollador;
      codigoMenorMonto := i;
    end;
    
    writeln('Cantidad de Arquitectos de Software en proyecto ', i, ': ', v[i].cantRol);
  end;

  writeln('Monto total invertido en desarrolladores de Argentina: ', montoTotalArgentina:0:2);
  writeln('Cantidad total de horas trabajadas por Administradores de bases de datos: ', totalHorasDB:0:0);
  writeln('Código del proyecto con menor monto invertido: ', codigoMenorMonto);
end;

var 
  vc: vcodigo;  
  vr: vrol; 
  r: participante;
begin
  cargarroles(vr);
  inicializarCodigos(vc);
  cargar(r);
  
  while (r.codigo <> -1) do 
  begin
    procesar(r, vc, vr);
    cargar(r);
  end;
  
  imprimir(vc);
end.

