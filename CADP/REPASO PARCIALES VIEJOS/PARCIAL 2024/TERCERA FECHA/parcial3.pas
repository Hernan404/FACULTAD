{La COMBEBOL desea procesar informacion del torneo "copa america" entre paises
para ello, dispone de una estructura de datos con la informacion de cada pais 
que ha participado alguna vez del evento. de cada pais se conoce:
el nombre del pais, la cantidad de participantes en copas america e informacion 
de dichas participaciones (a lo sumo 10) de cada participacion se conoce
el año y en que instancia finalizo (1: fase de grupos, 2: cuartos de final, 3 semifinal, 4: final)

lea la informacion de un nuevo pais y la incorpore en la estructura de datos 
que se dispone. del nuevo pais se lee el nombre del pais, la cantidad de copas obtenidas, la 
cantidad de participaciones y la informacion de cada participacion (año y en que instancia finalizo en dicha participacion)

B. una vez cargado el nuevo pais procese los datos de todos los paises e informe 
1. para cada pais, la cantidad de participaciones realizadas en años anteriores al 1998 en las que 
superaron los octavos de final 
2. los nombres de los dos paises que llegaron mas veces a instancias de final 
3. el promedio de participantes en copas del mundo de todos los paises}


program copaAmerica
const 
    maxParticipaciones = 10;
type 
    rango_instancias = 1..4;

    participacion = record 
        año:integer;
        instancia:rango_instancias;
    end;

    vector_participaciones = array [1..maxParticipaciones] of participacion;

    pais = record 
      nombre:string;
      cantParticipaciones:integer;
      participaciones:vector_participaciones;
    end;

    lista = ^nodo;
    nodo = record 
        data:pais;
        sig:lista;
    end;

procedure cargardatos(var L:lista); // se dispone 

function calcularparticipaciones(p:pais):integer;
var 
  cant,i:integer;
begin 
  cant:= 0;
  v:= p.participaciones;
  par:participacion;

  for i:=1 to p.cantParticipaciones do 
    par:= v[i];

    if (par.año[i].año < 2020) and (par.instancia > 1) then 
      cant:= cant +1;
  
  calcularparticipaciones:= cant;

function cantfinales(p:pais):integer;
var 
  i,cant:integer;
begin 
  cant:= 0;
  for i:=1 to p.cantParticipaciones do 
    if (p.participaciones[i].instancia = 4) then 
      cant:= cant +1; 
  cantfinales:= cant;
end;

procedure actualizarminimo (var pais1,pais2:string; var minpais1,minpais2:integer; paisactual:string; cantpaisactual:integer);



procedure procesarpais(L:lista);
var 
  cantpaises:integer; 
  p:pais;
  nombrepais1,nombrepais2:string;
  finalespais1,finalespais2:integer;
begin 
  finalespais1:= 11;
  finalespais2:= 11;
  cantpaises:= 0;

  while (L <> nil) do begin 
    p:= L·data;
    writeln('el pais', p.nombre, 'participo', calcularparticipaciones(p));
    actualizarminimo(nombrepais1,nombrepais2,finalespais1,finalespais2,p.nombre,cantfinales(p))
  
    cantpaises:= cantpaises +1;
    cantParticipaciones:= cantParticipaciones + p.cantParticipaciones;
  end;
  writeln(cantParticipaciones/cantpaises);
  writeln(nombrepais1,nombrepais2);
end;

procedure agregarpais(var L:lista);
var 
  p:pais;
begin 
  leer(p);
  agregaradelante(L,p);
end;

procedure leerpais(var p:pais);
var 
  i:integer;
begin 
  readln(p.nombre);
  readln(p.cantParticipaciones) do 

  for i:=1 to p.cantParticipaciones do 
    leer(p.participaciones[i])
end;



var 
  L:lista;
begin 
  cargardatos(L);
  procesardatos(L);

end.
    
