-- 1. Inserciones en la tabla gen_p_lista_opcion
INSERT INTO gen_p_lista_opcion (categoria, descripcion, valor, nombre, abreviatura, habilita) VALUES 
('TipoIdentificacion', 'Cédula de Ciudadanía', '1', 'Cédula', 'CC', TRUE),
('TipoIdentificacion', 'Tarjeta de Identidad', '2', 'Tarjeta', 'TI', TRUE),
('RegSegSocial', 'Contributivo', '1', 'Contributivo', 'C', TRUE),
('RegSegSocial', 'Subsidiado', '2', 'Subsidiado', 'S', TRUE),
('SexoBiologico', 'Masculino', '1', 'Masculino', 'M', TRUE),
('SexoBiologico', 'Femenino', '2', 'Femenino', 'F', TRUE),
('TipoProf', 'Médico General', '1', 'Médico General', 'MG', TRUE),
('TipoProf', 'Especialista', '2', 'Especialista', 'ES', TRUE),
('TipoResultado', 'Cuantitativo', '1', 'Cuantitativo', 'CQ', TRUE),
('TipoResultado', 'Cualitativo', '2', 'Cualitativo', 'CA', TRUE);
select * from gen_p_lista_opcion;
-- 2. Inserciones en la tabla gen_m_persona
INSERT INTO gen_m_persona (tipo_identificacion, numero_identificacion, apellido1, apellido2, nombre1, nombre2, fecha_nacimiento, sexo_biologico, direccion, telefono_movil, email) VALUES 
(1, '123456789', 'Uribe', 'Rodrigue', 'Maria', 'Camila', '1980-05-12', 6, 'Calle 123', '3001234567', 'juan.perez@mail.com'),
(2, '987654321', 'Velsaques', 'Martinez', 'Manuela', 'Fernanda', '1995-10-25', 6, 'Carrera 456', '3109876543', 'maria.lopez@mail.com'),
(1, '1122334455', 'Prof: Ossa', 'Ramirez', 'Luis', 'Alberto', NULL, 5, 'Avenida 789', '3201122334', 'luis.rodriguez@mail.com'),
(1, '1097731678', 'Prof: Rodriguez', 'Hernandez', 'Flor', 'Angela', NULL, 6, 'Avenida 789', '3201122334', 'luis.rodriguez@mail.com');

-- 3. Inserciones en la tabla gen_p_eps
INSERT INTO gen_p_eps (codigo_alfa, razon_social, nit, habilita) VALUES 
('EPS001', 'Salud Total', '900123456', TRUE),
('EPS002', 'Nueva EPS', '900654321', TRUE);

-- 4. Inserciones en la tabla fac_p_nivel
INSERT INTO fac_p_nivel (id_eps, nivel, nombre, id_regimen) VALUES 
(1, '1', 'Nivel Básico', 1),
(2, '2', 'Nivel Avanzado', 2);

-- 5. Inserciones en la tabla fac_m_tarjetero
INSERT INTO fac_m_tarjetero (historia, id_persona, id_regimen, id_eps, id_nivel) VALUES 
('HIST001', 1, 1, 1, 1),
('HIST002', 2, 2, 2, 2);

-- 6. Inserciones en la tabla fac_p_profesional
INSERT INTO fac_p_profesional (codigo_profesional, id_persona, registro_medico, id_tipo_prof) VALUES 
('PROF001', 3, 'RM001', 7),
('PROF002', 4, 'RM002', 8);

-- 7. Inserciones en la tabla gen_p_documento
INSERT INTO gen_p_documento (codigo_alfa, nombre, habilita) VALUES 
('ORD001', 'Orden Médica', TRUE),
('LAB001', 'Solicitud de Laboratorio', TRUE);

-- 8. Inserciones en la tabla fac_p_cups
INSERT INTO fac_p_cups (codigo_cup, nombre, habilita) VALUES 
('901016', 'Hemoclasificación Sistema RH', TRUE),
('901017', 'Hemoglobina', TRUE);

-- 9. Inserciones en la tabla lab_p_grupos
INSERT INTO lab_p_grupos (codigo_alfa, nombre, habilita) VALUES 
('01', 'Hematología', TRUE),
('02', 'Bioquímica', TRUE);

-- 10. Inserciones en la tabla lab_p_procedimientos
INSERT INTO lab_p_procedimientos (id_cups, id_grupo_laboratorio, metodo) VALUES 
(1, 1, 'Tubo'),
(2, 1, 'Automático');

-- 11. Inserciones en la tabla lab_p_pruebas
INSERT INTO lab_p_pruebas (id_procedimiento, codigo, nombre, id_tipo_resultado, unidad_medida, habilita) VALUES 
(1, '01', 'Grupo Sanguíneo', 1, 'mL', TRUE),
(2, '02', 'Hemoglobina', 1, 'g/dL', TRUE);

-- 12. Inserciones en la tabla lab_p_pruebas_opciones
INSERT INTO lab_p_pruebas_opciones (id_prueba, opcion, valor_ref_min_f, valor_ref_max_f, valor_ref_min_m, valor_ref_max_m) VALUES 
(1, 'A', 3.5, 5.0, 4.0, 5.5),
(1, 'B', 3.6, 5.1, 4.1, 5.6),
(1, 'AB', 3.7, 5.2, 4.2, 5.7),
(1, 'O', 3.8, 5.3, 4.3, 5.8);

-- 13. Inserciones en la tabla lab_m_orden
INSERT INTO lab_m_orden (id_documento, orden, fecha, id_historia, id_profesional_ordena, profesional_externo) 
VALUES (1, 'ORD12345', '2024-09-25 12:00:00', 1, 3, FALSE),
       (2, 'ORD12346', '2024-09-25 14:30:00', 2, 4, TRUE);

-- 14. Inserciones en la tabla lab_m_orden_resultados
INSERT INTO lab_m_orden_resultados (fecha, id_orden, id_procedimiento, id_prueba, id_pruebaopcion, res_opcion, res_numerico, res_texto, res_memo, num_procesamientos) 
VALUES ('2024-09-25 13:00:00', 1, 1, 1, 1, 'A', NULL, NULL, NULL, 1),
       ('2024-09-25 15:00:00', 2, 2, 2, 2, NULL, 13.5, NULL, 'Resultados dentro de rango normal', 1);
