/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 10.4.28-MariaDB : Database - servicio_hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`servicio_hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `servicio_hotel`;

/*Table structure for table `alquiler` */

DROP TABLE IF EXISTS `alquiler`;

CREATE TABLE `alquiler` (
  `idalquiler` int(11) NOT NULL AUTO_INCREMENT,
  `idhabitacion` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `horaentrada` datetime NOT NULL DEFAULT current_timestamp(),
  `horasalida` datetime DEFAULT NULL,
  `observaciones` varchar(150) DEFAULT NULL,
  `pago` varchar(15) NOT NULL,
  PRIMARY KEY (`idalquiler`),
  KEY `fk_alq_hab` (`idhabitacion`),
  KEY `fk_alq_cli` (`idcliente`),
  KEY `fk_alq_usu` (`idusuario`),
  CONSTRAINT `fk_alq_cli` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  CONSTRAINT `fk_alq_hab` FOREIGN KEY (`idhabitacion`) REFERENCES `habitacion` (`idhabitacion`),
  CONSTRAINT `fk_alq_usu` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `alquiler` */

insert  into `alquiler`(`idalquiler`,`idhabitacion`,`idcliente`,`idusuario`,`horaentrada`,`horasalida`,`observaciones`,`pago`) values 
(12,5,14,1,'2023-06-06 14:53:26','2023-06-06 14:57:05',NULL,'Efectivo'),
(13,7,14,1,'2023-06-06 14:56:58','2023-06-06 14:57:00',NULL,'Efectivo'),
(14,6,14,1,'2023-06-06 14:57:14','2023-06-06 15:12:57',NULL,'Efectivo'),
(15,7,14,1,'2023-06-06 14:57:21','2023-06-06 15:12:56',NULL,'Efectivo'),
(16,5,14,1,'2023-06-06 15:11:52','2023-06-06 15:12:56',NULL,'Efectivo'),
(17,8,14,1,'2023-06-06 15:12:49','2023-06-06 15:12:55',NULL,'Efectivo'),
(18,3,14,1,'2023-06-06 15:22:00','2023-06-06 15:45:07',NULL,'Efectivo'),
(19,4,14,1,'2023-06-06 15:48:04',NULL,NULL,'Efectivo'),
(20,5,13,1,'2023-06-06 15:48:11',NULL,NULL,'Efectivo');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(15) NOT NULL,
  `telefono` char(9) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `uk_num_doc_cli` (`tipo_documento`,`num_documento`),
  UNIQUE KEY `uk_telefono_cli` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`idcliente`,`apellidos`,`nombres`,`tipo_documento`,`num_documento`,`telefono`) values 
(13,'Magallanes Contreras','Carlos','DNI','76523548','985421354'),
(14,'Guillen Castilla','Gabriela','CE','000156325','986547521');

/*Table structure for table `habitacion` */

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `idhabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `numhabitacion` varchar(3) NOT NULL,
  `costo` decimal(5,2) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Disponible',
  PRIMARY KEY (`idhabitacion`),
  UNIQUE KEY `uk_num_hab` (`numhabitacion`),
  KEY `fk_tip_hab` (`idtipo`),
  CONSTRAINT `fk_tip_hab` FOREIGN KEY (`idtipo`) REFERENCES `tipohabitacion` (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `habitacion` */

insert  into `habitacion`(`idhabitacion`,`numhabitacion`,`costo`,`idtipo`,`estado`) values 
(1,'001',30.00,1,'disponible'),
(2,'002',50.00,3,'disponible'),
(3,'003',40.00,2,'Disponible'),
(4,'004',30.00,1,'Ocupado'),
(5,'005',30.00,1,'Ocupado'),
(6,'006',50.00,3,'disponible'),
(7,'007',40.00,2,'disponible'),
(8,'008',30.00,1,'disponible');

/*Table structure for table `tipohabitacion` */

DROP TABLE IF EXISTS `tipohabitacion`;

CREATE TABLE `tipohabitacion` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipohabitacion` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `uk_tipo_habi` (`tipohabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipohabitacion` */

insert  into `tipohabitacion`(`idtipo`,`tipohabitacion`,`descripcion`) values 
(1,'Individual','Una habitación asignada a una persona'),
(2,'Doble','Una habitación asignada a dos personas'),
(3,'Triple','Una habitación asignada a tres personas'),
(4,'Quad','Una sala asignada a cuatro personas'),
(5,'Queen','Una habitación con una cama de matrimonio'),
(6,'King','Una habitación con una cama king-size');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nivelacceso` char(3) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`idusuario`,`nombre`,`apellidos`,`nivelacceso`,`correo`,`clave`) values 
(1,'Edu','Quiroz','ADM','eduqcc08@gmail.com','$2y$10$VFS.yvdlxj9H0x1PCGiVAO2qV5nnN3Ep1W2hfCrnNRWMgjepR/wtS'),
(2,'Alex','Ccaulla','EMP','alex@gmail.com','$2y$10$VFS.yvdlxj9H0x1PCGiVAO2qV5nnN3Ep1W2hfCrnNRWMgjepR/wtS');

/* Procedure structure for procedure `clientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `clientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clientes`()
begin 
select concat ( apellidos,', ',nombres) Cliente
from clientes
order by idcliente desc;
end */$$
DELIMITER ;

/* Procedure structure for procedure `horasalida` */

/*!50003 DROP PROCEDURE IF EXISTS  `horasalida` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `horasalida`(IN _idalquiler INT, in _idhabitacion int)
BEGIN
UPDATE alquiler SET
horasalida = NOW()
WHERE alquiler.`idalquiler` = _idalquiler;

update habitacion set 
estado = 'Disponible'
where habitacion.`idhabitacion` = _idhabitacion;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `listarhabitacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarhabitacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarhabitacion`()
begin
select habitacion.idhabitacion, habitacion.numhabitacion
from habitacion;
end */$$
DELIMITER ;

/* Procedure structure for procedure `listarusuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarusuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarusuarios`()
BEGIN
SELECT * FROM	usuario;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `listar_historial` */

/*!50003 DROP PROCEDURE IF EXISTS  `listar_historial` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_historial`()
SELECT   habitacion.numhabitacion,
			 clientes.`apellidos`, clientes.`nombres`,
			 alquiler.`horaentrada`, alquiler.`horasalida`, habitacion.costo, alquiler.`pago`, habitacion.`estado`
			 FROM alquiler
			 LEFT JOIN habitacion ON habitacion.idhabitacion = alquiler.idhabitacion
			 INNER JOIN clientes ON clientes.`idcliente` = alquiler.`idcliente`
			order by alquiler.`horaentrada` */$$
DELIMITER ;

/* Procedure structure for procedure `pagoactivar` */

/*!50003 DROP PROCEDURE IF EXISTS  `pagoactivar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pagoactivar`(_idalquiler INT)
BEGIN
UPDATE alquiler SET
	horasalida = NOW(),
	pago = 'SI'
	
	WHERE	idalquiler = _idalquiler;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_alquileres_resume` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_alquileres_resume` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alquileres_resume`()
begin
	select idhabitacion, count(*) as Alquilados
	from alquiler
	group by idhabitacion
	order by idalquiler desc;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_alquiler_buscar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_alquiler_buscar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alquiler_buscar`(IN _idhabitacion INT)
BEGIN
SELECT habitacion.idhabitacion, habitacion.numhabitacion,
			 clientes.`apellidos`, clientes.`nombres`,
			 alquiler.`horaentrada`, alquiler.`horasalida`, habitacion.costo, alquiler.pago
			 FROM alquiler
				INNER JOIN habitacion ON habitacion.idhabitacion= alquiler.idhabitacion
			 INNER JOIN clientes	ON clientes.`idcliente` = alquiler.`idcliente`
			 WHERE alquiler.idhabitacion= _idhabitacion
			 ORDER BY alquiler.`horaentrada` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_alquiler_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_alquiler_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alquiler_listar`()
BEGIN
	SELECT  alquiler.idalquiler,alquiler.`idhabitacion`, habitacion.numhabitacion,
			 clientes.`apellidos`, clientes.`nombres`,
			 alquiler.`horaentrada`, alquiler.`horasalida`, habitacion.costo, alquiler.`pago`, habitacion.`estado`
			 FROM alquiler
			 left JOIN habitacion ON habitacion.idhabitacion = alquiler.idhabitacion
			 inner JOIN clientes ON clientes.`idcliente` = alquiler.`idcliente`
			 where horasalida is null
			 GROUP BY  numhabitacion
			 ORDER BY alquiler.`idalquiler` desc;
			 
	END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_alquiler_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_alquiler_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alquiler_registrar`(IN _idhabitacion INT, 
IN _idcliente INT, 
IN _idusuario INT,
IN _pago VARCHAR(15))
BEGIN

UPDATE habitacion SET
 estado = 'Ocupado'
 WHERE habitacion.`idhabitacion`= _idhabitacion; 

 
	INSERT INTO alquiler(idhabitacion, idcliente, idusuario, pago) VALUES
	(_idhabitacion, _idcliente, _idusuario, _pago);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_clientes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_clientes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_clientes_listar`()
begin
	select idcliente, apellidos, nombres, tipo_documento, num_documento, telefono
	from clientes
	order by idcliente desc;
	
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_clientes_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_clientes_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_clientes_registrar`(
in _apellidos varchar(40),
in _nombres varchar(100),
in _tipo_documento varchar(20),
in _num_documento varchar(15),
in _telefono char(9)
)
begin
	insert into clientes (apellidos, nombres, tipo_documento, num_documento, telefono) values
	(_apellidos, _nombres, _tipo_documento, _num_documento, _telefono);
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_habitaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_habitaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_habitaciones`()
begin 
	select * from habitacion
	where estado = 'disponible';
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_mostrar_estado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_mostrar_estado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mostrar_estado`(in  _idhabitacion int)
begin 
select estado
from habitacion
	where idhabitacion = _idhabitacion;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_cliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_cliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_cliente`(in _apellidos varchar(100), in _nombres varchar(100),
	in _tipo_documento varchar(20), in _num_documento varchar(15), in _telefono char(9))
begin
	
	insert into clientes (apellidos, nombres, tipo_documento, num_documento, telefono) values
	(_apellidos, _nombres, _tipo_documento, _num_documento, _telefono);
	
	end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_user_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_user_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_user_login`(IN _correo VARCHAR(50))
BEGIN
	SELECT correo, nombre, apellidos,nivelacceso, clave
	FROM usuario
	WHERE correo = _correo;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
