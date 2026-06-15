CREATE TABLE IF NOT EXISTS web_config (
    id_web_config BIGINT NOT NULL AUTO_INCREMENT,
    web_logo_url VARCHAR(500) NULL,
    web_telefono_contacto VARCHAR(50) NULL,
    web_correo_contacto VARCHAR(100) NULL,
    web_direccion VARCHAR(255) NULL,
    web_horario_atencion VARCHAR(255) NULL,
    web_enlace_facebook VARCHAR(255) NULL,
    web_enlace_instagram VARCHAR(255) NULL,
    web_enlace_tiktok VARCHAR(255) NULL,
    created_at DATETIME(6) NULL,
    updated_at DATETIME(6) NULL,
    PRIMARY KEY (id_web_config)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS web_carousel_imagen (
    id_web_carousel_imagen BIGINT NOT NULL AUTO_INCREMENT,
    id_web_config BIGINT NOT NULL,
    imag_url VARCHAR(500) NOT NULL,
    imag_orden INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_web_carousel_imagen),
    CONSTRAINT fk_carousel_web_config FOREIGN KEY (id_web_config) REFERENCES web_config (id_web_config) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Seed default config row
INSERT INTO web_config (id_web_config, web_telefono_contacto, web_correo_contacto, web_direccion, web_horario_atencion, created_at, updated_at)
VALUES (1, '+51999999999', 'contacto@optica.com', 'Av. Principal 123', 'Lunes a Sábado 9:00 AM - 8:00 PM', NOW(), NOW());
