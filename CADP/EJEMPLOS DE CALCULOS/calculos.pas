procedure calcularDuracionYPrecio(var r: reservas);
begin
  r.duracion := r.hora_fin - r.hora_inicio;  
  r.precio := r.duracion * TablaPrecios[r.categoria].Precio;
end;
