program EJ14P4;
const
  CANT_PROYECTOS = 1000;
type
    sCodigo = 1 .. CANT_PROYECTOS;
    sRol = 1..5;

    desarrollador = record
      pais : string;
      codigo_proyecto : sCodigo;
      nombre : string;
      rol : sRol;
      horas_trabajadas : integer;
    end;

    vPrecios = array[sRol] of real;
    vMontos = array[sCodigo] of real;
    vArq = array[sCodigo] of real;

procedure leerDesarrollador(var d:desarrollador);
begin
  readln(d.codigo_proyecto);
  if (d.codigo_proyecto <> -1) do begin
     readln(d.pais);
     readln(d.nombre);
     readln(d.rol);
     readln(d.horas_trabajadas);
  end;
end;

var
  act : desarrollador;
  precios : vPrecios;
  montos : vMontos;
  arq : vArq;

  totalDesarrolladores : real;
  horasBBDD : integer;
begin

  cargarPrecios(precios); //Se dispone
  inicializarMontos(montos);  //Implementar
  iniciarArq(arq);             //Implementar

  totalDesarrolladores := 0;
  horasBBDD := 0;

  leerDesarrollador(act);
  while (act.codigo_proyecto <> -1) do begin
    if (act.pais = 'Argentina') then
       totalDesarrolladores := totalDesarrolladores + act.horas_trabajadas * precios[act.rol];

    if (act.rol = 3) then
       horasBBDD := horasBBDD + act.horas_trabajadas;

    montos[act.codigo_proyecto] = montos[act.codigo_proyecto] + act.horas_trabajadas * precios[act.rol];

    if (act.rol = 4) then
       arq[act.codigo_proyecto] = arq[act.codigo_proyecto] + 1;

    leerDesarrollador(act);
  end;

  calcularMinimo(montos);   //Implementar
  informarArquitectos(arq);  //Implementar

end.  
