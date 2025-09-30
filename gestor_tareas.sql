-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2025 a las 00:03:07
-- Versión del servidor: 10.11.11-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor_tareas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `fecha_creacion`) VALUES
(1, 'Trabajo', 'Tareas relacionadas con el trabajo', '2025-09-29 19:44:02'),
(2, 'Personal', 'Tareas personales y del hogar', '2025-09-29 19:44:02'),
(3, 'Estudio', 'Tareas académicas y aprendizaje', '2025-09-29 19:44:02'),
(4, 'Salud', 'Ejercicio, citas médicas y bienestar', '2025-09-29 19:44:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id_etiqueta` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `color` varchar(7) DEFAULT '#007bff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`id_etiqueta`, `nombre`, `color`) VALUES
(1, 'Urgente', '#dc3545'),
(2, 'Importante', '#ffc107'),
(3, 'Rápido', '#28a745'),
(4, 'Planificación', '#17a2b8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `prioridad` enum('ALTA','MEDIA','BAJA') DEFAULT 'MEDIA',
  `estado` enum('PENDIENTE','EN_PROGRESO','COMPLETADA','CANCELADA') DEFAULT 'PENDIENTE',
  `id_categoria` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `fecha_limite` date DEFAULT NULL,
  `fecha_completada` datetime DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `prioridad`, `estado`, `id_categoria`, `fecha_creacion`, `fecha_limite`, `fecha_completada`, `notas`) VALUES
(1, 'Completar informe mensual', 'ALTA', 'PENDIENTE', 1, '2025-09-29 19:44:02', '2025-10-05', NULL, 'Incluir gráficas y análisis'),
(2, 'Hacer compras del supermercado', 'MEDIA', 'PENDIENTE', 2, '2025-09-29 19:44:02', '2025-09-30', NULL, 'Comprar frutas y verduras'),
(3, 'Estudiar SQL para examen', 'ALTA', 'EN_PROGRESO', 3, '2025-09-29 19:44:02', '2025-10-10', NULL, 'Repasar joins y subconsultas'),
(4, 'Ir al gimnasio', 'BAJA', 'COMPLETADA', 4, '2025-09-29 19:44:02', '2025-09-29', '2025-09-29 10:30:00', NULL),
(5, 'Llamar al dentista', 'MEDIA', 'PENDIENTE', 4, '2025-09-29 19:44:02', '2025-10-02', NULL, 'Pedir cita para limpieza'),
(6, 'Preparar presentación', 'ALTA', 'EN_PROGRESO', 1, '2025-09-29 19:44:02', '2025-10-01', NULL, 'Presentación para reunión del lunes'),
(7, 'Organizar archivos', 'BAJA', 'PENDIENTE', 2, '2025-09-29 19:44:02', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_etiquetas`
--

CREATE TABLE `tareas_etiquetas` (
  `id_tarea` int(11) NOT NULL,
  `id_etiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas_etiquetas`
--

INSERT INTO `tareas_etiquetas` (`id_tarea`, `id_etiqueta`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 2),
(6, 1),
(6, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id_etiqueta`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_prioridad` (`prioridad`),
  ADD KEY `idx_fecha_limite` (`fecha_limite`);

--
-- Indices de la tabla `tareas_etiquetas`
--
ALTER TABLE `tareas_etiquetas`
  ADD PRIMARY KEY (`id_tarea`,`id_etiqueta`),
  ADD KEY `id_etiqueta` (`id_etiqueta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id_etiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL;

--
-- Filtros para la tabla `tareas_etiquetas`
--
ALTER TABLE `tareas_etiquetas`
  ADD CONSTRAINT `tareas_etiquetas_ibfk_1` FOREIGN KEY (`id_tarea`) REFERENCES `tareas` (`id_tarea`) ON DELETE CASCADE,
  ADD CONSTRAINT `tareas_etiquetas_ibfk_2` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiquetas` (`id_etiqueta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
