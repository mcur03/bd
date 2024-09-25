CREATE DATABASE rfast02;
use rfast02;
-- Tabla: gen_p_lista_opcion
CREATE TABLE gen_p_lista_opcion (
    id SERIAL PRIMARY KEY,
    categoria VARCHAR(255),
    descripcion TEXT,
    valor VARCHAR(255),
    nombre VARCHAR(255),
    abreviatura VARCHAR(50),
    habilita BOOLEAN
);
select * from gen_p_lista_opcion where categoria = 'TipoResultado';
INSERT INTO gen_p_lista_opcion (categoria, descripcion, valor, nombre, abreviatura, habilita) VALUES 
('TipoResultado', 'Tipos de resultado para laboratorio clínico', 1, 'Numerico', '', true),
('TipoResultado', 'Tipos de resultado para laboratorio clínico', 2, 'Texto', '', true),
('TipoResultado', 'Tipos de resultado para laboratorio clínico', 3, 'Opción múltiple con múltiple respuesta', '', false),
('TipoResultado', 'Tipos de resultado para laboratorio clínico', 4, 'Texto largo', '', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 3, 'Cédula de extranjería', 'CE', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 4, 'Registro civil', 'RC', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 5, 'Pasaporte', 'PA', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 6, 'Adulto sin identificación', 'AS', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 7, 'Menor sin identificación', 'MS', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 8, 'Número único de identificación', 'NU', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 9, 'Certificado de nacido vivo', 'NV', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 10, 'Salvoconducto', 'SC', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 11, 'Nit', 'NIT', false),
('TipoIdentificacion', 'Tipos de identificación de personas', 12, 'Carnet diplomático', 'CD', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 13, 'Permiso especial de permanencia', 'PE', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 14, 'Residente especial para la paz', 'RE', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 15, 'Permiso por protección temporal', 'PT', true),
('TipoIdentificacion', 'Tipos de identificación de personas', 16, 'Documento extranjero', 'DE', true),
('RegSegSocial', 'Regímenes de seguridad social', 1, 'Particular', '', true),
('RegSegSocial', 'Regímenes de seguridad social', 4, 'No asegurado', '', true),
('RegSegSocial', 'Regímenes de seguridad social', 5, 'Otro regímen', '', true),
('RegSegSocial', 'Regímenes de seguridad social', 6, 'Accidente de tránsito / ECAT', '', true),
('RegSegSocial', 'Regímenes de seguridad social', 7, 'Riesgo laboral', '', true),
('RegSegSocial', 'Regímenes de seguridad social', 8, 'Desplazado', '', true),
('TipoProf', 'Tipo de profesional', 1, 'Médico especialista', '1', true),
('TipoProf', 'Tipo de profesional', 2, 'Médico general', '2', true),
('TipoProf', 'Tipo de profesional', 3, 'Enfermera', '3', true),
('TipoProf', 'Tipo de profesional', 4, 'Auxiliar de enfermería', '4', true),
('TipoProf', 'Tipo de profesional', 5, 'Otro', '5', true);


-- Tabla: gen_m_persona
CREATE TABLE gen_m_persona (
    id SERIAL PRIMARY KEY,
    tipo_identificacion INT REFERENCES gen_p_lista_opcion(id),
    numero_identificacion VARCHAR(20),
    apellido1 VARCHAR(255),
    apellido2 VARCHAR(255),
    nombre1 VARCHAR(255),
    nombre2 VARCHAR(255),
    fecha_nacimiento DATE,
    sexo_biologico INT REFERENCES gen_p_lista_opcion(id),
    direccion VARCHAR(255),
    telefono_movil VARCHAR(20),
    email VARCHAR(255)
);
select * from gen_m_persona ;
INSERT INTO gen_m_persona (tipo_identificacion, numero_identificacion, apellido1, apellido2, nombre1, nombre2, fecha_nacimiento, sexo_biologico, direccion, telefono_movil, email) VALUES 
(1, '7013019324', 'Prof: Linares', 'Peres', 'Emilio', 'Eladio', NULL, 5, NULL, NULL, NULL),
(1, '4892359501', 'Prof: Ramón', 'Cabán', 'Hugo Alberto', 'Tobías', NULL, 5, NULL, NULL, NULL),
(1, '4267246836', 'Prof: Porras', 'Delapaz', 'Vicente', 'Diego', NULL, 5, NULL, NULL, NULL),
(1, '8737977210', 'Prof: Palomo', 'Zaragoza', 'Victoria', '', NULL, 6, NULL, NULL, NULL),
(15, '7188854955', 'Madrid', 'Rojas', 'Felipe', '', '2002-10-18', 5, 'VEREDA EL AMARILLO F BUENAVIST', '3227237050', 'mateodiazcastellanos7@gmail.com'),
(16, '6825930695', 'Mata', 'Sauceda', 'Isidora', 'Candela', '2003-05-01', 6, 'CRA B2- 56 A SUR', '3143170879', 'facturacionelectronicahrv@gmail.com'),
(17, '8919263074', 'Lira', 'Barragán', 'Lourdes', 'Helena', '2000-05-13', 6, 'BOLIVAR', '3132710253', 'facturacionelectronicahrv@gmail.com'),
(18, '6757975448', 'Caraballo', 'Tello', 'Emilia', 'Margarita', '2001-11-24', 6, 'DG 8 C N 19 -32TIERRA PROMETID', '3107993564', 'facturacionelectronicahrv@gmail.com'),
(19, '9935758641', 'Arguello', 'Mora', 'Rosalía', 'Felicidad', '2001-12-25', 6, 'PUENTE NACIONAL [ SANTANDER ]', '3105691408', 'fact.hrv@gmail.com'),
(20, '1452947522', 'Muñoz', 'Bustamante', 'Óscar', 'Ignacio', '2001-11-22', 5, 'CR 2-4-37', '3134981617', 'fac@hotmail.com'),
(21, '5848557534', 'Villareal', 'Duran', 'Amparo', '', '2002-08-21', 6, 'BARBOSA [ SANTANDER ]', '3217597890', 'fac@gmail.com'),
(22, '8370945450', 'Berríos', 'Pabón', 'Claudia', '', '2002-09-14', 6, 'VELEZ SANTANDER', '3203747227', 'facturacionelectronicahrv@gmail.com'),
(1, '3478289227', 'Almanza', 'Cuellar', 'Amparo', 'Elvira', '2003-06-17', 6, 'ESCUELA DE CARABINEROS', '3122632364', 'facturacionhv@gmail.com'),
(2, '2572063131', 'Prieto', 'Meléndez', 'Serena', 'Elsa', '2001-05-10', 6, 'BARRIO SAN LUIS', '3153139387', 'fac@gmail.com'),
(1, '8207160588', 'Irizarry', 'López', 'Esperanza', 'Amparo', '1994-02-03', 6, 'LOS CEREZOS', '3223747871', 'facturacionelectronicahrv@gmail.com'),
(1, '5726631405', 'Armendáriz', 'Razo', 'Lourdes', 'Valeria', '2000-08-06', 6, 'LA PAZ [ SANTANDER ]', '3132557538', 'fac@gmail.com'),
(15, '5539874870', 'de Jesús', 'Gaona', 'Antonia', '', '1991-12-08', 6, 'BARRIO LAS PALMAS', '3178621290', 'fac@gmail.com'),
(16, '5033788809', 'Miramontes', 'Velásquez', 'Carlota', 'Selena', '2003-01-29', 6, 'BARRIO AGUAS CLARAS', '3143228156', 'fac@gmail.com');


-- Tabla: gen_p_eps
CREATE TABLE gen_p_eps (
    id SERIAL PRIMARY KEY,
    codigo_alfa VARCHAR(20),
    razon_social VARCHAR(255),
    nit VARCHAR(20),
    habilita BOOLEAN
);
select * from gen_p_eps;
INSERT INTO gen_p_eps (codigo_alfa, razon_social, nit, habilita) VALUES 
('05756', 'CENTRO SOCIAL MUNICIPIO DE SONSO', '890980357', true),
('11001', 'SECRETARIA DE SALUD DISTRITAL DE SALUD BOGOTA', '899999061', true),
('14-17', 'SEGUROS ALFA ARL', '860031979', true),
('14-18', 'LIBERTY SEGUROS DE VIDA S.A', '860039988', true),
('14-19', 'SEGUROS DE VIDA DEL ESTADO', '860009174', true),
('14-23', 'POSITIVA COMPAÑIA DE SEGUROS S.A', '860011153', true),
('14-25', 'COLMENA SEGUROS ARL', '800226175', true),
('14-28', 'SEGUROS VIDA SURA ARL', '890903790', true),
('14-29', 'EQUIDAD SEGUROS', '830008686', true),
('14-30', 'MAPFRE COLOMBIA VIDA SEGUROS', '830054904', true);


-- Tabla: fac_p_nivel
CREATE TABLE fac_p_nivel (
    id SERIAL PRIMARY KEY,
    id_eps INT REFERENCES gen_p_eps(id),
    nivel VARCHAR(255),
    nombre VARCHAR(255),
    id_regimen INT REFERENCES gen_p_lista_opcion(id)
);
select * from fac_p_nivel;
INSERT INTO fac_p_nivel (id_eps, nivel, nombre, id_regimen) VALUES 
(6, 'N', 'EXCENTO ESTUD', 29),
(6, '0', 'EXCENTO ARL', 30),
(7, 'N', 'excento', 31),
(7, '0', 'EXCENTO COPAGO', 32),
(8, 'N', 'excento', 33),
(8, '0', 'EXCENTO COPAGO', 34),
(9, '0', 'EXCENTO COPAGO', 3),
(9, '1', 'EXCENTO', 4),
(10, '0', 'EXCENTO COPAGO', 3),
(10, '1', 'excento copago', 4),
(11, '1', 'EXCENTO OT', 3),
(11, '0', 'EXCENTO', 4),
(12, 'EX', 'EXENTO', 29),
(13, '0', 'EXCENTO', 30),
(13, '1', 'NIVEL UNO', 31),
(13, '2', 'NIVEL DOS', 32),
(14, '0', 'EXCENTO', 33),
(14, '1', 'NIVEL UNO', 34),
(14, '2', 'NIVEL DOS', 29),
(14, '3', 'NIVEL TRES', 30);

-- Tabla: fac_m_tarjetero
CREATE TABLE fac_m_tarjetero (
    id SERIAL PRIMARY KEY,
    historia VARCHAR(20),
    id_persona INT REFERENCES gen_m_persona(id),
    id_regimen INT REFERENCES gen_p_lista_opcion(id),
    id_eps INT REFERENCES gen_p_eps(id),
    id_nivel INT REFERENCES fac_p_nivel(id)
);
select * from fac_m_tarjetero;
INSERT INTO fac_m_tarjetero (historia, id_persona, id_regimen, id_eps, id_nivel) VALUES 
( 'DE33920250', 9, 3, 1, 1),
( 'DE30704151', 10, 4, 2, 2),
( 'DE12010116', 11, 29, 3, 3),
( 'CE30608092', 12, 30, 4, 4),
( 'CE24552486', 13, 31, 5, 5),
( '1005196366', 14, 32, 6, 6),
( '1005196166', 15, 33, 7, 7),
( '1005342088', 16, 34, 8, 8),
( '80175496', 17, 3, 9, 9),
( 'CC4046284', 18, 4, 10, 10),
( '13616634', 19, 29, 11, 11),
( '1005228919', 20, 30, NULL, NULL),
( 'CC26629308', 21, 31, 12, 12),
( 'TI1095315029', 22, 32, 1, 13);

-- Tabla: fac_p_profesional
CREATE TABLE fac_p_profesional (
    id SERIAL PRIMARY KEY,
    codigo_profesional VARCHAR(20),
    id_persona INT REFERENCES gen_m_persona(id),
    registro_medico VARCHAR(20),
    id_tipo_prof INT REFERENCES gen_p_lista_opcion(id)
);
select * from fac_p_profesional;
INSERT INTO fac_p_profesional (codigo_profesional, id_persona, registro_medico, id_tipo_prof) VALUES 
('0059', 3, '685982/2014', 7),
('0060', 4, '097-04', 8),
('0061', 5, '14959', 35),
('0063', 6, '3249-2014', 36),
('0064', 7, '63437526', 37),
('0065', 8, '26427', 38),
('0067', 3, '04046-2010', 39),
('0070', 4, '0009709', 7),
('0072', 5, '0800/286', 8),
('0080', 6, '19219/88', 35);


-- Tabla: gen_p_documento
CREATE TABLE gen_p_documento (
    id SERIAL PRIMARY KEY,
    codigo_alfa VARCHAR(20),
    nombre VARCHAR(255),
    habilita BOOLEAN
);
select * from gen_p_documento;

-- Tabla: fac_p_cups
CREATE TABLE fac_p_cups (
    id SERIAL PRIMARY KEY,
    codigo_cup VARCHAR(20),
    nombre VARCHAR(255),
    habilita BOOLEAN
);
select * from fac_p_cups;
INSERT INTO fac_p_cups (codigo_cup, nombre, habilita) VALUES 
('033101', 'PUNCIÓN LUMBAR (DIAGNÓSTICA O TERAPÉUTICA)', true),
('18300', 'ESOFAGOGASTRODUODENOSCOPIA', true),
('18600', 'LAPAROSCOPIA EXPLORADORA', true),
('19001', 'ACETAMINOFÉN', true),
('19005', 'ACIDO DELTA AMINOLEVULÍNICO', true),
('19006', 'ACIDO FÓLICO', true),
('19010', 'ACIDO LÁCTICO', true),
('19014', 'ACIDO PIRÚVICO', true),
('19017', 'ACIDO ÚRICO', true),
('19019', 'ACIDO VALPRÓICO', true),
('19020', 'ACIDO VANIL MANDÉLICO', true),
('19025', 'ADRENOCORTICOTRÓPICA HORMONA ACTH', true),
('19036', 'ALBÚMINA', true),
('19039', 'ALCOHOL ETÍLICO', true),
('19043', 'ALCOHOL METÍLICO', true);


-- Tabla: lab_p_grupos
CREATE TABLE lab_p_grupos (
    id SERIAL PRIMARY KEY,
    codigo_alfa VARCHAR(20),
    nombre VARCHAR(255),
    habilita BOOLEAN
);
select * from lab_p_grupos;
INSERT INTO lab_p_grupos (codigo_alfa, nombre, habilita) VALUES
('__', 'VELEZ.LABCORESOFT', true),
('01', 'HEMATOLOGIA', true),
('02', 'UROANALISIS', true),
('03', 'PARASITOLOGIA', true),
('04', 'BIOQUIMICA SANGUINEA', true),
('05', 'MICROBIOLOGIA', true),
('06', 'INMUNOLOGIA', true),
('07', 'SERVICIO TRANSFUCIONAL', true),
('08', 'ESPECIALIZADOS', true);

-- Tabla: lab_p_procedimientos
CREATE TABLE lab_p_procedimientos (
    id SERIAL PRIMARY KEY,
    id_cups INT REFERENCES fac_p_cups(id),
    id_grupo_laboratorio INT REFERENCES lab_p_grupos(id),
    metodo VARCHAR(255)
);
select * from lab_p_procedimientos;
INSERT INTO lab_p_procedimientos (id_cups, id_grupo_laboratorio, metodo) VALUES 
(1, 1, ''),
(2, 2, ''),
(3, 3, 'COLORIMETRICO'),
(4, 4, 'COLORIMETRICA'),
(5, 5, 'COLORIMETRICO'),
(6, 6, ''),
(7, 7, ''),
(8, 8, ''),
(9, 9, ''),
(10, 10, 'VELEZ.LABCORESOFT'),
(11, 11, 'QUIMICA'),
(12, 1, ''),
(13, 2, 'COLORIMETRICO'),
(14, 3, 'COLORIMETRICO'),
(14, 4, ''),
(16, 5, ''),
(17, 6, 'COLORIMETRICO'),
(17, 7, 'COLORIMETRIA');


-- Tabla: lab_p_pruebas
CREATE TABLE lab_p_pruebas (
    id SERIAL PRIMARY KEY,
    id_procedimiento INT REFERENCES lab_p_procedimientos(id),
    codigo VARCHAR(20),
    nombre VARCHAR(255),
    id_tipo_resultado INT REFERENCES gen_p_lista_opcion(id),
    unidad_medida VARCHAR(50),
    habilita BOOLEAN
);
select * from lab_p_pruebas;
INSERT INTO lab_p_pruebas (id_procedimiento, codigo, nombre, id_tipo_resultado, unidad_medida, habilita) VALUES 
(1, '2498', 'antibiograma (disco)', 9, '', false),
(2, '8215', 'antibiograma', 10, '', false),
(3, '2499', 'antibiograma (mic) metodo manual', 11, '', false),
(4, '01', 'rastreo de anticuerpos irregulares', 12, '', true),
(5, '02', 'coombs indirecto', 13, '', true),
(6, '01', 'grupo  sanguineo', 14, '', true),
(7, '02', 'factor rh', 9, '', true),
(8, '03', 'observaciones:', 10, '', true),
(9, '04', 'células cde', 11, '', true),
(10, '04', 'observaciones', 12, '', true),
(11, '01', 'baciloscopia de esputo', 13, '', true),
(12, '02', 'baciloscopia de jugo gastrico', 14, '', true),
(13, '03', 'baciloscopia de l.c.r', 9, '', true),
(14, '80481', 'baciloscopia 2', 10, '', false),
(15, 'IIO', 'calidad de la muestra', 11, 'x10^3/uL', false);


-- Tabla: lab_p_pruebas_opciones
CREATE TABLE lab_p_pruebas_opciones (
    id SERIAL PRIMARY KEY,
    id_prueba INT REFERENCES lab_p_pruebas(id),
    opcion VARCHAR(255),
    valor_ref_min_f NUMERIC,
    valor_ref_max_f NUMERIC,
    valor_ref_min_m NUMERIC,
    valor_ref_max_m NUMERIC
);
select * from lab_p_pruebas_opciones;

INSERT INTO lab_p_pruebas_opciones (id_prueba, opcion, valor_ref_min_f, valor_ref_max_f, valor_ref_min_m, valor_ref_max_m) VALUES
( 1, 'OTROS', 0.00, 0.00, 0.00, 0.00),
( 2, 'Hombre/Mujer', 4.70, 23.30, 4.70, 23.30),
(3, 'A', 0.00, 0.00, 0.00, 0.00),
(4, 'B', 0.00, 0.00, 0.00, 0.00),
(5, 'O', 0.00, 0.00, 0.00, 0.00),
(6, 'AB', 0.00, 0.00, 0.00, 0.00),
( 7, 'NEGATIVO PARA BAAR', 0.00, 0.00, 0.00, 0.00),
( 8, 'NEGATIVO PARA BACILO ACIDO ALCOHOL RESISTENTE (BAAR)', 0.00, 0.00, 0.00, 0.00),
( 9, 'NO SE OBSERVAN BAAR', 0.00, 0.00, 0.00, 0.00),
(10, '+', 0.00, 0.00, 0.00, 0.00),
( 11, '++', 0.00, 0.00, 0.00, 0.00),
( 12, '+++', 0.00, 0.00, 0.00, 0.00),
( 13, '1-9 BAAR', 0.00, 0.00, 0.00, 0.00),
( 14, 'Aumentada', 0.00, 0.00, 0.00, 0.00),
( 15, 'Moderada', 0.00, 0.00, 0.00, 0.00),
( 16, 'Escasa', 0.00, 0.00, 0.00, 0.00),
( 17, 'Negativo: no se observan Microorganismos encapsulados', 0.00, 0.00, 0.00, 0.00),
( 1, 'Positivo: se observan Microorganismos encapsulados', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a las 72 horas', 0.00, 0.00, 0.00, 0.00),
( 3, 'Positivo', 0.00, 0.00, 0.00, 0.00),
( 3, 'Negativo a las 24 horas', 0.00, 0.00, 0.00, 0.00),
( 5, 'Negativo a las 48 horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Negativo a las 24 horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Negativo a las 48 horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Positivo', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a las 24  horas', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a los 5 dias', 0.00, 0.00, 0.00, 0.00),
( 2, 'Positivo', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a las 72 horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Negativo a las 48  horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Positivo', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a las 72 horas', 0.00, 0.00, 0.00, 0.00),
( 3, 'Negativo a las 48  horas', 0.00, 0.00, 0.00, 0.00),
( 2, 'Negativo a las 24  horas', 0.00, 0.00, 0.00, 0.00),
( 1, 'Negativo a los 5 dias', 0.00, 0.00, 0.00, 0.00);

-- Tabla: lab_m_orden
CREATE TABLE lab_m_orden(
    id SERIAL PRIMARY KEY,
    id_documento INT REFERENCES gen_p_documento(id),
    orden VARCHAR(20),
    fecha TIMESTAMP,
    id_historia INT REFERENCES fac_m_tarjetero(id),
    id_profesional_ordena INT REFERENCES fac_p_profesional(id),
    profesional_externo BOOLEAN
);
select * from lab_m_orden;
INSERT INTO lab_m_orden (id_documento, orden, fecha, id_historia, id_profesional_ordena, profesional_externo) VALUES
(1, 175684, '2024-07-09 11:01:01', 1, 1, true),
(2, 125165, '2024-07-09 11:15:02', 2, 2, true),
(2, 125024, '2024-07-08 11:30:02', 3, 3, true),
(2, 125358, '2024-07-10 11:20:02', 4, 4, true),
(2, 124005, '2024-07-02 10:15:02', 5, 5, true),
(2, 125434, '2024-07-10 12:25:02', 6, 6, true),
(2, 125248, '2024-07-09 12:25:02', 7, 7, true),
(2, 125242, '2024-07-09 12:20:03', 8, 8, true),
(2, 125267, '2024-07-09 12:30:06', 9, 9, true),
(2, 124479, '2024-07-04 12:15:02', 10, 10, true),
(2, 125462, '2024-07-10 14:55:02', 11, 11, true),
(2, 124220, '2024-07-03 11:20:02', 12, 12, true),
(2, 124812, '2024-07-06 13:10:02', 13, 13, true),
(2, 124635, '2024-07-05 12:10:02', 14, 14, true),
(2, 124036, '2024-07-02 11:30:02', 15, 15, true);

-- Tabla: lab_m_orden_resultados
CREATE TABLE lab_m_orden_resultados (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP,
    id_orden INT REFERENCES lab_m_orden(id),
    id_procedimiento INT REFERENCES lab_p_procedimientos(id),
    id_prueba INT REFERENCES lab_p_pruebas(id),
    id_pruebaopcion INT REFERENCES lab_p_pruebas_opciones(id),
    res_opcion VARCHAR(255),
    res_numerico NUMERIC,
    res_texto TEXT,
    res_memo TEXT,
    num_procesamientos INT
);
select* from lab_m_orden_resultados;
INSERT INTO lab_m_orden_resultados (fecha, id_orden, id_procedimiento, id_prueba, id_pruebaopcion, res_opcion, res_numerico, res_texto, res_memo, num_procesamientos) VALUES 
('2024-07-06 21:20:01', 1, 1, 1, 1, 'Amarillo', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 2, 2, 2, 2, 'Ligeramente Turbio', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 3, 3, 3, 3, 'Ligeramente Turbio', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 4, 4, 4, 4, '0-2 XC', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 5, 5, 5, 5, '2-4 XC', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 6, 6, 6, 6, '0-2 XC', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 7, 7, 7, 7, '2-4 XC', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 8, 8, 8, 8, '0-2 XC', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 9, 9, 9, 9, 'Escasas', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 1, 10, 10, 10, '+', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 1, 11, 11, 11, '+', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 1, 12, 12, 12, 'Negativo', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 1, 13, 13, 12, 'Negativo', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 1, 15, 14, 1, 'Negativo', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 1, 15, 15, 1, 'Negativo', NULL, NULL, NULL, 1),
('2024-07-06 21:20:01', 1, 1, 16, 1, 'Negativo', NULL, NULL, NULL, 1),
('2024-07-02 06:26:37', 1, 1, 17, 1, 'Negativo', NULL, NULL, NULL, 1);


-- ordenes 
SELECT 
	concat(gen_m_persona.nombre1, ' ',gen_m_persona.nombre2,' ', gen_m_persona.apellido1,' ',gen_m_persona.apellido1) as Nombre,
    lab_m_orden.fecha AS Fecha_Orden,
    gen_p_documento.codigo_alfa AS Codigo_Documento,
    lab_m_orden.orden AS Numero_Orden
FROM 
    lab_m_orden
JOIN 
    fac_m_tarjetero ON lab_m_orden.id_historia = fac_m_tarjetero.id
JOIN 
    gen_m_persona ON fac_m_tarjetero.id_persona = gen_m_persona.id
JOIN 
    gen_p_documento ON lab_m_orden.id_documento = gen_p_documento.id
WHERE 
    gen_m_persona.id = 2;  -- Aquí puedes especificar el número de identificación del paciente

SELECT * FROM gen_m_persona WHERE numero_identificacion = '123456789';
SELECT * 
FROM fac_m_tarjetero 
JOIN lab_m_orden ON fac_m_tarjetero.id = lab_m_orden.id_historia;

-- login

SELECT 
    lopcion.nombre AS tipo_documento,  
    persona.numero_identificacion AS numero_documento, 
    persona.fecha_nacimiento AS fecha_nacimiento
FROM 
    gen_m_persona persona
JOIN 
    gen_p_lista_opcion lopcion 
ON 
    persona.tipo_identificacion = lopcion.valor
WHERE 
    lopcion.descripcion = 'Cédula de Ciudadanía' 
    AND persona.numero_identificacion = '123456789'
    AND persona.fecha_nacimiento = '1980-05-12';

select * from  gen_m_persona;
select * from gen_p_lista_opcion;


-- perfil 
SELECT 
	p.id,
    tipo_id.nombre AS 'Tipo de identificación',
    p.numero_identificacion AS 'Número de identificación',
    p.apellido1 AS 'Primer apellido',
    p.apellido2 AS 'Segundo apellido',
    p.nombre1 AS 'Primer nombre',
    p.nombre2 AS 'Segundo nombre',
    p.fecha_nacimiento AS 'Fecha de nacimiento',
    sexo.nombre AS 'Sexo biológico',
    p.direccion AS 'Dirección de residencia',
    p.telefono_movil AS 'Número de celular',
    p.email AS 'Correo electrónico'
FROM 
    gen_m_persona p
LEFT JOIN 
    gen_p_lista_opcion tipo_id ON p.tipo_identificacion = tipo_id.id
LEFT JOIN 
    gen_p_lista_opcion sexo ON p.sexo_biologico = sexo.id
WHERE 
    p.id = 3;
select * from gen_p_lista_opcion;
SELECT * FROM lab_p_procedimientos;

SELECT * FROM gen_m_persona WHERE id = 1;
SELECT * FROM fac_m_tarjetero WHERE id_persona = 1;
SELECT * FROM lab_m_orden WHERE id_historia = 1;



select * from lab_p_pruebas prueba;


SELECT 
    CONCAT(p.nombre1, ' ', p.nombre2, ' ', p.apellido1, ' ', p.apellido2) AS nombre_paciente,
    p.numero_identificacion AS identificacion,
    s.nombre AS sexo,
    TIMESTAMPDIFF(YEAR, p.fecha_nacimiento, CURDATE()) AS edad,
    eps.razon_social AS administradora_salud,
    p.telefono_movil AS telefono,
    o.fecha AS fecha_orden
FROM 
    fac_m_tarjetero t
JOIN 
    gen_m_persona p ON t.id_persona = p.id
JOIN 
    gen_p_lista_opcion s ON p.sexo_biologico = s.id  -- Asegúrate de que sea la relación correcta
JOIN 
    lab_m_orden o ON t.id = o.id_historia
JOIN 
    fac_p_profesional m ON o.id_profesional_ordena = m.id
JOIN 
    gen_p_eps eps ON t.id_eps = eps.id
WHERE 
    p.id = 1; 



select * from fac_p_profesional;
select * from gen_m_persona p;
select * from lab_m_orden;




SELECT 
	concat(gen_m_persona.nombre1, ' ',gen_m_persona.nombre2,' ', gen_m_persona.apellido1,' ',gen_m_persona.apellido1) as Nombre,
    lab_m_orden.fecha AS Fecha_Orden,
    gen_p_documento.codigo_alfa AS Codigo_Documento,
    lab_m_orden.orden AS Numero_Orden
FROM 
    lab_m_orden
JOIN 
    fac_m_tarjetero ON lab_m_orden.id_historia = fac_m_tarjetero.id
JOIN 
    gen_m_persona ON fac_m_tarjetero.id_persona = gen_m_persona.id
JOIN 
    gen_p_documento ON lab_m_orden.id_documento = gen_p_documento.id
WHERE 
    gen_m_persona.id = 2;  -- Aquí puedes especificar el número de identificación del paciente




SELECT 
    CONCAT(gen_m_persona.nombre1, ' ', gen_m_persona.nombre2, ' ', gen_m_persona.apellido1, ' ', gen_m_persona.apellido2) AS Nombre,
    lab_m_orden.fecha AS Fecha_Orden,
    gen_p_documento.codigo_alfa AS Codigo_Documento,
    lab_m_orden.orden AS Numero_Orden,
    lab_p_pruebas.codigo AS Codigo_Prueba,
    lab_p_pruebas.nombre AS Nombre_Prueba,
    lab_m_orden_resultados.res_opcion AS Resultado_Opcion,
    lab_m_orden_resultados.res_numerico AS Resultado_Numerico,
    lab_m_orden_resultados.res_texto AS Resultado_Texto,
    lab_m_orden_resultados.res_memo AS Resultado_Memo
FROM 
    lab_m_orden
JOIN 
    fac_m_tarjetero ON lab_m_orden.id_historia = fac_m_tarjetero.id
JOIN 
    gen_m_persona ON fac_m_tarjetero.id_persona = gen_m_persona.id
JOIN 
    gen_p_documento ON lab_m_orden.id_documento = gen_p_documento.id
JOIN 
    lab_m_orden_resultados ON lab_m_orden.id = lab_m_orden_resultados.id_orden
JOIN 
    lab_p_pruebas ON lab_m_orden_resultados.id_prueba = lab_p_pruebas.id
WHERE 
    gen_m_persona.id = 1 and lab_m_orden_resultados.id = 1;
    
select * from lab_m_orden_resultados;
