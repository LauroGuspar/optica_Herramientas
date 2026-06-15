CREATE TABLE receta_clinica (
    id_receta BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cliente BIGINT NOT NULL,
    id_empleado BIGINT NOT NULL,
    fecha_evaluacion DATETIME(6) NOT NULL,
    od_esfera DECIMAL(5,2),
    od_cilindro DECIMAL(5,2),
    od_eje INT,
    od_av_lejos VARCHAR(50),
    od_av_cerca VARCHAR(50),
    oi_esfera DECIMAL(5,2),
    oi_cilindro DECIMAL(5,2),
    oi_eje INT,
    oi_av_lejos VARCHAR(50),
    oi_av_cerca VARCHAR(50),
    distancia_pupilar DECIMAL(5,2),
    adicion DECIMAL(5,2),
    tipo_luna VARCHAR(100),
    material_sugerido VARCHAR(100),
    observaciones TEXT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    CONSTRAINT fk_receta_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_receta_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE receta_tratamiento (
    id_receta BIGINT NOT NULL,
    tratamiento VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_receta, tratamiento),
    CONSTRAINT fk_tratamiento_receta FOREIGN KEY (id_receta) REFERENCES receta_clinica(id_receta) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE orden_laboratorio (
    id_orden BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_venta BIGINT NOT NULL,
    id_receta BIGINT NOT NULL,
    estado_orden VARCHAR(50) NOT NULL DEFAULT 'PENDIENTE',
    fecha_promesa_entrega DATE,
    laboratorio_nombre VARCHAR(150),
    notas TEXT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    CONSTRAINT fk_orden_venta FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    CONSTRAINT fk_orden_receta FOREIGN KEY (id_receta) REFERENCES receta_clinica(id_receta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
