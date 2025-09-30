INSERT INTO tareas (descripcion, prioridad, estado, id_categoria, fecha_limite, notas) 
VALUES ('Leer capítulo de programación', 'MEDIA', 'PENDIENTE', 3, '2025-10-12', 'Repasar ejemplos de POO');

--Crear tarea


SELECT 
    t.id_tarea AS ID,
    t.descripcion AS Tarea,
    t.prioridad AS Prioridad,
    t.estado AS Estado,
    c.nombre AS Categoría,
    DATE_FORMAT(t.fecha_limite, '%d/%m/%Y') AS 'Fecha Límite'
FROM tareas t
LEFT JOIN categorias c ON t.id_categoria = c.id_categoria
ORDER BY FIELD(t.prioridad, 'ALTA', 'MEDIA', 'BAJA'), t.fecha_limite ASC;

--leer tareas


UPDATE tareas
SET descripcion = 'Leer capítulo de bases de datos',
    prioridad = 'ALTA',
    fecha_limite = '2025-10-15'
WHERE id_tarea = 1;

--editar tarea ya existente


DELETE FROM tareas
WHERE id_tarea = 1;

--eliminar una tarea por id