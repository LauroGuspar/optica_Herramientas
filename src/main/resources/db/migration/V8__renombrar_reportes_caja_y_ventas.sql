UPDATE opcion
SET opcion_nombre = 'Caja Operativa'
WHERE opcion_nombre = 'Caja'
  AND opcion_ruta = '/cajas';

UPDATE opcion
SET opcion_nombre = 'Ventas Operativas'
WHERE opcion_nombre = 'Ventas'
  AND opcion_ruta = '/ventas';

UPDATE opcion
SET opcion_nombre = 'Caja',
    opcion_ruta = '/reportes/caja'
WHERE opcion_nombre = 'Caja Diaria'
   OR opcion_ruta = '/reportes/caja-diaria';

UPDATE opcion
SET opcion_nombre = 'Ventas'
WHERE opcion_nombre = 'Ventas por Fecha'
  AND opcion_ruta = '/reportes/ventas';
