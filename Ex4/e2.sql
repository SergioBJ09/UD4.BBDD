SELECT *
FROM InsertPolizaEx4,InsertClienteEx4,InsertTipoPolizaEx4,InsertVendedorEx4
WHERE InsertClienteEx4.dni=InsertPolizaEx4.dni_cliente
and InsertPolizaEx4.id_InsertTipoPolizaEx4=InsertTipoPolizaEx4.id
and InsertPolizaEx4.dni_vendedor=InsertVendedorEx4.dni;