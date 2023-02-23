SELECT count(InsertLineaTicketEx7) as "Numero Lineas"
FROM InsertLineaTicketEx7,InsertTicketEx7,InsertEmpleadoEx7
WHERE InsertEmpleadoEx7.DNI=InsertTicketEx7.Empleado_DNI
and InsertTicketEx7.ID=InsertLineaTicketEx7.Ticket_ID
and InsertEmpleadoEx7.Nombre like "E%"
and InsertTicketEx7.Fecha<"23/2/2023;