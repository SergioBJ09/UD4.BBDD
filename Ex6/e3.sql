SELECT InsertAvionesEx6.Marca,InsertAvionesEx6.Modelo,InsertAvionesEx6.Num_Asientos,InsertVueloEx6.ID,InsertVueloEx6.Dia_Salida,InsertVueloEx6.Hora_Salida,InsertVueloEx6.Origen,InsertVueloEx6.Destino
FROM InsertAvionesEx6,InsertVueloEx6
WHERE InsertAvionesEx6.Modelo="Airbus"
and InsertAvionesEx6.ID=InsertVueloEx6.Avión_ID;