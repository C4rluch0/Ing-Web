-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-12-2025 a las 13:17:08
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_aprendizaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes_sesion`
--

DROP TABLE IF EXISTS `participantes_sesion`;
CREATE TABLE IF NOT EXISTS `participantes_sesion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_sesion` varchar(100) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `apodo` varchar(50) NOT NULL,
  `puntos` int DEFAULT '0',
  `fecha_union` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_participante` (`codigo_sesion`,`usuario_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tema_id` int NOT NULL,
  `pregunta` text NOT NULL,
  `tipo` enum('multiple','verdadero_falso') NOT NULL,
  `opciones` json DEFAULT NULL,
  `respuesta_correcta` varchar(255) NOT NULL,
  `puntos` int DEFAULT '10',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tema_id` (`tema_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `tema_id`, `pregunta`, `tipo`, `opciones`, `respuesta_correcta`, `puntos`, `activo`, `fecha_creacion`, `usuario_id`) VALUES
(30, 6, '¿El comando UPDATE se utiliza para cambiar los datos existentes en una más filas de una tabla?\r\n', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'true', 70, 1, '2025-12-09 01:14:37', 10),
(24, 6, 'dfsada', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'true', 10, 1, '2025-12-08 21:40:27', 1),
(25, 6, '¿Cuál es la consulta para insertar elementos en la base de datos?', 'multiple', '{\"a\": \"DELETE\", \"b\": \"INSERT\", \"c\": \"UPDATE\", \"d\": \"SELECT\"}', 'b', 25, 1, '2025-12-09 01:01:31', 10),
(26, 6, '¿SQL significa Structured Query Languaje?', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'true', 50, 1, '2025-12-09 01:09:08', 10),
(27, 6, '¿La sentencia SELECT se utiliza para modificar datos existentes en una tabla?', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'false', 50, 1, '2025-12-09 01:09:58', 10),
(28, 6, '¿La clausula WHERE se utiliza para especificar una condición y filtrar las filas devueltas por una consulta?', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'true', 50, 1, '2025-12-09 01:11:33', 10),
(29, 6, '¿El comando INSERT INTO se utiliza para eliminar una tabla completa de la base de datos?', 'verdadero_falso', '{\"true\": \"Verdadero\", \"false\": \"Falso\"}', 'false', 50, 1, '2025-12-09 01:12:57', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

DROP TABLE IF EXISTS `premios`;
CREATE TABLE IF NOT EXISTS `premios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT 'default_premio.png',
  `nivel_requerido` enum('novato','basico','intermedio','avanzado','experto') NOT NULL,
  `puntos_requeridos` int DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `premios`
--

INSERT INTO `premios` (`id`, `nombre`, `descripcion`, `imagen`, `nivel_requerido`, `puntos_requeridos`, `activo`, `fecha_creacion`) VALUES
(1, 'Novato PHP', 'Primer logro en PHP', 'default_premio.png', 'basico', 50, 1, '2025-12-02 19:58:51'),
(2, 'Experto en PHP', 'Dominio completo de PHP', 'default_premio.png', 'experto', 1000, 1, '2025-12-02 19:58:51'),
(3, 'Campeón JavaScript', 'Maestría en JavaScript', 'default_premio.png', 'avanzado', 800, 1, '2025-12-02 19:58:51'),
(4, '🎉 Novato del Sistema', 'Primer ingreso al sistema', 'default_premio.png', 'basico', 0, 1, '2025-12-04 16:13:21'),
(5, '🏆 PHP Básico', 'Completaste el nivel básico de PHP', 'default_premio.png', 'basico', 100, 1, '2025-12-04 16:13:21'),
(6, '💎 JavaScript Intermedio', 'Dominas JavaScript a nivel intermedio', 'default_premio.png', 'intermedio', 300, 1, '2025-12-04 16:13:21'),
(7, '👑 Maestro Laravel', 'Experto en el framework Laravel', 'default_premio.png', 'avanzado', 500, 1, '2025-12-04 16:13:21'),
(8, '🚀 Experto Total', 'Has alcanzado el nivel máximo de conocimiento', 'default_premio.png', 'experto', 1000, 1, '2025-12-04 16:13:21'),
(9, '📚 Coleccionista de Preguntas', 'Creaste 10 preguntas en el sistema', 'default_premio.png', 'basico', 0, 1, '2025-12-04 16:13:21'),
(10, '🎯 Creador de Sets', 'Creaste 5 sets de preguntas', 'default_premio.png', 'intermedio', 0, 1, '2025-12-04 16:13:21'),
(11, '👥 Multijugador Pro', 'Participaste en 10 partidas multijugador', 'default_premio.png', 'avanzado', 0, 1, '2025-12-04 16:13:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_multijugador`
--

DROP TABLE IF EXISTS `sesiones_multijugador`;
CREATE TABLE IF NOT EXISTS `sesiones_multijugador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_id` int NOT NULL,
  `codigo_sesion` varchar(100) NOT NULL,
  `usuario_creador` int NOT NULL,
  `estado` enum('activa','en_juego','finalizada') DEFAULT 'activa',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_sesion` (`codigo_sesion`),
  KEY `set_id` (`set_id`),
  KEY `usuario_creador` (`usuario_creador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sets_preguntas`
--

DROP TABLE IF EXISTS `sets_preguntas`;
CREATE TABLE IF NOT EXISTS `sets_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tema_id` int NOT NULL,
  `nivel` enum('basico','intermedio','avanzado','experto') NOT NULL,
  `codigo_qr` varchar(100) NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_qr` (`codigo_qr`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tema_id` (`tema_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sets_preguntas`
--

INSERT INTO `sets_preguntas` (`id`, `usuario_id`, `nombre`, `descripcion`, `tema_id`, `nivel`, `codigo_qr`, `fecha_creacion`, `activo`) VALUES
(1, 1, 'pepe', 'albion inline es un mmorpg no lineal en el que creas tu propia historia', 1, 'intermedio', 'SET_692f9290b063f_1764725392', '2025-12-02 20:29:52', 1),
(2, 1, 'pepe', 'albion inline es un mmorpg no lineal en el que creas tu propia historia', 1, 'intermedio', 'SET_692f92bad5d24_1764725434', '2025-12-02 20:30:34', 1),
(3, 1, 'ismael (de colon)', 'erfgasdvdv', 5, 'avanzado', 'SET_1_1764726033_9855', '2025-12-02 20:40:33', 1),
(4, 1, 'ismael (de colon)', 'erfgasdvdv', 5, 'avanzado', 'SET_1_1764726132_3497', '2025-12-02 20:42:12', 1),
(5, 1, 'Carlos', 'nuvliyvyliyv', 2, 'intermedio', 'SET_1_1764727476_9955', '2025-12-02 21:04:36', 1),
(6, 2, 'python', 'ññññññññ', 7, 'intermedio', 'SET_2_1764938037_1210', '2025-12-05 07:33:57', 1),
(7, 1, 'SQL', 'dddddddddd', 6, 'basico', 'SET_1_1765080193_4790', '2025-12-06 23:03:13', 1),
(8, 1, 'SQL', 'dddddddddd', 6, 'basico', 'SET_1_1765080216_4729', '2025-12-06 23:03:36', 1),
(9, 1, 'prueba', 'espero que funcione', 6, 'basico', 'SET_1_1765082265_9739', '2025-12-06 23:37:45', 1),
(10, 1, 'prueba', 'espero que funcione', 6, 'basico', 'SET_1_1765082274_5908', '2025-12-06 23:37:54', 1),
(11, 1, 'Prueba 2', 'vsfawfda', 6, 'basico', 'SET_1_1765082585_5307', '2025-12-06 23:43:05', 1),
(12, 1, 'Prueba 2', 'vsfawfda', 6, 'basico', 'SET_1_1765082590_6332', '2025-12-06 23:43:10', 1),
(13, 1, 'Prueba 2', 'vsfawfda', 6, 'basico', 'SET_1_1765082648_5165', '2025-12-06 23:44:08', 1),
(14, 1, 'lll', 'mnlkn', 7, 'basico', 'SET_1_1765082769_8600', '2025-12-06 23:46:09', 1),
(15, 1, 'Prueba 3', 'sfgagas', 6, 'basico', 'SET_1_1765082853_3611', '2025-12-06 23:47:33', 1),
(16, 1, 'Prueba 3', 'sfgagas', 6, 'basico', 'SET_1_1765082858_8695', '2025-12-06 23:47:38', 1),
(17, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765157045_3667', '2025-12-07 20:24:05', 1),
(18, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765157103_4445', '2025-12-07 20:25:03', 1),
(19, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765157297_7994', '2025-12-07 20:28:17', 1),
(20, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765157923_3260', '2025-12-07 20:38:43', 1),
(21, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765159994_5083', '2025-12-07 21:13:14', 1),
(22, 1, 'Multijugador - SQL', 'Set creado por Carlos para el tema SQL', 6, 'basico', 'SET_1_1765248034_9295', '2025-12-08 21:40:34', 1),
(23, 10, 'Multijugador - SQL', 'Set creado por Eduardo para el tema SQL', 6, 'basico', 'SET_10_1765259913_7386', '2025-12-09 00:58:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `set_preguntas_rel`
--

DROP TABLE IF EXISTS `set_preguntas_rel`;
CREATE TABLE IF NOT EXISTS `set_preguntas_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `set_id` int NOT NULL,
  `pregunta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_set_pregunta` (`set_id`,`pregunta_id`),
  KEY `pregunta_id` (`pregunta_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `set_preguntas_rel`
--

INSERT INTO `set_preguntas_rel` (`id`, `set_id`, `pregunta_id`) VALUES
(1, 6, 10),
(2, 9, 23),
(3, 9, 19),
(4, 9, 20),
(5, 9, 18),
(6, 9, 22),
(7, 9, 21),
(8, 10, 23),
(9, 10, 19),
(10, 10, 20),
(11, 10, 18),
(12, 10, 22),
(13, 10, 21),
(14, 17, 19),
(15, 17, 23),
(16, 17, 21),
(17, 17, 22),
(18, 17, 20),
(19, 18, 20),
(20, 18, 21),
(21, 18, 23),
(22, 18, 22),
(23, 18, 19),
(24, 19, 20),
(25, 19, 23),
(26, 19, 21),
(27, 19, 22),
(28, 19, 19),
(29, 20, 23),
(30, 20, 20),
(31, 20, 21),
(32, 20, 19),
(33, 20, 22),
(34, 21, 22),
(35, 21, 23),
(36, 21, 21),
(37, 21, 19),
(38, 21, 20),
(39, 22, 24),
(40, 23, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE IF NOT EXISTS `temas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `nivel` enum('basico','intermedio','avanzado','experto') NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id`, `nombre`, `descripcion`, `nivel`, `activo`, `fecha_creacion`) VALUES
(1, 'PHP Básico', 'Conceptos fundamentales de PHP', 'basico', 1, '2025-12-02 19:58:51'),
(2, 'PHP Intermedio', 'Funciones y POO en PHP', 'intermedio', 1, '2025-12-02 19:58:51'),
(3, 'PHP Avanzado', 'Patrones de diseño y frameworks', 'avanzado', 1, '2025-12-02 19:58:51'),
(4, 'JavaScript Básico', 'Fundamentos de JavaScript', 'basico', 1, '2025-12-02 19:58:51'),
(5, 'Laravel Básico', 'Introducción al framework Laravel', 'basico', 1, '2025-12-02 19:58:51'),
(6, 'SQL', 'lenguaje para manejar bases de datos', 'basico', 1, '2025-12-04 18:27:58'),
(17, 'C++', 'Lenguaje de programación', 'intermedio', 1, '2025-12-09 01:00:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apodo` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT 'default.png',
  `puntos` int DEFAULT '0',
  `nivel_actual` enum('novato','basico','intermedio','avanzado','experto') DEFAULT 'novato',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `apodo`, `avatar`, `puntos`, `nivel_actual`, `fecha_registro`, `activo`) VALUES
(1, 'Carlos', 'carlos@gmail.com', '$2y$10$9U.2n3FM8MW.rESw4KaEm.WmvbE.jWCLK5gnZ8yVmF2wD8xYd9MRy', 'carlucho', 'avatar.png', 700, 'intermedio', '2025-12-02 20:16:06', 1),
(2, 'ismael ', 'ismael@gmail.com', '$2y$10$/cCL1GIw4PaeO1ZlquO9e.wyhSx1jn5X7RnNSzh5R6qVJUgMFaPMS', 'strators', 'default.png', 0, 'novato', '2025-12-05 07:29:11', 1),
(3, 'juan', 'juan@gmail.com', '$2y$10$QWuFy4HZS1Jq7oG.lvMjauEdtlhrXW7K29hAb19we5NtHIaXtWNtK', 'juancho', 'avatar1.png', 0, 'novato', '2025-12-08 00:37:05', 1),
(4, 'eric', 'eric@gmail.com', '$2y$10$EF5cpXDTTlWvwObOx3cHVO49.VVA0Rt7G6J5cWzpL/yWTGpa6cM2C', 'kingsman', 'avatar4.png', 10, 'novato', '2025-12-08 19:41:21', 1),
(5, 'angel', 'angel@gmail.com', '$2y$10$VjtwG0Z3xcHIO/5BK0J9DeyC7wv.QT7TsyUuqsjwgjDRk4PdktPpC', 'elhakeado', 'avatar2.png', 1, 'novato', '2025-12-08 20:11:21', 1),
(6, 'alejandor', 'alejandor@gmail.com', '$2y$10$K6CzO6WFE1yvCyGmutmZWeDE4suI65GcGHGPW3l.nGt83kJrLdo4m', 'k', 'avatar.png', 300, 'intermedio', '2025-12-08 20:49:57', 1),
(7, 'pedro', 'pedro@gmail.com', '$2y$10$zy1pDl8NMzfe7T8CqbvWCudtn.o9..pnwnfjeXNp78D820Qt.BTnW', 'pe', 'avatar5.png', 0, 'basico', '2025-12-08 21:06:53', 1),
(8, 'Erirc', 'eric2@gmail.com', '$2y$10$SmFrgwbxSpDoUmxi0QAGvunPuNTUbw/xjQba9m6qu.7AqePDmedJ2', 'eric_sin_hack', 'avatar3.png', 105, 'basico', '2025-12-08 21:09:35', 1),
(9, 'Fernando', 'fernando@gmail.com', '$2y$10$uFpyiRtOoXr3cftWydSd0upiuDFcAZVaTpFk4VzVl5VTABFXyJygq', 'fercho', 'avatar.png', 0, 'basico', '2025-12-09 00:50:23', 1),
(10, 'Eduardo', 'eduardo@gmail.com', '$2y$10$bREADHNbnD4tfa1goyB3S.dGsO9gQ4WPpu/vgACJ02hMmChVhuGIO', 'edu', '6937bf2f23a2c_10.jpg', 340, 'intermedio', '2025-12-09 00:55:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_premios`
--

DROP TABLE IF EXISTS `usuario_premios`;
CREATE TABLE IF NOT EXISTS `usuario_premios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `premio_id` int NOT NULL,
  `fecha_obtencion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario_premio` (`usuario_id`,`premio_id`),
  KEY `premio_id` (`premio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario_premios`
--

INSERT INTO `usuario_premios` (`id`, `usuario_id`, `premio_id`, `fecha_obtencion`) VALUES
(1, 1, 1, '2025-12-04 16:13:21'),
(2, 1, 4, '2025-12-04 16:29:15'),
(3, 1, 10, '2025-12-07 23:08:46'),
(4, 1, 6, '2025-12-07 23:08:50'),
(5, 3, 4, '2025-12-08 19:24:41'),
(6, 4, 4, '2025-12-08 19:43:14'),
(7, 5, 4, '2025-12-08 20:11:32'),
(8, 6, 9, '2025-12-08 20:50:07'),
(9, 6, 5, '2025-12-08 21:02:59'),
(10, 6, 6, '2025-12-08 21:04:25'),
(11, 6, 10, '2025-12-08 21:04:28'),
(12, 7, 9, '2025-12-08 21:07:07'),
(13, 8, 9, '2025-12-08 21:09:50'),
(14, 8, 5, '2025-12-08 21:31:33'),
(15, 9, 9, '2025-12-09 00:51:39'),
(16, 10, 4, '2025-12-09 00:56:31'),
(17, 10, 9, '2025-12-09 00:56:44'),
(18, 10, 6, '2025-12-09 01:16:30'),
(19, 10, 10, '2025-12-09 01:16:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
