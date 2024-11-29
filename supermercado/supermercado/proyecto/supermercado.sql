-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-11-2024 a las 15:42:52
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--
CREATE DATABASE IF NOT EXISTS `sistema` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sistema`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `cod_categoria` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `descripcion`) VALUES
(1, 'Lacteos'),
(2, 'Abarrotes'),
(3, 'Jugos'),
(4, 'Semillas'),
(5, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `clave` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` float NOT NULL,
  `existencia` int NOT NULL,
  `imagen` varchar(30) NOT NULL,
  `cod_categoria` int NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `cod_categoria` (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`clave`, `nombre`, `precio`, `existencia`, `imagen`, `cod_categoria`) VALUES
(1, 'Leche', 13.5, 10, 'leche.jpg', 1),
(2, 'Queso Panela', 50, 4, 'queso.jpg', 1),
(4, 'Jugo de Naranja', 18, 30, 'jugo.jpg', 2),
(5, 'Cloro', 38, 4, 'cloro.jpg', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `cod_usuario` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `perfil` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod_usuario`, `nombre`, `login`, `password`, `perfil`) VALUES
(1, 'Juan Perez', 'jperez', 'juanito', 'Administrador'),
(2, 'Luis Gomez', 'lgomez', 'luisito', 'Vendedor'),
(3, 'Sandra Sanchez', 'ssanchez', 'sandrita', 'Cliente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`cod_categoria`);
--
-- Base de datos: `supermercado`
--
CREATE DATABASE IF NOT EXISTS `supermercado` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supermercado`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion_cliente`
--

DROP TABLE IF EXISTS `atencion_cliente`;
CREATE TABLE IF NOT EXISTS `atencion_cliente` (
  `nombre_cliente` varchar(45) NOT NULL,
  `asunto` varchar(60) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`nombre_cliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atencion_cliente`
--

INSERT INTO `atencion_cliente` (`nombre_cliente`, `asunto`, `estado`, `fecha_creacion`) VALUES
('', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `num_factura` int NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `monto` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`num_factura`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`num_factura`, `cliente`, `monto`, `fecha`) VALUES
(5555, 'pedro', 2000, '2023-04-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finanzas`
--

DROP TABLE IF EXISTS `finanzas`;
CREATE TABLE IF NOT EXISTS `finanzas` (
  `num_registro` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`num_registro`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `finanzas`
--

INSERT INTO `finanzas` (`num_registro`, `descripcion`, `monto`, `fecha`, `tipo`) VALUES
(1, 'compra', '2100', '2222-02-11', 'Ingreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inteligencia_negocios`
--

DROP TABLE IF EXISTS `inteligencia_negocios`;
CREATE TABLE IF NOT EXISTS `inteligencia_negocios` (
  `nombre` varchar(50) NOT NULL,
  `correo_electronico` varchar(40) NOT NULL,
  `sugerencias` varchar(60) NOT NULL,
  `reporte` text NOT NULL,
  PRIMARY KEY (`correo_electronico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `num_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`num_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`num_producto`, `cantidad`, `precio`) VALUES
(13, 123, '12'),
(111, 111, '11111'),
(1000, 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos_humanos`
--

DROP TABLE IF EXISTS `recursos_humanos`;
CREATE TABLE IF NOT EXISTS `recursos_humanos` (
  `num_empleado` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `departamento` varchar(40) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  PRIMARY KEY (`num_empleado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recursos_humanos`
--

INSERT INTO `recursos_humanos` (`num_empleado`, `nombre`, `puesto`, `departamento`, `fecha_contratacion`) VALUES
(22222, 'axel', 'gerente', 'gerencia', '0222-02-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `nombre` varchar(50) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `contraseña`) VALUES
('axel', '12345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `num_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `producto` varchar(50) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`num_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Base de datos: `tienda_informatica`
--
CREATE DATABASE IF NOT EXISTS `tienda_informatica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tienda_informatica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

DROP TABLE IF EXISTS `boleto`;
CREATE TABLE IF NOT EXISTS `boleto` (
  `num_boleto` int NOT NULL,
  `destino` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int NOT NULL,
  `hora_salida` int NOT NULL,
  `nombre_pasajero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`num_boleto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--
-- Error leyendo la estructura de la tabla tienda_informatica.clientes: #1017 - No puedo encontrar archivo: 'clientes' (Error: 2 - No such file or directory)
-- Error leyendo datos de la tabla tienda_informatica.clientes: #1017 - No puedo encontrar archivo: 'clientes' (Error: 2 - No such file or directory)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--
-- Error leyendo la estructura de la tabla tienda_informatica.compra: #1017 - No puedo encontrar archivo: 'compra' (Error: 2 - No such file or directory)
-- Error leyendo datos de la tabla tienda_informatica.compra: #1017 - No puedo encontrar archivo: 'compra' (Error: 2 - No such file or directory)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

DROP TABLE IF EXISTS `conductor`;
CREATE TABLE IF NOT EXISTS `conductor` (
  `nombre_conductor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_unidad` int NOT NULL,
  `num_emleado` int NOT NULL,
  PRIMARY KEY (`num_emleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
CREATE TABLE IF NOT EXISTS `pasajero` (
  `nombre_pasajero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_electronico` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pasajero` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_conductor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`correo_electronico`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Error leyendo la estructura de la tabla tienda_informatica.productos: #1017 - No puedo encontrar archivo: 'productos' (Error: 2 - No such file or directory)
-- Error leyendo datos de la tabla tienda_informatica.productos: #1017 - No puedo encontrar archivo: 'productos' (Error: 2 - No such file or directory)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--
-- Error leyendo la estructura de la tabla tienda_informatica.proveedores: #1017 - No puedo encontrar archivo: 'proveedores' (Error: 2 - No such file or directory)
-- Error leyendo datos de la tabla tienda_informatica.proveedores: #1017 - No puedo encontrar archivo: 'proveedores' (Error: 2 - No such file or directory)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_productos`
--
-- Error leyendo la estructura de la tabla tienda_informatica.proveedores_productos: #1017 - No puedo encontrar archivo: 'proveedores_productos' (Error: 2 - No such file or directory)
-- Error leyendo datos de la tabla tienda_informatica.proveedores_productos: #1017 - No puedo encontrar archivo: 'proveedores_productos' (Error: 2 - No such file or directory)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

DROP TABLE IF EXISTS `unidad`;
CREATE TABLE IF NOT EXISTS `unidad` (
  `num_unidad` int NOT NULL,
  `matricula` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`num_unidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo_usuario` int NOT NULL,
  `perfil` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contraseña` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`codigo_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Base de datos: `transportes_turisticos`
--
CREATE DATABASE IF NOT EXISTS `transportes_turisticos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `transportes_turisticos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

DROP TABLE IF EXISTS `boleto`;
CREATE TABLE IF NOT EXISTS `boleto` (
  `num_boleto` int NOT NULL,
  `origen` varchar(30) NOT NULL,
  `destino` varchar(35) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `boleto`
--

INSERT INTO `boleto` (`num_boleto`, `origen`, `destino`, `fecha`, `hora`) VALUES
(0, 'morelia', 'oaxaca', '2024-05-30', '12:00:00'),
(0, 'oaxaca', 'puerto escondido', '2024-05-28', '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
CREATE TABLE IF NOT EXISTS `pasajero` (
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(33) NOT NULL,
  `correo_electronico` varchar(20) NOT NULL,
  `tipo_pasajero` varchar(20) NOT NULL,
  PRIMARY KEY (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`nombre`, `apellidos`, `correo_electronico`, `tipo_pasajero`) VALUES
('axel', 'osorio cruz', '1901711x@umich.mx', 'estudiante'),
('maria', 'perez', 'mariaperez24@gmail.c', 'adulto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

DROP TABLE IF EXISTS `salidas`;
CREATE TABLE IF NOT EXISTS `salidas` (
  `origen` varchar(35) NOT NULL,
  `destino` varchar(33) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `nombre` varchar(30) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `contraseña`) VALUES
('administrador', 'admi2024');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
