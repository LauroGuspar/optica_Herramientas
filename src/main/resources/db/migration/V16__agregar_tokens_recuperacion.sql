ALTER TABLE empleado ADD COLUMN emple_reset_codigo VARCHAR(6) NULL;
ALTER TABLE empleado ADD COLUMN emple_reset_expiracion TIMESTAMP NULL;

ALTER TABLE cliente ADD COLUMN cli_reset_codigo VARCHAR(6) NULL;
ALTER TABLE cliente ADD COLUMN cli_reset_expiracion TIMESTAMP NULL;
