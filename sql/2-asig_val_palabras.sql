DELETE FROM palabras;
-- Insetar las FRUTAS en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
	(1, 1, 'fruta'), (2, 1, 'coco'), (3, 1, 'dátil'), (4, 1, 'frambuesa'), (5, 1, 'fresa'), (6, 1, 'cereza'),
	(7, 1, 'granada'), (8, 1, 'higo'), (9, 1, 'kiwi'), (10, 1, 'limón'), (11, 1, 'mandarina'), 
	(12, 1, 'melocotón'), (13, 1, 'melón'), (14, 1, 'naranja'), (15, 1, 'pera'), (16, 1, 'piña'), 
	(17, 1, 'plátano'), (18, 1, 'sandia'), (19, 1, 'uva');
	
-- Insetar las VERDURAS en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
    (20, 2, 'verdura'), (21, 2, 'ajo'), (22, 2, 'berenjena'), (23, 2, 'calabacin'), (24, 2, 'calabaza'),
    (25, 2, 'cebolla'), (26, 2, 'champiñon'), (27, 2, 'col'), (28, 2, 'coliflor'), (29, 2, 'espinaca'), 
	 (30, 2, 'guisante'), (31, 2, 'judia'), (32, 2, 'judia verde'), (33, 2, 'lechuga'), (34, 2, 'maiz'), 
	 (35, 2, 'patata'), (36, 2, 'pepino'), (37, 2, 'pimiento'), (38, 2, 'seta'), (39, 2, 'tomate'), 
	 (40, 2, 'zanahoria');

-- Insetar las SEMILLAS (legumbres y frutos secos) en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
    (41, 3, 'semilla'), (42, 3, 'almendra'), (43, 3, 'alubia'), (44, 3, 'alubia blanca'), (45, 3, 'arroz'),
    (46, 3, 'avellana'), (47, 3, 'cacahuete'), (48, 3, 'castaña'), (49, 3, 'garbanzo'), (50, 3, 'guisante'),
    (51, 3, 'nuez'), (52, 3, 'pasa'), (53, 3, 'piñón'), (54, 3, 'pipa'), (55, 3, 'pistacho');
	
-- Insetar los ANIMALES en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
    (56, 4, 'abeja'), (57, 4, 'araña'), (58, 4, 'ardilla'), (59, 4, 'caballo'), (60, 4, 'ciervo'),
    (61, 4, 'cordero'), (62, 4, 'cucaracha'), (63, 4, 'delfin'), (64, 4, 'gallina'), (65, 4, 'gallo'),
    (66, 4, 'hormiga'), (67, 4, 'iguana'), (68, 4, 'lobo'), (69, 4, 'loro'), (70, 4, 'mariposa'),
    (71, 4, 'mosquito'), (72, 4, 'oso'), (73, 4, 'pajaro'), (74, 4, 'pavo'), (75, 4, 'perro'),
    (76, 4, 'pez'), (77, 4, 'rana'), (78, 4, 'serpiente'), (79, 4, 'ternero'), (80, 4, 'tigre'),
    (81, 4, 'vaca'), (82, 4, 'zorro'), (83, 4, 'mariquita'), (84, 4, 'murcielago'), (85, 4, 'tortuga'),
    (86, 4, 'conejo'), (87, 4, 'gato'), (88, 4, 'mosca'), (89, 4, 'ratón'), (90, 4, 'torro'), (91, 4, 'rata');

-- ########################################################################################################
-- Insetar CALENDARIO en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (92, 5, 'semana'), (93, 5, 'mes'), (94, 5, 'estaciones'), (95, 5, 'fiestas'), (96, 5, 'tiempo');
-- Insertar días de la SEMANA en la tabla palabras (categoria semanas)
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (97, 6, 'lunes'), (98, 6, 'martes'), (99, 6, 'miercoles'), (100, 6, 'jueves'), (101, 6, 'viernes'),
   (102, 6, 'sabado'), (103, 6, 'domingo'), (104, 6, 'día'), (105, 6, 'entre semana'), (106, 6, 'fin de semana');
    
-- Insertar los MESES del año en la tabla palabras (categoría meses)
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (107, 7, 'enero'), (108, 7, 'febrero'), (109, 7, 'marzo'), (110, 7, 'abril'), (111, 7, 'mayo'),
   (112, 7, 'junio'), (113, 7, 'julio'), (114, 7, 'agosto'), (115, 7, 'septiembre'), (116, 7, 'octubre'),
   (117, 7, 'noviembre'), (118, 7, 'diciembre'), (119, 7, 'año'), (120, 7, 'calendario');
    
-- Insertar ESTACIONES de año en la tabla palabras (categoría estaciones)
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (121, 8, 'primavera'), (122, 8, 'otoño'), (123, 8, 'verano'), (124, 8, 'invierno');
    
-- Insertar FIESTAS en la tabla palabras (categoría fiestas)
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (125, 9, 'cumpleaños'), (126, 9, 'navidad'), (127, 9, 'fiesta');

-- Insertar el TIEMPO en la tabla palabras (categoría tiempo)
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (128, 10, 'ayer'), (129, 10, 'hoy'), (130, 10, 'mañana'), (131, 10, 'noche'), (132, 10, 'tarde'),
   (133, 10, 'en punto'), (134, 10, 'menos cuarto'), (135, 10, 'y cuarto'), (136, 10, 'hora'), 
	(137, 10, 'minuto'), (138, 10, 'segundo');

-- ########################################################################################################
-- Insetar INTERACCIONES en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
	(139,11, 'sí'), (140,11, 'no'), (141,11, 'hola'), (142,11, 'adiós'), (143,11, 'buenos días'), 
	(144,11, 'buenas tardes'), (145,11, 'buenas noches'), (146,11, 'gracias'), (147,11, 'de nada'), 
	(148,11, 'por favor'), (149,11, 'qué tal'), (150,11, 'cómo'), (151,11, 'cuándo'), (152,11, 'dónde'), 
	(153,11, 'cuánto'), (154,11, 'qué'), (155,11, 'nombre'), (156,11, 'apellido'), (157,11, 'signo');
	
-- Insetar relacion FAMILIARES en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
	(158,12, 'familia'), (159,12, 'abuelo'), (160,12, 'abuela'), (161,12, 'bebé'), (162,12, 'bisabuelo'), 
	(163,12, 'bisabuela'), (164,12, 'hermano'), (165,12, 'hermana'), (166,12, 'mamá'), (167,12, 'papá'), 
	(168,12, 'niño'), (169,12, 'niña'), (170,12, 'primo'), (171,12, 'prima'), (172,12, 'tío'), 
	(173,12, 'tía'), (174,12, 'sobrino'), (175,12, 'sobrina'), (176,12, 'cuñado'), (177,12, 'cuñada');

-- Insetar EMOCIONES en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
	(178, 13, 'aburrido'), (179, 13, 'agradable'), (180, 13, 'alegre'), (181, 13, 'blando'), 
	(182, 13, 'bueno'), (183, 13, 'contento'), (184, 13, 'desagradable'), (185, 13, 'divertido'), 
	(186, 13, 'dulce'), (187, 13, 'duro'), (188, 13, 'enfadado'), (189, 13, 'enfermo'), (190, 13, 'feliz'), 
	(191, 13, 'frío'), (192, 13, 'hambriento'),(193, 13, 'malo'), (194, 13, 'sano'), (195, 13, 'sueño'), 
	(196, 13, 'terco'), (197, 13, 'triste');
	
-- Insetar SABORES en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
	(198, 14, 'ácido'), (199, 14, 'agrio'), (200, 14, 'amargo'), (201, 14, 'bueno'), (202, 14, 'caliente'),
   (203, 14, 'desagradable'), (204, 14, 'dulce'), (205, 14, 'duro'), (206, 14, 'frío'), (207, 14, 'malo'),
   (208, 14, 'picante'), (209, 14, 'salado'), (210, 14, 'templado');

-- ########################################################################################################
-- Insertar ROPA en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES
    (211, 15, 'pantalón'), (212, 15, 'falda'), (213, 15, 'vestido'), (214, 15, 'camiseta'), (215, 15, 'camisa'),
    (216, 15, 'chaqueta'), (217, 15, 'abrigo'), (218, 15, 'bota'), (219, 15, 'zapato'), (220, 15, 'cinturón'),
    (221, 15, 'gorro'), (222, 15, 'reloj'), (223, 15, 'mochila'), (224, 15, 'bolso'), (225, 15, 'gorra'),
    (226, 15, 'pulsera'), (227, 15, 'calcetín'), (228, 15, 'bragas'), (229, 15, 'bufanda'), (230, 15, 'collar'),
    (231, 15, 'anillo'), (232, 15, 'calzoncillos'), (233, 15, 'chándal'), (234, 15, 'gafas'), (235, 15, 'corbata'),
    (236, 15, 'ropa');

-- Insertar CUERPO en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES
    (237, 16, 'cabeza'), (238, 16, 'cara'), (239, 16, 'boca'), (240, 16, 'nariz'), (241, 16, 'oreja'),
    (242, 16, 'cuerpo'), (243, 16, 'cuello'), (244, 16, 'ojo'), (245, 16, 'codo'), (246, 16, 'dedo'),
    (247, 16, 'cadera'), (248, 16, 'pie'), (249, 16, 'talón'), (250, 16, 'mano'), (251, 16, 'brazo'),
    (252, 16, 'pecho'), (253, 16, 'tripa'), (254, 16, 'barriga'), (255, 16, 'estómago'), (256, 16, 'pierna'),
    (257, 16, 'rodilla'), (258, 16, 'espalda'), (259, 16, 'culo'), (260, 16, 'diente'), (261, 16, 'lengua'),
    (262, 16, 'garganta'), (263, 16, 'corazón'), (264, 16, 'pulmón'), (265, 16, 'costilla'), 
    (266, 16, 'hueso'), (267, 16, 'músculo'), (268, 16, 'vejiga'), (269, 16, 'riñón');

-- ########################################################################################################
-- Insertar VERBOS en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (270, 17, 'abrazar'), (271, 17, 'afirmar'), (272, 17, 'amar'), (273, 17, 'andar'), (274, 17, 'apoyar'),
   (275, 17, 'aprender'), (276, 17, 'avanzar'), (277, 17, 'ayudar'), (278, 17, 'beber'), 
   (279, 17, 'besar'), (280, 17, 'cantar'), (281, 17, 'castigar'), (282, 17, 'comer'), (283, 17, 'comprar'), 
   (284, 17, 'conocer'), (285, 17, 'contar'), (286, 17, 'correr'), (287, 17, 'cortar'), (288, 17, 'crecer'), 
   (289, 17, 'decir'), (290, 17, 'decolorar'), (291, 17, 'descansar'), (292, 17, 'desear'),
   (293, 17, 'destacar'), (294, 17, 'dormir'), (295, 17, 'duchar'), (296, 17, 'entender'), 
   (297, 17, 'escribir'), (298, 17, 'esperar'), (299, 17, 'explicar'), (300, 17, 'gritar'), 
   (301, 17, 'gustar'), (302, 17, 'hablar'), (303, 17, 'importar'), (304, 17, 'insistir'), 
   (305, 17, 'interrumpir'), (306, 17, 'jugar'), (307, 17, 'lavar'), (308, 17, 'leer'), 
   (309, 17, 'levantar'), (310, 17, 'llorar'), (311, 17, 'llover'), (312, 17, 'montar'), (313, 17, 'nacer'), 
   (314, 17, 'narrar'), (315, 17, 'oír'), (316, 17, 'oler'), (317, 17, 'omitir'), (318, 17, 'pedir'),
   (319, 17, 'pegar'), (320, 17, 'peinar'), (321, 17, 'poner'), (322, 17, 'preferir'), (323, 17, 'prorrogar'), 
   (324, 17, 'querer'), (325, 17, 'quitar'), (326, 17, 'regalar'), (327, 17, 'reir'), (328, 17, 'saber'), 
   (329, 17, 'saltar'), (330, 17, 'sentar'), (331, 17, 'tener'), (332, 17, 'tocar'), (333, 17, 'ver'), 
   (334, 17, 'vestir'), (335, 17, 'vivir');

-- Insertar ADJETIVOS en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES 
   (336, 18, 'aburrido'), (337, 18, 'ácido'), (338, 18, 'agradable'), (339, 18, 'agrio'), (340, 18, 'alegre'),
   (341, 18, 'alto'), (342, 18, 'amargo'), (343, 18, 'bajo'), (344, 18, 'bonito'), (345, 18, 'bueno'),
   (346, 18, 'blando'), (347, 18, 'caliente'), (348, 18, 'castaño'), (349, 18, 'claro/oscuro'), 
   (350, 18, 'claro'), (351, 18, 'contento'), (352, 18, 'delgado'), (353, 18, 'desagradable'), 
   (354, 18, 'diferente'), (355, 18, 'divertido'), (356, 18, 'dulce'), (357, 18, 'duro'), (358, 18, 'enfadado'),  
   (359, 18, 'enfermo'), (360, 18, 'feliz'), (361, 18, 'feo'), (362, 18, 'frío'), (363, 18, 'gordo'), 
   (364, 18, 'hambriento'), (365, 18, 'igual'), (366, 18, 'lento'), (367, 18, 'limpio'), (368, 18, 'lleno'), 
   (369, 18, 'malo'), (370, 18, 'moreno'), (371, 18, 'mucho'), (372, 18, 'oscuro'), (373, 18, 'pelirrojo'), 
   (374, 18, 'picante'), (375, 18, 'poco'), (376, 18, 'poco a poco'), (377, 18, 'por poco'), (378, 18, 'un poco'), 
   (379, 18, 'primero'), (380, 18, 'rápido'), (381, 18, 'rubio'), (382, 18, 'salado'), (383, 18, 'sano'), 
   (384, 18, 'sucio'), (385, 18, 'sueño'), (386, 18, 'templado'), (387, 18, 'terco'), (388, 18, 'triste'), 
   (389, 18, 'último'), (390, 18, 'vacío');

-- Insertar ADVERBIOS en la tabla de palabras
INSERT INTO palabras (id_palabra, id_categoria, nombre) VALUES  
   (391, 19, 'abajo'), (392, 19, 'ahora'), (393, 19, 'algo'), (394, 19, 'alli'), (395, 19, 'antes'),
   (396, 19, 'aqui'), (397, 19, 'arriba'), (398, 19, 'bastante'), (399, 19, 'bien'), (400, 19, 'cerca'), 
   (401, 19, 'debajo'), (402, 19, 'delante'), (403, 19, 'demasiado'), (404, 19, 'dentro'), (405, 19, 'deprisa'),
   (406, 19, 'derecha'), (407, 19, 'despacio'), (408, 19, 'después'), (409, 19, 'detras'), (410, 19, 'encima'),
   (411, 19, 'fuera'), (412, 19, 'izquierda'), (413, 19, 'lado'), (414, 19, 'lejos'), (415, 19, 'luego'),
   (416, 19, 'mal'), (417, 19, 'mejor'), (418, 19, 'mucho'), (419, 19, 'nada'), (420, 19, 'peor'), 
   (421, 19, 'poco'), (422, 19, 'tambien'), (423, 19, 'tampoco'), (424, 19, 'todavía'), (425, 19, 'todo');


-- Insertar ABECEDARIO en la tabla de palabras
INSERT INTO palabras (id_categoria, nombre) VALUES
	(20, 'a'), (20, 'b'),  (20, 'c'), (20, 'ch'), (20, 'd'), (20, 'e'),
	(20, 'f'), (20, 'g'),  (20, 'h'), (20, 'i'),  (20, 'j'), (20, 'k'),
	(20, 'l'), (20, 'll'), (20, 'm'), (20, 'n'),  (20, 'ñ'), (20, 'o'),
	(20, 'p'), (20, 'q'),  (20, 'r'), (20, 'rr'), (20, 's'), (20, 't'),
	(20, 'u'), (20, 'v'),  (20, 'w'), (20, 'x'),  (20, 'y'), (20, 'z');


-- Insertar COLORES en la tabla de palabras
INSERT INTO palabras (id_categoria, nombre) VALUES
	(21, 'amarillo'), (21, 'rojo'),  (21, 'verde'), (21, 'rosa'), (21, 'blanco'), (21, 'negro'),
	(21, 'morado'), (21, 'azul'),  (21, 'gris'), (21, 'marrón'),  (21, 'naranja'), (21, 'dorado'),
	(21, 'plateado');

-- Insertar BEBIDAS en la tabla de palabras
INSERT INTO palabras (id_categoria, nombre) VALUES
   (22, 'agua'), (22, 'zumo'), (22, 'batido'), (22, 'té'),
   (22, 'refresco'), (22, 'cerveza'),
   (22, 'vino'), (22, 'vino blanco'),  (22, 'vino tinto'),
	(22, 'café'), (22, 'café con leche'),  (22, 'café cortado'),
   (22, 'café descafeinado'), (22, 'café negro'), (22, 'café puro'),
	(22, 'café solo');