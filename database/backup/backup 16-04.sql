-- Active: 1776392829242@@127.0.0.1@3306@optica
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2025 a las 08:59:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes`
--

CREATE TABLE `ajustes` (
  `id` bigint(20) NOT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `valor` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ajustes`
--

INSERT INTO `ajustes` (`id`, `clave`, `valor`) VALUES
(1, 'nombre', 'MULTI SOLUCIONES R & V S.A.C.'),
(2, 'direccion', 'CAL.SANTA ROSA DE LIMA NRO. 355 P.J.  SANTA ROSA DE LIMA'),
(3, 'ruc', '20607693588'),
(4, 'logo', '9cdeaa7f5f85977fd3ecb49b78eeb379_Logo_SinFondo.png'),
(5, 'sliders', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` bigint(20) NOT NULL,
  `fecha_apertura` datetime(6) NOT NULL,
  `fecha_cierre` datetime(6) DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `total_ventas_efectivo` decimal(10,2) DEFAULT 0.00,
  `total_gastos` decimal(10,2) DEFAULT 0.00,
  `monto_final_esperado` decimal(10,2) DEFAULT 0.00,
  `monto_final_real` decimal(10,2) DEFAULT 0.00,
  `diferencia` decimal(10,2) DEFAULT 0.00,
  `estado` varchar(20) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` bigint(20) NOT NULL,
  `categ_nombre` varchar(100) NOT NULL,
  `categ_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categ_nombre`, `categ_estado`) VALUES
(1, 'Niños', 1),
(2, 'Hombre', 1),
(3, 'Mujer', 1),
(4, 'Unisex', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL,
  `cli_nombre` varchar(100) NOT NULL,
  `cli_apellido_paterno` varchar(255) DEFAULT NULL,
  `cli_apellido_materno` varchar(255) DEFAULT NULL,
  `cli_correo` varchar(255) DEFAULT NULL,
  `cli_telefono` varchar(255) DEFAULT NULL,
  `cli_direccion` varchar(255) NOT NULL,
  `cli_estado` int(11) NOT NULL DEFAULT 1,
  `cli_ndocumento` varchar(20) NOT NULL,
  `id_tipodocumento` bigint(20) NOT NULL,
  `cli_nombre_empresa` varchar(100) DEFAULT NULL,
  `cli_direccion_empresa` varchar(100) DEFAULT NULL,
  `cli_clave` varchar(255) DEFAULT NULL,
  `token_reseteo` varchar(255) DEFAULT NULL,
  `token_reseteo_expira` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `cli_nombre`, `cli_apellido_paterno`, `cli_apellido_materno`, `cli_correo`, `cli_telefono`, `cli_direccion`, `cli_estado`, `cli_ndocumento`, `id_tipodocumento`, `cli_nombre_empresa`, `cli_direccion_empresa`, `cli_clave`, `token_reseteo`, `token_reseteo_expira`) VALUES
(1, 'Clientes Varios', '', '', '', '', '', 1, '99999999', 1, NULL, NULL, NULL, NULL, NULL),
(2, 'UNIVERSIDAD TECNOLOGICA DEL PERU S.A.C. O UTP S.A.C.', '', '', '', '', 'CAL. NATALIO SANCHEZ NRO. 125 URB. SANTA BEATRIZ, LIMA, LIMA, LIMA', 1, '20462509236', 2, NULL, NULL, NULL, NULL, NULL),
(3, 'GONZALO ADRIANO', 'SANTOS', 'VARGAS', 'gonzaloadriano@gmail.com', '999888777', 'URB. QUINTA LAS CASUARINAS MZ. E LT. 4, YANAHUARA, AREQUIPA, AREQUIPA', 1, '74140240', 1, NULL, NULL, NULL, NULL, NULL),
(4, 'NELIDA', 'ESPIL', 'HERRERA', NULL, NULL, 'CALLE 9 ASOC. LOS CHASQUIS MZ. M LT. 18A, SAN MARTIN DE PORRES, LIMA, LIMA', 1, '74140241', 1, NULL, NULL, NULL, NULL, NULL),
(5, 'RUBEN JHOSBET', 'VIDAL', 'TICONA', NULL, NULL, 'TENIENTE RODRIGUEZ 410, MIRAFLORES, AREQUIPA, AREQUIPA', 1, '74140245', 1, NULL, NULL, NULL, NULL, NULL),
(6, 'DANILO BRYAN', 'VALDIVIA', 'LLAIQUE', NULL, NULL, 'AV. PERU 100 URB TUPAC AMARU, CERRO COLORADO, AREQUIPA, AREQUIPA', 1, '74140246', 1, NULL, NULL, NULL, NULL, NULL),
(7, 'JHONY WILBER', 'CCAPIRA', 'HUAMANI', NULL, NULL, 'AV. DEAN VALDIVIA AH. LEON DEL SUR MZ. K LT. 4, JACOBO HUNTER, AREQUIPA, AREQUIPA', 1, '74140243', 1, NULL, NULL, NULL, NULL, NULL),
(8, 'JEAN PABLO', 'VALDIVIA', 'LLAIQUE', NULL, NULL, 'AV. PERU 100 URB TUPAC AMARU, CERRO COLORADO, AREQUIPA, AREQUIPA', 1, '74140244', 1, NULL, NULL, NULL, NULL, NULL),
(9, 'JAIME ADOLFO', 'LOPEZ', 'SCIPION', NULL, NULL, 'CALLE 28 DE JULIO 830A, LAMBAYEQUE, LAMBAYEQUE, LAMBAYEQUE', 1, '74140248', 1, NULL, NULL, NULL, NULL, NULL),
(10, 'ANA LUCIA MARITA', 'MACHACA', 'MERINO', NULL, NULL, 'AV. EL CONDOR LA MELGARIANA MZ. C LT. 35, JOSE LUIS BUSTAMANTE Y RIVERO, AREQUIPA, AREQUIPA', 1, '74140247', 1, NULL, NULL, NULL, NULL, NULL),
(11, 'BANCO DE CREDITO DEL PERU', NULL, NULL, NULL, NULL, 'JR. CENTENARIO NRO. 156 URB. LADERAS DE MELGAREJO, LA MOLINA, LIMA, LIMA', 1, '20100047218', 2, NULL, NULL, NULL, NULL, NULL),
(12, 'PATRICIA NOEMIR', 'PERAMAS', 'RIVERA', NULL, NULL, 'ASENT.H. NUEVO HORIZONTE PACHACUTEC MZ. D LT. 05, VENTANILLA, PROV. CONST. DEL CALLAO, PROV. CONST. DEL CALLAO', 1, '43156393', 1, NULL, NULL, NULL, NULL, NULL),
(13, 'YAN MARCO', 'MONZON', 'SONCCO', NULL, NULL, 'UPIS PAISAJISTA MZ. M LT. 15, JACOBO HUNTER, AREQUIPA, AREQUIPA', 1, '74140249', 1, NULL, NULL, NULL, NULL, NULL),
(14, 'BANCO BBVA PERU', NULL, NULL, NULL, NULL, 'AV. REPUBLICA DE PANAMA NRO. 3055 URB. EL PALOMAR, SAN ISIDRO, LIMA, LIMA', 1, '20100130204', 2, NULL, NULL, NULL, NULL, NULL),
(15, 'Roger Paul', 'Velasco', 'ZAPATA', 'rogervz.1710@gmail.com', '945027855', 'CALLE SANTA ROSA 355, CHICLAYO, CHICLAYO, LAMBAYEQUE', 1, '72934888', 1, NULL, NULL, '$2a$10$VxganQeQBWaDi9XrL7Sd0uAJ.jdtTlOc72xeL9uFg0.DToff7pAN.', NULL, '2025-11-29 22:27:24.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `compra_fecha` datetime(6) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_proveedor` bigint(20) NOT NULL,
  `id_tipo_comprobante` int(11) DEFAULT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `deuda` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `forma_pago` enum('CONTADO','CREDITO') DEFAULT NULL,
  `medio_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','YAPE') DEFAULT NULL,
  `pago_inicial` decimal(10,2) DEFAULT NULL,
  `nota_recepcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_pagos_credito_detalle`
--

CREATE TABLE `compra_pagos_credito_detalle` (
  `id_compra_pago_detalle` bigint(20) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `medio_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','YAPE') DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `monto_pagado` decimal(10,2) DEFAULT NULL,
  `numero_cuota` int(11) NOT NULL,
  `id_compra` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` bigint(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `telefono_contacto` varchar(15) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_cliente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE `cotizacion_detalle` (
  `id_cotizacion_detalle` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_cotizacion` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id_compra` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `stock_previo` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `cantidad_recibida` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_producto` bigint(20) NOT NULL,
  `id_venta` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` bigint(20) NOT NULL,
  `emple_nombre` varchar(100) NOT NULL,
  `emple_nombreuser` varchar(50) NOT NULL,
  `emple_apellido_paterno` varchar(100) NOT NULL,
  `emple_apellido_materno` varchar(100) NOT NULL,
  `emple_correo` varchar(60) NOT NULL,
  `emple_contrasena` varchar(150) NOT NULL,
  `emple_telefono` varchar(9) NOT NULL,
  `emple_direccion` varchar(100) NOT NULL,
  `emple_estado` int(11) NOT NULL DEFAULT 1,
  `emple_ndocumento` varchar(20) NOT NULL,
  `id_tipodocumento` bigint(20) NOT NULL,
  `id_perfil` bigint(20) NOT NULL,
  `id_empresa` bigint(20) NOT NULL DEFAULT 1,
  `token_reseteo` varchar(255) DEFAULT NULL,
  `token_reseteo_expira` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `emple_nombre`, `emple_nombreuser`, `emple_apellido_paterno`, `emple_apellido_materno`, `emple_correo`, `emple_contrasena`, `emple_telefono`, `emple_direccion`, `emple_estado`, `emple_ndocumento`, `id_tipodocumento`, `id_perfil`, `id_empresa`, `token_reseteo`, `token_reseteo_expira`) VALUES
(1, 'Daryl', 'admin', 'Zamora', 'Zamora', 'luis@ejemplo.com', '$2a$10$OZuN1MJlw/01gIodlwqaQOKk.d5XhfbWAD8X2adyG9pkKtpDlVN1O', '111111111', 'Direccion Ficticia', 1, '11111111', 1, 1, 1, NULL, NULL),
(2, 'NELIDA', 'nespil', 'ESPIL', 'HERRERA', 'exorsnine@gmail.com', '$2a$10$3nchILzKTiG5Ra2t7CC0veoUx0RJDKh.WujPJEBZtCYlvJW1DVfQm', '999888777', 'CALLE 9 ASOC. LOS CHASQUIS MZ. M LT. 18A, SAN MARTIN DE PORRES, LIMA, LIMA', 1, '74140241', 1, 1, 1, NULL, NULL),
(3, 'ROGER PAUL', 'rvelasco', 'VELASCO', 'ZAPATA', 'rogervz.1710@gmail.com', '$2a$10$0R9SdMfE/dDaK9uBtbKOdO0xsjHlAuQG27qrJEvXgs6jbQ8fbvPQm', '945027855', 'CALLE SANTA ROSA 355, CHICLAYO, CHICLAYO, LAMBAYEQUE', 2, '72934888', 1, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` bigint(20) NOT NULL,
  `empresa_nombre` varchar(100) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL,
  `empresa_ruc` varchar(11) NOT NULL,
  `empresa_logo` varchar(255) NOT NULL,
  `empresa_sidebar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `empresa_nombre`, `empresa_direccion`, `empresa_ruc`, `empresa_logo`, `empresa_sidebar`) VALUES
(1, 'MULTI SOLUCIONES R & V S.A.C.', 'CAL.SANTA ROSA DE LIMA NRO. 355 P.J.  SANTA ROSA DE LIMA', '20607693588', '173e8f21-e429-4432-a441-d9dd46761622_opt_logo.jpg', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_sidebar_imagen`
--

CREATE TABLE `empresa_sidebar_imagen` (
  `id_imagen` bigint(20) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL,
  `id_empresa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa_sidebar_imagen`
--

INSERT INTO `empresa_sidebar_imagen` (`id_imagen`, `ruta_imagen`, `id_empresa`) VALUES
(14, 'df84450e-1eae-47af-a734-1370cc907b4e_17160417-e887-4f06-9f35-e209e35e815e_Lentes3.jpg', 1),
(15, '6b5daea0-635d-49e5-b544-4e7f1d0bdc9d_b8e87c26-ce9b-4f02-8b09-7edb41307a73_Lentes4.jpg', 1),
(16, 'b88ea54a-3256-4b65-b723-0335a4c7ac46_d5dd8445-ee1b-4204-adfb-747d217037b5_Lentes2.jpg', 1),
(17, 'f448d3cd-b840-456a-b3e6-0268251a13f1_d551a89c-4b7e-453a-a014-5c299dca2fec_Lentes1.jpg', 1),
(18, '8b463a7f-c4a2-43b8-b077-7053ebc459b0_len-sol-uni.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_fpago` bigint(20) NOT NULL,
  `fpago_metodo` varchar(15) DEFAULT NULL,
  `fpago_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_fpago`, `fpago_metodo`, `fpago_estado`) VALUES
(1, 'Tarjeta de Cred', 1),
(2, 'Efectivo', 1),
(3, 'Pago Movil', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id_gasto` bigint(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `id_caja` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` bigint(20) NOT NULL,
  `marca_nombre` varchar(100) NOT NULL,
  `marca_fecha` date DEFAULT NULL,
  `marca_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `marca_nombre`, `marca_fecha`, `marca_estado`) VALUES
(1, 'Gucci', NULL, 1),
(2, 'Marca02', '2025-08-26', 1),
(3, 'Marca03', '2025-08-26', 1),
(4, 'Marca04', '2025-08-26', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id_opcion` bigint(20) NOT NULL,
  `opcion_nombre` varchar(100) NOT NULL,
  `opcion_ruta` varchar(100) DEFAULT NULL,
  `opcion_icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id_opcion`, `opcion_nombre`, `opcion_ruta`, `opcion_icon`) VALUES
(1, 'Dashboard', '/', NULL),
(2, 'Configuración', '/empresa/configuracion', NULL),
(3, 'Listar Usuarios', '/usuarios/listar', NULL),
(4, 'Perfiles', '/usuarios/perfiles/listar', NULL),
(5, 'Clientes', '/clientes/listar', NULL),
(6, 'Listar Productos', '/productos/listar', NULL),
(7, 'Categorías', '/productos/categorias/listar', NULL),
(8, 'Marcas', '/productos/marcas/listar', NULL),
(9, 'Unidad', '/productos/unidades/listar', NULL),
(10, 'Listar Proveedores', '/proveedores/listar', NULL),
(11, 'Ordenes de Compra', '/compras/listar', NULL),
(12, 'Movimientos', '/inventario/listar', NULL),
(13, 'Ventas', '/ventas/listar', NULL),
(14, 'Gestión de Cotizacion', '/ventas/cotizacion/listar', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_credito_detalle`
--

CREATE TABLE `pagos_credito_detalle` (
  `id_pago_detalle` bigint(20) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `medio_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','YAPE') DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `monto_pagado` decimal(10,2) DEFAULT NULL,
  `numero_cuota` int(11) NOT NULL,
  `id_venta` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` bigint(20) NOT NULL,
  `perfil_nombre` varchar(50) NOT NULL,
  `perfil_descripcion` varchar(255) DEFAULT NULL,
  `perfil_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `perfil_nombre`, `perfil_descripcion`, `perfil_estado`) VALUES
(1, 'Administrador', 'Acceso total al sistema.', 1),
(2, 'Editor', 'Puede gestionar usuarios pero no perfiles.', 1),
(3, 'Supervisor', 'Solo puede visualizar información.', 1),
(4, 'Cliente', 'Solo puede ver los catálogos y realizar compras.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_opcion`
--

CREATE TABLE `perfil_opcion` (
  `id_perfil` bigint(20) NOT NULL,
  `id_opcion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil_opcion`
--

INSERT INTO `perfil_opcion` (`id_perfil`, `id_opcion`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(2, 1),
(2, 2),
(3, 1),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` bigint(20) NOT NULL,
  `produc_nombre` varchar(255) NOT NULL,
  `produc_codigo` varchar(255) NOT NULL,
  `produc_modelo` varchar(255) DEFAULT NULL,
  `produc_descripcion` varchar(255) NOT NULL,
  `produc_precio` decimal(38,2) DEFAULT NULL,
  `produc_fecha_creacion` date DEFAULT NULL,
  `produc_fecha_vencimiento` date DEFAULT NULL,
  `produc_stock` int(11) DEFAULT 0,
  `produc_stock_minimo` int(11) DEFAULT 1,
  `produc_imagen` varchar(255) DEFAULT NULL,
  `produc_estado` int(11) NOT NULL DEFAULT 1,
  `id_unidad` int(11) NOT NULL,
  `id_categoria` bigint(20) NOT NULL,
  `id_marca` bigint(20) NOT NULL,
  `produc_costo` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `produc_nombre`, `produc_codigo`, `produc_modelo`, `produc_descripcion`, `produc_precio`, `produc_fecha_creacion`, `produc_fecha_vencimiento`, `produc_stock`, `produc_stock_minimo`, `produc_imagen`, `produc_estado`, `id_unidad`, `id_categoria`, `id_marca`, `produc_costo`) VALUES
(1, 'Lentes de sol', '11223344', NULL, 'Test', 100.00, NULL, NULL, 100, 10, NULL, 2, 1, 4, 3, 50.00),
(2, 'Lentes ópticos', '55667788', NULL, 'Lentes ópticos graduados', 250.00, NULL, NULL, 13, 3, NULL, 2, 1, 3, 3, 80.00),
(3, 'Lentes de lectura', '33445566', NULL, 'Lentes de lectura ligeros', 90.00, NULL, NULL, 15, 5, NULL, 2, 1, 3, 1, 30.00),
(4, 'Gafas polarizadas', '22334455', NULL, 'Protección UV y polarización', 120.00, NULL, NULL, 18, 4, NULL, 2, 1, 4, 2, 40.00),
(5, 'Prueba', '11335566', NULL, 'Prueba', 100.00, NULL, NULL, 20, 10, NULL, 2, 1, 4, 2, 30.00),
(6, 'Lentes Animal Prints', '12344321', NULL, 'Lentes con impresión de animales', 200.00, NULL, NULL, 18, 10, 'mujer/6/f743b65c69e9c2c949ef66bc4a322efc_lenteanimalprints.jpeg', 1, 1, 3, 1, 50.00),
(7, 'Lentes con clips polarizados', '12344322', NULL, '', 250.00, NULL, NULL, 25, 5, 'mujer/7/ea4d83a622544c8391b838bca57f9e6e_lentesconclipporalizados.jpeg', 1, 1, 3, 2, 60.00),
(8, 'Lentes de protección contra luz azul', '12344323', NULL, '', 300.00, NULL, NULL, 11, 5, 'mujer/8/ad635c3cb04c5f8d51ce6960e891c0ed_lentesconproteccionluzazul.jpeg', 1, 1, 3, 3, 70.00),
(9, 'Lentes estilizados', '12344324', NULL, '', 200.00, NULL, NULL, 18, 5, 'mujer/9/442085479ebf2420ebe36126c76e4390_lentesconclipporalizados.jpeg', 1, 1, 3, 3, 70.00),
(10, 'Lentes cat', '12344325', NULL, '', 100.00, NULL, NULL, 16, 3, 'mujer/10/0202892f84b3d4fa31bbbab0548069ca_lentestipocat.jpeg', 1, 1, 3, 3, 60.00),
(11, 'Lentes con armazón', '12344326', NULL, '', 100.00, NULL, NULL, 10, 5, 'hombre/11/99979aa28f88275a06ff4060bb26a74b_lentesArmazones.jpg,hombre/11/539c689fee60130b76b1d1ec125c5568_lentesArmozones-ConEstuche.webp,hombre/11/38cb609ba0f264b77c98ea34a0ef42c4_lentesbestarmazones.jpg', 1, 1, 2, 2, 30.00),
(12, 'Lentes de lectura', '12344327', NULL, '', 200.00, NULL, NULL, 19, 5, 'hombre/12/a76c56162018cc446bf781d5b3d8dd97_lentesLowpi.jpg', 1, 1, 2, 2, 40.00),
(13, 'Lentes de marco dorado', '12344328', NULL, '', 200.00, NULL, NULL, 51, 10, 'hombre/13/5c9c6b71ade52094b20c4174fcdb77ee_LentesMarcoDorado.jpg', 1, 1, 2, 2, 35.00),
(14, 'Lentes nano indestructibles', '12344329', NULL, '', 150.00, NULL, NULL, 19, 5, 'ninos/14/8ed37d91d848a686bd95f3483f234d34_LentesNanoIndestructibles-Azul.jpg,ninos/14/31f164f764147aab5faba5e21dbd3b5a_LentesNanoIndestructibles-Oscuros.jpg,ninos/14/513df5b025b4386103366679d2b880ce_LentesNanoIndestructibles-Rojo.jpg', 1, 1, 1, 1, 30.00),
(15, 'Lentes nano de silicona', '12344330', NULL, '', 100.00, NULL, NULL, 14, 5, 'ninos/15/5e44f53ef958246b35203d9442885044_LentesNano-Morado.jpg', 1, 1, 1, 2, 30.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` bigint(20) NOT NULL,
  `provee_nombre` varchar(100) NOT NULL,
  `provee_nombre_comercial` varchar(100) NOT NULL,
  `provee_nacionalidad` varchar(100) NOT NULL,
  `provee_direccion` varchar(100) NOT NULL,
  `provee_telefono` varchar(255) DEFAULT NULL,
  `provee_correo` varchar(255) DEFAULT NULL,
  `provee_correo_adicional` varchar(150) DEFAULT NULL,
  `provee_estado` int(11) NOT NULL DEFAULT 1,
  `provee_ndocumento` varchar(11) NOT NULL,
  `id_tipodocumento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `provee_nombre`, `provee_nombre_comercial`, `provee_nacionalidad`, `provee_direccion`, `provee_telefono`, `provee_correo`, `provee_correo_adicional`, `provee_estado`, `provee_ndocumento`, `id_tipodocumento`) VALUES
(1, 'LENTES OPTICOS S.A.C.', 'LENTES OPTICOS S.A.C.', 'Peruana', 'MZ. F LT. 16 GRU. 14 SECTOR 2', '999888777', 'correo@correo.com', NULL, 1, '20601997534', 2),
(2, 'UNIVERSIDAD TECNOLOGICA DEL PERU S.A.C. O UTP S.A.C.', 'UNIVERSIDAD TECNOLOGICA DEL PERU S.A.C. O UTP S.A.C.', 'Peruana', 'CAL. NATALIO SANCHEZ NRO. 125 URB. SANTA BEATRIZ', '999888778', 'micorreo@gmail.com', NULL, 1, '20462509236', 2),
(3, 'MULTI SOLUCIONES R & V S.A.C.', 'MULTI SOLUCIONES R & V S.A.C.', 'Peruana', 'CAL. SANTA ROSA DE LIMA NRO. 355 P.J. SANTA ROSA DE LIMA, CHICLAYO, CHICLAYO, LAMBAYEQUE', NULL, NULL, NULL, 1, '20607693588', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante`
--

CREATE TABLE `tipo_comprobante` (
  `id` int(11) NOT NULL,
  `correlativo_actual` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_comprobante`
--

INSERT INTO `tipo_comprobante` (`id`, `correlativo_actual`, `estado`, `nombre`, `serie`) VALUES
(1, 12, 1, 'NOTA DE VENTA', 'N001'),
(2, 5, 1, 'BOLETA', 'B001'),
(3, 5, 1, 'FACTURA', 'F001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipodocumento` bigint(20) NOT NULL,
  `tipodoc_nombre` varchar(255) DEFAULT NULL,
  `tipodoc_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipodocumento`, `tipodoc_nombre`, `tipodoc_estado`) VALUES
(1, 'DNI', 1),
(2, 'RUC', 1),
(3, 'Carné de Extranjería', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_venta`
--

CREATE TABLE `tipo_venta` (
  `id_tipoventa` bigint(20) NOT NULL,
  `tipoventa_nombre` varchar(50) NOT NULL,
  `tipoventa_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_venta`
--

INSERT INTO `tipo_venta` (`id_tipoventa`, `tipoventa_nombre`, `tipoventa_estado`) VALUES
(1, 'Al contado', 1),
(2, 'Al Crédito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id_unidad` int(11) NOT NULL,
  `uni_nombre` varchar(255) NOT NULL,
  `uni_estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `uni_nombre`, `uni_estado`) VALUES
(1, 'Unidades', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `deuda` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `forma_pago` enum('CONTADO','CREDITO') DEFAULT NULL,
  `medio_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','YAPE') DEFAULT NULL,
  `numero_documento` varchar(20) DEFAULT NULL,
  `pago_inicial` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_tipo_comprobante` int(11) DEFAULT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `venta_fecha` datetime(6) DEFAULT NULL,
  `id_cotizacion` bigint(20) DEFAULT NULL,
  `tasa_interes` decimal(5,2) DEFAULT 0.00,
  `evaluacion_crediticia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`),
  ADD KEY `FK_Usuario_Caja` (`id_usuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `categ_nombre` (`categ_nombre`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `FK_TipoDoc_Cliente` (`id_tipodocumento`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `FKo158ix00ljn91uet4xv15fq7o` (`id_proveedor`),
  ADD KEY `FKmxy9j2xp5r9tt8b9glmt2eyax` (`id_tipo_comprobante`),
  ADD KEY `FKg89bygbsyxpcgb83u1p46xgr4` (`id_usuario`);

--
-- Indices de la tabla `compra_pagos_credito_detalle`
--
ALTER TABLE `compra_pagos_credito_detalle`
  ADD PRIMARY KEY (`id_compra_pago_detalle`),
  ADD KEY `FKloxsysuld0jk0h3sa71jhk9n8` (`id_compra`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `FKnr8oxstwxh7rpntt36t01nxd` (`id_cliente`);

--
-- Indices de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  ADD PRIMARY KEY (`id_cotizacion_detalle`),
  ADD KEY `FKgh9i74gdpkvai7t9uyq2c73v8` (`id_cotizacion`),
  ADD KEY `FKgtt14qis5y1ugjieivup0hpa` (`id_producto`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id_compra`,`id_producto`),
  ADD KEY `FKc63p8dvdpsuniib9axx8j6i4l` (`id_producto`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_producto`,`id_venta`),
  ADD KEY `FKkmoe7spkf9amgos61a18xs147` (`id_venta`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `emple_nombreuser` (`emple_nombreuser`),
  ADD UNIQUE KEY `emple_correo` (`emple_correo`),
  ADD UNIQUE KEY `emple_telefono` (`emple_telefono`),
  ADD UNIQUE KEY `emple_ndocumento` (`emple_ndocumento`),
  ADD KEY `FK_TipoDoc_Empleado` (`id_tipodocumento`),
  ADD KEY `FK_Perfil_Empleado` (`id_perfil`),
  ADD KEY `FK_Empresa_Empleado` (`id_empresa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `empresa_sidebar_imagen`
--
ALTER TABLE `empresa_sidebar_imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `FK_Empresa_Sidebar` (`id_empresa`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_fpago`),
  ADD UNIQUE KEY `fpago_metodo` (`fpago_metodo`);

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id_gasto`),
  ADD KEY `FK_Caja_Gasto` (`id_caja`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id_opcion`);

--
-- Indices de la tabla `pagos_credito_detalle`
--
ALTER TABLE `pagos_credito_detalle`
  ADD PRIMARY KEY (`id_pago_detalle`),
  ADD KEY `FKqqmd90c5e7abf82oaa8052y7u` (`id_venta`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `perfil_nombre` (`perfil_nombre`);

--
-- Indices de la tabla `perfil_opcion`
--
ALTER TABLE `perfil_opcion`
  ADD PRIMARY KEY (`id_perfil`,`id_opcion`),
  ADD KEY `FK_Opcion` (`id_opcion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_Unidad_Produc` (`id_unidad`),
  ADD KEY `FK_Catego_Produc` (`id_categoria`),
  ADD KEY `FK_Marca_Produc` (`id_marca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `provee_nombre` (`provee_nombre`),
  ADD KEY `FK_TipoDoc_Proveedor` (`id_tipodocumento`);

--
-- Indices de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipodocumento`),
  ADD UNIQUE KEY `tipodoc_nombre` (`tipodoc_nombre`);

--
-- Indices de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  ADD PRIMARY KEY (`id_tipoventa`),
  ADD UNIQUE KEY `tipoventa_nombre` (`tipoventa_nombre`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id_unidad`),
  ADD UNIQUE KEY `uni_nombre` (`uni_nombre`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `FK_Cliente_Venta` (`id_cliente`),
  ADD KEY `FKeofpgsq7k2s96kmc102p79y0a` (`id_tipo_comprobante`),
  ADD KEY `FKngd2by0oq0noh796aom37hcj` (`id_usuario`),
  ADD KEY `FKrpki5motc0ftufmsd3kvv0qbb` (`id_cotizacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_pagos_credito_detalle`
--
ALTER TABLE `compra_pagos_credito_detalle`
  MODIFY `id_compra_pago_detalle` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  MODIFY `id_cotizacion_detalle` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa_sidebar_imagen`
--
ALTER TABLE `empresa_sidebar_imagen`
  MODIFY `id_imagen` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_fpago` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id_gasto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id_opcion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos_credito_detalle`
--
ALTER TABLE `pagos_credito_detalle`
  MODIFY `id_pago_detalle` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipodocumento` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  MODIFY `id_tipoventa` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `FK_Usuario_Caja` FOREIGN KEY (`id_usuario`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_TipoDoc_Cliente` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipo_documento` (`id_tipodocumento`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FKg89bygbsyxpcgb83u1p46xgr4` FOREIGN KEY (`id_usuario`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `FKmxy9j2xp5r9tt8b9glmt2eyax` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `tipo_comprobante` (`id`),
  ADD CONSTRAINT `FKo158ix00ljn91uet4xv15fq7o` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `compra_pagos_credito_detalle`
--
ALTER TABLE `compra_pagos_credito_detalle`
  ADD CONSTRAINT `FKloxsysuld0jk0h3sa71jhk9n8` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `FKnr8oxstwxh7rpntt36t01nxd` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  ADD CONSTRAINT `FKgh9i74gdpkvai7t9uyq2c73v8` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `FKgtt14qis5y1ugjieivup0hpa` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `FKc63p8dvdpsuniib9axx8j6i4l` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FKnqbfy3qgk6t914vr73idr5ggq` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `FKeksv16ui7t2k5alv3efkrvc6c` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FKkmoe7spkf9amgos61a18xs147` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_Perfil_Empleado` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  ADD CONSTRAINT `FK_TipoDoc_Empleado` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipo_documento` (`id_tipodocumento`),
  ADD CONSTRAINT `FKaph0gjj93d3xrkx7ixnua3hny` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `empresa_sidebar_imagen`
--
ALTER TABLE `empresa_sidebar_imagen`
  ADD CONSTRAINT `FK_Empresa_Sidebar` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD CONSTRAINT `FK_Caja_Gasto` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`);

--
-- Filtros para la tabla `pagos_credito_detalle`
--
ALTER TABLE `pagos_credito_detalle`
  ADD CONSTRAINT `FKqqmd90c5e7abf82oaa8052y7u` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `perfil_opcion`
--
ALTER TABLE `perfil_opcion`
  ADD CONSTRAINT `FK_Opcion` FOREIGN KEY (`id_opcion`) REFERENCES `opcion` (`id_opcion`),
  ADD CONSTRAINT `FK_Perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_Catego_Produc` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `FK_Marca_Produc` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  ADD CONSTRAINT `FK_Unidad_Produc` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `FK_TipoDoc_Proveedor` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipo_documento` (`id_tipodocumento`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_Cliente_Venta` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FKeofpgsq7k2s96kmc102p79y0a` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `tipo_comprobante` (`id`),
  ADD CONSTRAINT `FKngd2by0oq0noh796aom37hcj` FOREIGN KEY (`id_usuario`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `FKrpki5motc0ftufmsd3kvv0qbb` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
