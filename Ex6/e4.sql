SELECT InsertReservaEx6.ID,InsertPasajeroEx6.Nombre
FROM InsertPasajeroEx6,InsertVueloEx6,InsertReservaEx6
WHERE InsertPasajeroEx6.DNI=InsertReservaEx6.Pasajero_DNI
and InsertReservaEx6.Vuelo_ID=InsertVueloEx6.ID
and InsertVueloEx6.Dia_Salida='25/2/2023'