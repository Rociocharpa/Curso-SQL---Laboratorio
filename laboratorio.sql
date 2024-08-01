DROP DATABASE IF EXISTS db_laboratorio; 

CREATE DATABASE db_laboratorio;

USE db_laboratorio;

CREATE TABLE CLIENTES (
ID_CLIENTE INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
NOMBRE_CLIENTE VARCHAR (100) NOT NULL,
EMPRESA VARCHAR (100),
MAIL VARCHAR (100) NOT NULL,
TELEFONO VARCHAR (20)
);

CREATE TABLE MUESTRAS (
ID_MUESTRAS INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
N_ORDEN INT NOT NULL,
ID_CLIENTE INT NOT NULL,
FECHA_RECEPCION DATE NOT NULL,
TIPO_DE_MUESTRA ENUM('efluente', 'agua', 'suelo'),
PROCEDENCIA VARCHAR (50), 
DESCRIPCION TEXT ,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
);
DROP TABLE IF EXISTS DETERMINACIONES ;
CREATE TABLE DETERMINACIONES (
ID_DETERMINACION INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
ID_MUESTRAS INT NOT NULL, 
PARAMETROS ENUM('pH', 'conductividad', 'calcio', 'magnesio', 'sodio', 'potasio', 'sulfatos', 'cloruros'),
FOREIGN KEY (ID_MUESTRAS) REFERENCES MUESTRAS (ID_MUESTRAS)
);

CREATE TABLE TECNICOS (
ID_TECNICO INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
NOMBRE VARCHAR (20),
APELLIDO VARCHAR (20),
ESPECIALIDAD VARCHAR (50),
TELEFONO VARCHAR (20)
);

CREATE TABLE RESULTADOS (
ID_RESULTADOS INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
ID_DETERMINACION INT NOT NULL,
RESULTADO DECIMAL (7,4),
UNIDAD VARCHAR(20),
ID_TECNICO INT,
FOREIGN KEY (ID_DETERMINACION) REFERENCES DETERMINACIONES (ID_DETERMINACION),
FOREIGN KEY (ID_TECNICO) REFERENCES TECNICOS (ID_TECNICO)
);



-- INSERTAR VALORES A LAS TABLAS
INSERT INTO CLIENTES (NOMBRE_CLIENTE , EMPRESA , MAIL , TELEFONO)
VALUES
('Ana Gómez', 'Tech Solutions', 'ana.gomez@techsolutions.com', '+54 9 11 1234 5678'),
('Luis Pérez', 'Innovatech', 'luis.perez@innovatech.com', '+54 9 11 2345 6789'),
('María López', 'Global Corp', 'maria.lopez@globalcorp.com', '+54 9 11 3456 7890'),
('Carlos Martínez', 'NextGen', 'carlos.martinez@nextgen.com', '+54 9 11 4567 8901'),
('Laura Fernández', 'Creative Minds', 'laura.fernandez@creativeminds.com', '+54 9 11 5678 9012'),
('Juan Rodríguez', 'Tech Ventures', 'juan.rodriguez@techventures.com', '+54 9 11 6789 0123'),
('Sofía González', 'Innovators Inc.', 'sofia.gonzalez@innovatorsinc.com', '+54 9 11 7890 1234'),
('Pedro Ramírez', 'Future Tech', 'pedro.ramirez@futuretech.com', '+54 9 11 8901 2345'),
('Valeria Díaz', 'Bright Ideas', 'valeria.diaz@brightideas.com', '+54 9 11 9012 3456'),
('Martín Gómez', 'Tech World', 'martin.gomez@techworld.com', '+54 9 11 0123 4567'),
('Elena Morales', 'Digital Solutions', 'elena.morales@digitalsolutions.com', '+54 9 11 1234 5679'),
('Ricardo Fernández', 'Tech Innovators', 'ricardo.fernandez@techinnovators.com', '+54 9 11 2345 6780'),
('Gabriela Castillo', 'Modern Tech', 'gabriela.castillo@moderntech.com', '+54 9 11 3456 7891'),
('Javier Martínez', 'New Horizons', 'javier.martinez@newhorizons.com', '+54 9 11 4567 8902'),
('Sandra Ruiz', 'Future Leaders', 'sandra.ruiz@futureleaders.com', '+54 9 11 5678 9013');

SELECT * FROM CLIENTES;

INSERT INTO MUESTRAS (N_ORDEN , ID_CLIENTE ,FECHA_RECEPCION , TIPO_DE_MUESTRA , PROCEDENCIA , DESCRIPCION)
VALUES
(1, 7, '2024-01-05', 'agua', 'Buenos Aires, CABA', 'Muestra de agua del Río de la Plata, con bajo nivel de contaminantes.'),
(2, 15, '2024-02-15', 'suelo', 'Córdoba, Capital', 'Suelo agrícola con niveles de nutrientes adecuados para cultivo.'),
(3, 3, '2024-03-01', 'efluente', 'Rosario, Santa Fe', 'Efluente de planta industrial con alta concentración de metales pesados.'),
(4, 10, '2024-04-20', 'agua', 'Mendoza, Capital', 'Muestra de agua del Río Mendoza, con trazas de sedimentos.'),
(5, 5, '2024-05-10', 'suelo', 'Salta, Capital', 'Suelo en zona rural con alta presencia de minerales naturales.'),
(6, 2, '2024-06-07', 'efluente', 'Tucumán, San Miguel de Tucumán', 'Efluente de planta de tratamiento con sólidos en suspensión.'),
(7, 9, '2024-07-22', 'agua', 'San Juan, Capital', 'Muestra de agua de pozo con presencia de sales minerales.'),
(8, 6, '2024-08-18', 'suelo', 'La Plata, Buenos Aires', 'Suelo urbano con presencia de metales pesados, posible contaminación.'),
(9, 12, '2024-09-12', 'efluente', 'Neuquén, Capital', 'Efluente de planta de energía con residuos orgánicos.'),
(10, 8, '2024-10-15', 'agua', 'Mar del Plata, Buenos Aires', 'Muestra de agua de playa, con presencia de microorganismos marinos.'),
(11, 4, '2024-11-25', 'suelo', 'San Luis, Capital', 'Suelo en área agrícola con niveles de pesticidas dentro del rango permitido.'),
(12, 13, '2024-12-05', 'efluente', 'Jujuy, San Salvador de Jujuy', 'Efluente de fábrica textil con alto contenido de colorantes.'),
(13, 1, '2024-01-20', 'agua', 'Posadas, Misiones', 'Muestra de agua del Río Paraná, calidad óptima para consumo.'),
(14, 14, '2024-02-25', 'suelo', 'Santa Rosa, La Pampa', 'Suelo en área de pastoreo, con bajo nivel de contaminantes.'),
(15, 11, '2024-03-30', 'efluente', 'Bahía Blanca, Buenos Aires', 'Efluente de planta petroquímica con residuos metálicos.'),
(16, 15, '2024-04-15', 'agua', 'Corrientes, Capital', 'Muestra de agua del Río Paraná, presencia de algas.'),
(17, 7, '2024-05-22', 'suelo', 'Rafaela, Santa Fe', 'Suelo en zona de cultivo con presencia de nitratos.'),
(18, 8, '2024-06-12', 'efluente', 'Catamarca, Capital', 'Efluente de planta de tratamiento con bajo contenido de sólidos.'),
(19, 10, '2024-07-29', 'agua', 'San Fernando del Valle de Catamarca', 'Muestra de agua de embalse, presencia de microorganismos.'),
(20, 12, '2024-08-19', 'suelo', 'Villa María, Córdoba', 'Suelo en área industrial con presencia de residuos sólidos.');

SELECT * FROM MUESTRAS;

INSERT INTO DETERMINACIONES (ID_MUESTRAS , PARAMETROS)
VALUES
(1, 'pH'),
(1, 'conductividad'),
(1, 'calcio' ),
(1, 'sodio' ),
(2, 'pH'),
(2, 'conductividad'),
(2, 'calcio'),
(2, 'magnesio'),
(3, 'pH'),
(3, 'sodio'),
(3, 'potasio'),
(4, 'conductividad'),
(4, 'sulfatos'),
(5, 'pH'),
(5, 'magnesio'),
(6, 'calcio'),
(6, 'cloruros'),
(7, 'pH'),
(7, 'conductividad'),
(7, 'potasio'),
(8, 'pH'),
(8, 'sodio'),
(8, 'sulfatos'),
(9, 'conductividad'),
(9, 'calcio'),
(9, 'pH'),
(10, 'magnesio'),
(10, 'cloruros'),
(11, 'sodio'),
(11, 'sulfatos'),
(12, 'conductividad'),
(12, 'calcio'),
(12, 'pH'),
(13, 'magnesio'),
(13, 'potasio'),
(13, 'sulfatos'),
(14, 'pH'),
(14, 'sodio'),
(14, 'calcio'),
(15, 'conductividad'),
(15, 'sulfatos'),
(15, 'cloruros');

SELECT * FROM DETERMINACIONES;

INSERT INTO TECNICOS (NOMBRE , APELLIDO , ESPECIALIDAD , TELEFONO)
VALUES
('Juan', 'Pérez', 'analista', '+54 11 1234 5678'),
('Ana', 'García', 'pasante', '+54 11 2345 6789'),
('Luis', 'Martínez', 'analista', '+54 261 9876 5432'),
('Laura', 'Fernández', 'pasante', '+54 351 3456 7890'),
('Carlos', 'López', 'analista', '+54 11 5678 1234');

SELECT * FROM TECNICOS;

INSERT INTO RESULTADOS (ID_DETERMINACION , RESULTADO , UNIDAD , ID_TECNICO)
VALUES
(3, 50.00, 'mg/L',5),
(7, NULL, NULL,1),
(16, 45.00, 'mg/L',5),
(39, 48.00, 'mg/L',5),
(25, 55.00, 'mg/L',5),
(32, 56.00, 'mg/L',1),
(15, NULL, NULL,1),
(8, NULL, NULL,1),
(27, 28.00, 'mg/L',1),
(34, 22.00, 'mg/L',1),
(42, 24.00, 'mg/L',1),
(28, NULL, NULL,1),
(17, 22.00, 'mg/L',1),
(2, NULL, NULL,1),
(12, 500.00, 'µS/cm',2),
(24, 480.00, 'µS/cm',2),
(40, 490.00, 'µS/cm',2),
(31, NULL, NULL,1),
(6, 470.00, 'µS/cm',2),
(19, NULL, NULL,1),
(1, NULL, NULL,1),
(26, 7.0, 'pH',3),
(18, 7.5, 'pH',3),
(5, 6.9, 'pH',3),
(9, 7.2, 'pH',3),
(33, 6.8, 'pH',3),
(37, 7.1, 'pH',3),
(14, NULL, NULL,1),
(21, NULL, NULL,1),
(11, 12.00, 'mg/L',1),
(35, 15.00, 'mg/L',1),
(20, NULL, NULL,1),
(36, NULL, NULL,1),
(23, 30.00, 'mg/L',1),
(30, NULL, NULL,1),
(13, 40.00, 'mg/L',1),
(41, NULL, NULL,1),
(10, 20.00, 'mg/L',1),
(4, NULL, NULL,1),
(22, NULL, NULL,1),
(29, 35.00, 'mg/L',3),
(38, 35.00, 'mg/L',3);

-- VIEW PARA VISUALIZAR EL NUMERO DE LA MUESTRA, EL TIPO Y LOS PARAMETROS QUE HAY QUE DETERMINAR
SELECT D.ID_DETERMINACION, M.ID_MUESTRAS, M.TIPO_DE_MUESTRA, D.PARAMETROS
FROM MUESTRAS AS M
       JOIN DETERMINACIONES AS D
       ON M.ID_MUESTRAS = D.ID_MUESTRAS
ORDER BY ID_MUESTRAS;


CREATE OR REPLACE VIEW VIEW_DETERMINACIONES
 AS ( 
      SELECT D.ID_DETERMINACION, M.ID_MUESTRAS, M.TIPO_DE_MUESTRA, D.PARAMETROS
      FROM MUESTRAS AS M
         JOIN DETERMINACIONES AS D
         ON M.ID_MUESTRAS = D.ID_MUESTRAS
      ORDER BY ID_MUESTRAS
   );  

 SELECT * FROM VIEW_DETERMINACIONES;
 
 -- VIEW PARA VISUALIZAR EL NUMERO DE LA MUESTRA, EL TIPO Y TODOS LOS PARAMETROS, ESTEN REALIZADOS O NO, CON SU RESULTADO SI CORRESPONDE
SELECT V.ID_DETERMINACION, V.ID_MUESTRAS, V.TIPO_DE_MUESTRA, V.PARAMETROS , R.RESULTADO , R.UNIDAD 
FROM VIEW_DETERMINACIONES AS V
      JOIN RESULTADOS AS R
      ON V.ID_DETERMINACION = R.ID_DETERMINACION;
 
CREATE OR REPLACE VIEW VIEW_DETERM_RESULTADOS
 AS ( 
      SELECT V.ID_DETERMINACION, V.ID_MUESTRAS, V.TIPO_DE_MUESTRA, V.PARAMETROS , R.RESULTADO , R.UNIDAD 
      FROM VIEW_DETERMINACIONES AS V
      JOIN RESULTADOS AS R
      ON V.ID_DETERMINACION = R.ID_DETERMINACION
      );  

SELECT * FROM VIEW_DETERM_RESULTADOS;
 
-- VIEW PARA VISUALIZAR CUALES SON LAS DETERMINACIONES QUE AUN NO SE HAN REALIZADO

SELECT ID_DETERMINACION , RESULTADO
FROM RESULTADOS
WHERE RESULTADO IS NULL ;
	

CREATE OR REPLACE VIEW VIEW_DETERM_FALTANTES
 AS (
     SELECT ID_DETERMINACION , RESULTADO
     FROM RESULTADOS
     WHERE RESULTADO IS NULL 
     );
     
SELECT * FROM VIEW_DETERM_FALTANTES;


-- FUNCION PARA SABER EL ESTADO DE LA MUESTRA
DROP FUNCTION IF EXISTS FN_DETERMINACION_ESTADO_MUESTRA;
DELIMITER //
CREATE FUNCTION FN_DETERMINACION_ESTADO_MUESTRA(ID_DETERMINACION INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(20);
    -- Verificar si hay algún resultado para la determinación
    IF EXISTS (
        SELECT 1
        FROM RESULTADOS
        WHERE ID_DETERMINACION = ID_DETERMINACION
        AND RESULTADO IS NOT NULL
    )THEN
        SET estado = 'Pendiente';
    ELSE
        SET estado = 'Terminada';
    END IF;
    RETURN estado;
END //
DELIMITER ;

SELECT FN_DETERMINACION_ESTADO_MUESTRA(1) AS ESTADO_MUESTRA;


-- STORED PROCEDURES PARA INSERTAR MUESTRA 
DROP PROCEDURE IF EXISTS ISERTAR_MUESTRA;
DELIMITER //
CREATE PROCEDURE ISERTAR_MUESTRA (
    IN  P_N_ORDEN INT,
    IN  P_ID_CLIENTE INT,
    IN  P_FECHA_RECEPCION DATE,
    IN  P_TIPO_DE_MUESTRA VARCHAR(20),
    IN  P_PROCEDENCIA VARCHAR(100),
    IN  P_DESCRIPCION VARCHAR (200)
)
BEGIN
    INSERT INTO MUESTRAS (N_ORDEN , ID_CLIENTE , FECHA_RECEPCION , TIPO_DE_MUESTRA , PROCEDENCIA , DESCRIPCION )
    VALUES ( P_N_ORDEN ,  P_ID_CLIENTE ,  P_FECHA_RECEPCION ,  P_TIPO_DE_MUESTRA ,  P_PROCEDENCIA ,  P_DESCRIPCION);
END //
DELIMITER ;

CALL ISERTAR_MUESTRA (101, 5, '2024-07-25', 'agua', 'Buenos Aires','Muestra tomada en planta potabilizadora en provincia');


-- STORED PROCEDURES PARA INGRESAR TECNICO
DELIMITER //
CREATE PROCEDURE REGISTRAR_TECNICO (
    IN P_NOMBRE VARCHAR(50),
    IN P_APELLIDO VARCHAR(50),
    IN P_ESPECIALIDAD ENUM('analista', 'pasante'),
    IN P_TELEFONO VARCHAR(15)
)
BEGIN
    INSERT INTO TECNICOS (NOMBRE, APELLIDO, ESPECIALIDAD, TELEFONO)
    VALUES (P_NOMBRE, P_APELLIDO, P_ESPECIALIDAD, P_TELEFONO);
END //
DELIMITER ;

CALL REGISTRAR_TECNICO('Pedro', 'Ruiz', 'analista', '11 6789 1234');

-- STORED PROCEDURES PARA OBTENER ESTADISTICAS DE LAS DETERMINACIONES
DELIMITER //
CREATE PROCEDURE obtener_estadisticas_parametro(
    IN parametro VARCHAR(20),
    OUT max_resultado DECIMAL(10, 2),
    OUT min_resultado DECIMAL(10, 2),
    OUT promedio DECIMAL(10, 2)
)
BEGIN
    SELECT MAX(resultado) INTO max_resultado
    FROM resultados
    JOIN determinaciones ON resultados.id_determinacion = determinaciones.id
    WHERE determinaciones.parametro = parametro;
    
    SELECT MIN(resultado) INTO min_resultado
    FROM resultados
    JOIN determinaciones ON resultados.id_determinacion = determinaciones.id
    WHERE determinaciones.parametro = parametro;
    
    SELECT AVG(resultado) INTO promedio
    FROM resultados
    JOIN determinaciones ON resultados.id_determinacion = determinaciones.id
    WHERE determinaciones.parametro = parametro;
END //

DELIMITER ;

CALL obtener_estadisticas_parametro('pH', @max_resultado, @min_resultado, @promedio);
SELECT @max_resultado AS max_resultado, @min_resultado AS min_resultado, @promedio AS promedio;



-- STORED PROCEDURES PARA PASAJE DE UNIDADES

DROP PROCEDURE IF EXISTS PR_CONVERTIR_UNIDADES;
 
DELIMITER //

CREATE PROCEDURE PR_CONVERTIR_UNIDADES(
    IN P_VALOR DECIMAL(10, 2),
    IN P_UNIDAD VARCHAR(20),
    OUT P_RESULTADO DECIMAL(10, 2),
    OUT P_UNIDAD_FINAL VARCHAR(20)
)
BEGIN
    -- Inicializar valores por defecto
    SET P_RESULTADO = P_VALOR;
    SET P_UNIDAD_FINAL = P_UNIDAD;
    
    -- Realizar la conversión según la unidad
    IF P_UNIDAD = 'mg/L' THEN
        SET P_RESULTADO = P_VALOR / 1000;
        SET P_UNIDAD_FINAL = 'g/L';
    ELSEIF P_UNIDAD = 'g/L' THEN
        SET P_RESULTADO = P_VALOR * 1000;
        SET P_UNIDAD_FINAL = 'mg/L';
    END IF;
END //

DELIMITER ;

-- Declarar variables para recibir los resultados
SET @resultado = 0;
SET @unidad_final = '';

-- Llamar al procedimiento
CALL PR_CONVERTIR_UNIDADES(500.00, 'mg/L', @resultado, @unidad_final);

-- Obtener los resultados
SELECT @resultado AS valor_convertido, @unidad_final AS unidad_convertida;


DROP TRIGGER IF EXISTS TR_INSERT_MUESTRA;
DELIMITER //
CREATE TRIGGER TR_INSERT_MUESTRA 
BEFORE INSERT ON db_laboratorio.muestras
FOR EACH ROW
BEGIN 
END;
// DELIMITER;
