CREATE TABLE IF NOT EXISTS cotizacion (
    id_cotizacion BIGINT NOT NULL AUTO_INCREMENT,
    coti_cliente_nombre VARCHAR(150) NOT NULL,
    coti_cliente_documento VARCHAR(20) NULL,
    coti_cliente_telefono VARCHAR(50) NULL,
    coti_cliente_correo VARCHAR(100) NULL,
    coti_total_estimado DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    coti_estado VARCHAR(30) NOT NULL DEFAULT 'PENDIENTE',
    coti_fecha_creacion DATETIME(6) NOT NULL,
    coti_observaciones VARCHAR(500) NULL,
    created_at DATETIME(6) NULL,
    updated_at DATETIME(6) NULL,
    PRIMARY KEY (id_cotizacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS cotizacion_detalle (
    id_cotizacion_detalle BIGINT NOT NULL AUTO_INCREMENT,
    id_cotizacion BIGINT NOT NULL,
    id_producto BIGINT NOT NULL,
    coti_cantidad INT NOT NULL,
    coti_precio_lista DECIMAL(12, 2) NOT NULL,
    coti_subtotal DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (id_cotizacion_detalle),
    CONSTRAINT fk_detalle_cotizacion FOREIGN KEY (id_cotizacion) REFERENCES cotizacion (id_cotizacion) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
