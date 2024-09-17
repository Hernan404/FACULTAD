program EJ14P4;
type 
  participante = record 
    pais:string;
    codigo:1..1000;
    nombre:string;
    rol:1..5;
    cantHoras:integer;
  end;

  resultados = record 
    montoDesarrollador:real;
    cantHoras:real;
    menormonto:real;
    cantRol:integer;
  end;

  vrol = array [1..5] of integer;
  vcodigo = array [1..1000] of resultados;


procedure cargar(vr:vrol; r:participante);
begin 
    with r do begin 
        readln(pais);
        readln(codigo);
        readln(nombre);
        readln(rol);
        readln(canthoras);
    end;
end;

procedure cargarroles (var vr:vrl);
var 
  i:integer;
begin 
  for i:=1 to 5 do begin 
    vr[1]:= 35,20;
    vr[2]:= 27,45;
    vr[3]:= 31,03;
    vr[4]:= 44,28;
    vr[5]:= 39,87;
  end;
end;  

procedure cargarcodigo (var vc:vcodigo);
var 
  i:integer;
begin 
  for i:=1 to 1000 do begin 
    v[i].montoDesarrollador:= 0;
    v[i].cantHoras:= 0;
    v[i].menormonto:= 0;
    v[i].cantRol:= 0;
  end;
end;

procedure procesar(vr:rol; r:participante; v:vcodigo);
begin 
  for i:=1 to 5 do begin 
    if (r.pais = 'argentina') then 
        v[r.codigo].montoDesarrollador:= v[r.codigo].montoDesarrollador + vr[r.rol];

    if (r.rol = 3) then 
      v[r.codigo].cantHoras:= v[r.codigo].canthoras + r.cantHoras;
    
    v[r.codigo].menormonto:= v[r.codigo].menormonto + vr[r.rol];

    if (r.rol = 4) then 
      v[r.codigo].cantrol:= v[r.codigo] +1; 
  end;
end;

procedure imprimir (v:vcodigo);
var 
  i:integer;
  montoDesarrollador,cantHoras,menormonto:real;
  c1:integer;
begin 
  montoDesarrollador:= 0;
  cantHoras:= 0;
  menormonto:= 9999;

  for i:=1 to 1000 do begin 
    montoDesarrollador:= montoDesarrollador + v[i].montoDesarrollador;
    cantHoras:= cantHoras + v[i].cantHoras;

    if (v[i].menorMonto < min) then begin 
        min:= v[i].menorMonto;
        c1:= i;
    end;
    writeln(v[i]:cantrol);
  end;
  writeln(montoDesarrollador);
  writeln(cantHoras);
  writeln(c1);
end;

var 
  vc:vcodigo;  vr:vrol; r:participante;
begin
    montoTotal:= 0;
    while (r.codigo <> -1) do begin
      cargarroles(vr);
      cargar(vc,p);
      procesar(vc,p);
      imprimir(vc);
    end;
end;
