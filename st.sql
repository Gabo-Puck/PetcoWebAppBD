-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: petcodbv2
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `castrado`
--

DROP TABLE IF EXISTS `castrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `castrado` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Castrado` varchar(45) NOT NULL COMMENT 'Este campo contiene el estado de Castrado asociado al id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla contiene los estados posibles para la etiqueta castrado de la mascota';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Texto` varchar(255) NOT NULL,
  `ID_Publicacion` bigint NOT NULL,
  `Comentario_Padre` int DEFAULT NULL,
  `Fecha_Envio` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Publicacion` (`ID_Publicacion`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`ID_Publicacion`) REFERENCES `publicacion` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donaciones`
--

DROP TABLE IF EXISTS `donaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Organizacion` int NOT NULL COMMENT 'Este campo almancena la ID de la organización a la que se esta donando.',
  `ID_Usuario` int NOT NULL COMMENT 'Este campo almacena la ID del usuario que realiza la donación',
  `ID_Meta` int DEFAULT NULL COMMENT 'Este campo almacenna la ID de una meta cuando se realiza una donación a cierta. De otro modo será nulo',
  `Cantidad` int NOT NULL COMMENT 'Este campo almacena la cantidad dinero en pesos que se dono',
  `Fecha` datetime NOT NULL COMMENT 'La fecha en la que se realizo la donación',
  `Mensaje` varchar(50) DEFAULT NULL COMMENT 'Este campo almacena un mensaje que el usuario escriba a la hora de hacer la donación. Puede ser nulo',
  PRIMARY KEY (`ID`),
  KEY `ID_Organizacion` (`ID_Organizacion`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Meta` (`ID_Meta`),
  CONSTRAINT `donaciones_ibfk_1` FOREIGN KEY (`ID_Organizacion`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `donaciones_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `donaciones_ibfk_3` FOREIGN KEY (`ID_Meta`) REFERENCES `metas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena todas las donaciones realizadas dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre_Especie` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena la lista de animales que se pueden publicar en la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre - Nombre de la entidad',
  `Abreviatura` varchar(6) NOT NULL COMMENT 'Abreviatura - Nombre abreviado de la entidad',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estados de la República Mexicana';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado_mascota`
--

DROP TABLE IF EXISTS `estado_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_mascota` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Estado_Nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del estado',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena todos los posibles estados de una mascota dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL COMMENT 'Titulo del formulario',
  `ID_Usuario` int DEFAULT NULL COMMENT 'ID del usuario al que pertenece el formulario',
  PRIMARY KEY (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `formulario_BEFORE_DELETE` BEFORE DELETE ON `formulario` FOR EACH ROW BEGIN
	DECLARE done INT DEFAULT false;
    DECLARE idPregunta INT;
    DECLARE cur CURSOR FOR SELECT ID_Pregunta FROM preguntas_formulario WHERE ID_Formulario=OLD.ID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
		del_loop: LOOP
			FETCH cur INTO idPregunta;
            IF done THEN
				LEAVE del_loop;
			END IF;
            DELETE FROM preguntas WHERE ID = idPregunta;
        END LOOP;
    CLOSE cur;
    
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Ruta` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena las direcciones de todas las imagenes correspondientes ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenes_mascota`
--

DROP TABLE IF EXISTS `imagenes_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_mascota` (
  `ID_Mascota` bigint NOT NULL COMMENT 'ID de la mascota',
  `ID_Imagen` bigint NOT NULL COMMENT 'ID de la imagen a la que se asocia la mascota',
  PRIMARY KEY (`ID_Mascota`,`ID_Imagen`),
  KEY `ID_Imagen` (`ID_Imagen`),
  CONSTRAINT `imagenes_mascota_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascota` (`ID`),
  CONSTRAINT `imagenes_mascota_ibfk_2` FOREIGN KEY (`ID_Imagen`) REFERENCES `imagenes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Esta tabla almacena la relación entre las mascotas y sus respectivas fotos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intereses`
--

DROP TABLE IF EXISTS `intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intereses` (
  `ID_Especie` int NOT NULL COMMENT 'ID_Especie -> Especie(ID)\n\nEspecie elegida por el usuario (Pueden ser varias)',
  `ID_Usuario` int NOT NULL COMMENT 'ID_Usuario -> Usuario(ID)\n',
  PRIMARY KEY (`ID_Especie`,`ID_Usuario`),
  KEY `ID_Usuario` (`ID_Usuario`) /*!80000 INVISIBLE */,
  CONSTRAINT `intereses_ibfk_1` FOREIGN KEY (`ID_Especie`) REFERENCES `especie` (`ID`),
  CONSTRAINT `intereses_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que permite que almacenar los intereses de los usuarios. Relaciona cada usuario con un posbile animal de la lista de especies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ID_Publicacion` bigint NOT NULL COMMENT 'ID de la publicación a la que pertenece dicha mascota',
  `Nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ID_Especie` int NOT NULL,
  `Edad` int NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ID_Estado` tinyint NOT NULL,
  `ID_Salud` tinyint NOT NULL,
  `ID_Tamano` tinyint NOT NULL,
  `ID_Castrado` tinyint NOT NULL COMMENT 'Este campo indica si la mascota esta castrada o no. Los valores son los siguientes 0 para Sin informacion, 1 para No castrado, 2 para Castrado.',
  PRIMARY KEY (`ID`),
  KEY `ID_Estado` (`ID_Estado`),
  KEY `ID_Publicacion` (`ID_Publicacion`),
  KEY `ID_Especie` (`ID_Especie`),
  KEY `mascota_ibfk_3_idx` (`ID_Tamano`),
  KEY `mascota_ibfk_4_idx` (`ID_Salud`),
  KEY `mascota_ibfk_5_idx` (`ID_Castrado`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estado_mascota` (`ID`),
  CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`ID_Publicacion`) REFERENCES `publicacion` (`ID`),
  CONSTRAINT `mascota_ibfk_3` FOREIGN KEY (`ID_Especie`) REFERENCES `especie` (`ID`),
  CONSTRAINT `mascota_ibfk_4` FOREIGN KEY (`ID_Salud`) REFERENCES `salud` (`ID`),
  CONSTRAINT `mascota_ibfk_5` FOREIGN KEY (`ID_Castrado`) REFERENCES `castrado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena todas las mascotas que se suben a la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Usuario_Remitente` int NOT NULL COMMENT 'ID Usuario que manda el mensaje',
  `Usuario_Destinatario` int NOT NULL COMMENT 'ID Usuario que recibe el mensaje',
  `Texto` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contenido del mensaje enviado',
  `Fecha_Envio` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Usuario_Remitente` (`Usuario_Remitente`),
  KEY `Usuario_Destinatario` (`Usuario_Destinatario`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`Usuario_Remitente`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`Usuario_Destinatario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena todos los mensajes enviados dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Mascota` bigint NOT NULL,
  `Cantidad` int NOT NULL,
  `Completado` tinyint NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Mascota` (`ID_Mascota`),
  CONSTRAINT `metas_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascota` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Estado` int NOT NULL COMMENT 'Relación: estado -> id',
  `Nombre` varchar(255) NOT NULL COMMENT 'Nombre – Nombre del municipio',
  PRIMARY KEY (`ID`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Municipio de la República Mexicana';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha_Generacion` datetime NOT NULL COMMENT 'Fecha en la que se genero la notificación en cuestión',
  `Descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Información que muestra la notificación',
  `Origen` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Campo que almacena el origen (url) del origen la notificación',
  `ID_Usuario` int NOT NULL COMMENT 'ID_Usuario al cual pertenece la notificación',
  PRIMARY KEY (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Esta tabla almacena todas las notificaciones generadas dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opciones_respuestas_preguntas`
--

DROP TABLE IF EXISTS `opciones_respuestas_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones_respuestas_preguntas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pregunta` int NOT NULL,
  `Opcion_Respuesta` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `opciones_respuestas_preguntas_ibfk_1` (`ID_Pregunta`),
  CONSTRAINT `opciones_respuestas_preguntas_ibfk_1` FOREIGN KEY (`ID_Pregunta`) REFERENCES `preguntas` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paso`
--

DROP TABLE IF EXISTS `paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paso` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo_Paso` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DiasEstimados` smallint NOT NULL,
  `Archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ID_Protocolo` int NOT NULL,
  `AceptaArchivo` tinyint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Protocolo` (`ID_Protocolo`),
  CONSTRAINT `paso_ibfk_1` FOREIGN KEY (`ID_Protocolo`) REFERENCES `protocolos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paso_mascota`
--

DROP TABLE IF EXISTS `paso_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paso_mascota` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ID_Mascota` bigint NOT NULL COMMENT 'ID de la mascota a la cual se esta llevando en el proceso de adopción',
  `ID_Paso` int NOT NULL COMMENT 'ID del paso del cual se guarda el progreso',
  `Completado` tinyint NOT NULL COMMENT 'Variable que almacena si se ha completado o no este paso',
  `Archivo` varchar(255) DEFAULT NULL COMMENT 'Campo que almacena la dirección de un archivo que sea necesario para el paso',
  PRIMARY KEY (`ID`),
  KEY `ID_Mascota` (`ID_Mascota`),
  KEY `ID_Paso` (`ID_Paso`),
  CONSTRAINT `paso_mascota_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascota` (`ID`),
  CONSTRAINT `paso_mascota_ibfk_2` FOREIGN KEY (`ID_Paso`) REFERENCES `paso` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla guarda el progreso de los procesos de adopcion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(200) NOT NULL,
  `Tipo` int NOT NULL,
  `Opcional` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preguntas_formulario`
--

DROP TABLE IF EXISTS `preguntas_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas_formulario` (
  `ID_Pregunta` int NOT NULL,
  `ID_Formulario` int NOT NULL,
  PRIMARY KEY (`ID_Pregunta`,`ID_Formulario`),
  KEY `preguntas_formulario_ibfk_2` (`ID_Formulario`),
  CONSTRAINT `preguntas_formulario_ibfk_1` FOREIGN KEY (`ID_Pregunta`) REFERENCES `preguntas` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `preguntas_formulario_ibfk_2` FOREIGN KEY (`ID_Formulario`) REFERENCES `formulario` (`ID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protocolos`
--

DROP TABLE IF EXISTS `protocolos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocolos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ID_Formulario` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `protocolos_ibfk_1_idx` (`ID_Formulario`),
  KEY `protocolos_ibfk_2_idx` (`ID_Usuario`),
  CONSTRAINT `protocolos_ibfk_1` FOREIGN KEY (`ID_Formulario`) REFERENCES `formulario` (`ID`),
  CONSTRAINT `protocolos_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena datos de los protocolos creados por los usuarios dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Activo` tinyint NOT NULL,
  `Reportes_Peso` int NOT NULL COMMENT 'Reportes_Peso indica la cantidad acumulada de peso por los reportes que haya recibido la publicacion',
  `ID_Usuario` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `publicacion_ibfk_1_idx` (`ID_Usuario`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_Usuario` tinyint NOT NULL,
  `Nombre` varchar(75) NOT NULL,
  `Correo` varchar(75) NOT NULL,
  `Municipio` int NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Documento_Identidad` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Municipio` (`Municipio`),
  CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`Municipio`) REFERENCES `municipio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Razon` text CHARACTER SET utf8 COLLATE utf8_spanish_ci COMMENT 'Razon será usada cuando el tipo de reporte corresponda a "Otro" y almacenará la razon escrita por el usuario. De otro modo permanecerá nulo',
  `Origen` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Tipo_Origen` tinyint NOT NULL,
  `ID_Usuario_Reporta` int NOT NULL,
  `ID_Usuario_Reportado` int NOT NULL,
  `Tipo_Reporte` tinyint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Usuario_Reporta` (`ID_Usuario_Reporta`),
  KEY `ID_Usuario_Reportado` (`ID_Usuario_Reportado`),
  KEY `Tipo_Reporte` (`Tipo_Reporte`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`ID_Usuario_Reporta`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`ID_Usuario_Reportado`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `reportes_ibfk_3` FOREIGN KEY (`Tipo_Reporte`) REFERENCES `tipo_reporte` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena los reportes generados por los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Respuesta` varchar(255) NOT NULL,
  `ID_Pregunta` int NOT NULL,
  `ID_Solicitud` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `respuestas_ibfk_1` (`ID_Pregunta`),
  KEY `respuestas_ibfk_2` (`ID_Solicitud`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`ID_Pregunta`) REFERENCES `preguntas` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`ID_Solicitud`) REFERENCES `solicitudes` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salud`
--

DROP TABLE IF EXISTS `salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salud` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Salud` varchar(45) DEFAULT NULL COMMENT 'Este campo almacena el estado de salud que puede tener una mascota. ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla nos permite almacenar los diferentes estados de salud que puede tener una mascota.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL COMMENT 'ID Usuario que realiza la solicitud',
  `ID_Mascota` bigint NOT NULL COMMENT 'ID de la mascota a la que el Usuario realiza su solicitud',
  PRIMARY KEY (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Mascota` (`ID_Mascota`),
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascota` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Guarda la solicitud realizadas en la plataforma ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tamano`
--

DROP TABLE IF EXISTS `tamano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamano` (
  `ID` tinyint NOT NULL AUTO_INCREMENT COMMENT 'ID de la tabla "Tamano"',
  `Tamano` varchar(45) NOT NULL COMMENT 'Texto que indica el tamaño asociado a la ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla nos permite guardar los tamaños disponibles para las mascotas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_reporte`
--

DROP TABLE IF EXISTS `tipo_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_reporte` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Razon` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Peso` tinyint DEFAULT NULL COMMENT 'Peso puede ser nulo pues el reporte del tipo "otro", tiene peso variable',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena los tipos de reportes que existen dentro de la plataforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Foto_Perfil` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Foto_Perfil hace referencia a una url de una imagen',
  `FK_Registro` int NOT NULL,
  `Reputacion` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Registro` (`FK_Registro`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`FK_Registro`) REFERENCES `registro` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla para almacenar usuarios del tipo Comun y Organizacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_bloqueado`
--

DROP TABLE IF EXISTS `usuario_bloqueado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_bloqueado` (
  `ID_Usuario` int NOT NULL COMMENT 'Usuario que bloquea',
  `ID_Bloqueado` int NOT NULL COMMENT 'Usuario que ID_Usuario bloquea',
  PRIMARY KEY (`ID_Usuario`,`ID_Bloqueado`),
  KEY `ID_Bloqueado` (`ID_Bloqueado`),
  CONSTRAINT `usuario_bloqueado_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `usuario_bloqueado_ibfk_2` FOREIGN KEY (`ID_Bloqueado`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_moderador`
--

DROP TABLE IF EXISTS `usuario_moderador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_moderador` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Registro` int NOT NULL COMMENT 'ID_Registro -> Registro(ID)',
  PRIMARY KEY (`ID`),
  KEY `ID_Registro` (`ID_Registro`),
  CONSTRAINT `usuario_moderador_ibfk_1` FOREIGN KEY (`ID_Registro`) REFERENCES `registro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_publicacion`
--

DROP TABLE IF EXISTS `usuario_publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_publicacion` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL COMMENT 'ID del Usuario que ha interactuado con una publicación mediante un me gusta o guardardando la publicacion',
  `ID_Publicacion` bigint NOT NULL COMMENT 'ID de la publicacion con la que el Usuario ha interactuado',
  `Tipo` tinyint NOT NULL COMMENT 'Este campo almacena que relación tiene el usuario con la publicacion. Si el Tipo es 1, el usuario le ha dado me gusta a la publicación, si el Tipo es 2, el usuario ha guardado la publicación, si el Tipo es 3, el usuario le ha dado me gusta y guardado la publicación.',
  PRIMARY KEY (`ID`),
  KEY `usuario_publicacion_ibfk_1_idx` (`ID_Usuario`),
  KEY `usuario_publicacion_ibfk_2_idx` (`ID_Publicacion`),
  CONSTRAINT `usuario_publicacion_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `usuario_publicacion_ibfk_2` FOREIGN KEY (`ID_Publicacion`) REFERENCES `publicacion` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla nos permite almacenar las publicaciones que los usuarios han guardado o dado me gusta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vacunas`
--

DROP TABLE IF EXISTS `vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre_Vacuna` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Tabla que almacena todas las vacunas disponibles para cada especie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vacunas_especie`
--

DROP TABLE IF EXISTS `vacunas_especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas_especie` (
  `ID_Vacuna` int NOT NULL,
  `ID_Especie` int NOT NULL,
  PRIMARY KEY (`ID_Vacuna`,`ID_Especie`),
  KEY `ID_Especie` (`ID_Especie`),
  CONSTRAINT `vacunas_especie_ibfk_1` FOREIGN KEY (`ID_Vacuna`) REFERENCES `vacunas` (`ID`),
  CONSTRAINT `vacunas_especie_ibfk_2` FOREIGN KEY (`ID_Especie`) REFERENCES `especie` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vacunas_mascota`
--

DROP TABLE IF EXISTS `vacunas_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas_mascota` (
  `ID_Mascota` bigint NOT NULL COMMENT 'ID de la mascota a la que se le asocia la vacuna',
  `ID_Vacuna` int NOT NULL COMMENT 'El id de la vacuna que se le asocia a la mascota',
  PRIMARY KEY (`ID_Mascota`,`ID_Vacuna`),
  KEY `ID_Vacuna` (`ID_Vacuna`),
  CONSTRAINT `vacunas_mascota_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascota` (`ID`),
  CONSTRAINT `vacunas_mascota_ibfk_2` FOREIGN KEY (`ID_Vacuna`) REFERENCES `vacunas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci COMMENT='Esta tabla almacena la relación entre las mascotas y sus respectivas vacunas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'petcodbv2'
--

--
-- Dumping routines for database 'petcodbv2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18 23:35:24
