SELECT InsertCitaEx5.matricula,InsertCitaEx5.dia,InsertCitaEx5.hora,InsertVehiculoEx5.marca,InsertClienteEx5.nombre,InsertVehiculoEx5.tipo_vehiculo
FROM InsertClienteEx5,InsertVehiculloEx5,InsertCitaEx5
WHERE InsertClienteEx5.dni=InsertVehiculloEx5.dni_cliente
and InsertVehiculloEx5.matricula=InsertCitaEx5.vehiculo_matricula
and InsertVehiculloEx5.id_tipo_vehiculo=tipo_vehiculo.id
and InsertCitaEx5.data > '11/3/2023';