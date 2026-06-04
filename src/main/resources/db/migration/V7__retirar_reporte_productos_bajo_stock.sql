DELETE po
FROM perfil_opcion po
INNER JOIN opcion o ON o.id_opcion = po.id_opcion
WHERE o.opcion_ruta = '/reportes/bajo-stock'
   OR o.opcion_nombre = 'Productos Bajo Stock';

DELETE FROM opcion
WHERE opcion_ruta = '/reportes/bajo-stock'
   OR opcion_nombre = 'Productos Bajo Stock';
