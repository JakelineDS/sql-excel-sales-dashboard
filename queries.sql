-- Clientes que más gastaron
SELECT 
    c.nombre,
    SUM(v.total) AS total_gastado
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
ORDER BY total_gastado DESC;

-- Productos más vendidos
SELECT 
    p.nombre_producto,
    SUM(d.cantidad) AS total_vendido
FROM productos p
JOIN detalle_ventas d
ON p.id_producto = d.id_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC;

-- Ventas por categoría
SELECT 
    c.nombre_categoria,
    SUM(d.subtotal) AS ingresos
FROM categorias c
JOIN productos p
ON c.id_categoria = p.id_categoria
JOIN detalle_ventas d
ON p.id_producto = d.id_producto
GROUP BY c.nombre_categoria
ORDER BY ingresos DESC;

-- Promedio de ventas
SELECT AVG(total) AS promedio_ventas
FROM ventas;

-- Productos nunca vendidos
SELECT *
FROM productos
WHERE id_producto NOT IN (
    SELECT id_producto
    FROM detalle_ventas
);
