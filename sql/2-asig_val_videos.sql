DELETE FROM videos;
-- Insercción de los videos de FRUTAS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(1, Null, 'videos\\frutas\\fruta.mov'), 	  (2, Null, 'videos\\frutas\\coco.mov'),
	(3, Null, 'videos\\frutas\\datil.mov'), 	  (4, Null, 'videos\\frutas\\frambuesa.mov'),
	(5, Null, 'videos\\frutas\\fresa.mov'), 	  (6, Null, 'videos\\frutas\\cereza.mov'),
	(7, Null, 'videos\\frutas\\granada.mov'),   (8, Null, 'videos\\frutas\\higo.mov'),	
	(9, Null, 'videos\\frutas\\kiwi.mov'), 	  (10, Null, 'videos\\frutas\\limon.mov'),
	(11, Null, 'videos\\frutas\\mandarin.mov'), (12, Null, 'videos\\frutas\\melocoton.mov'),
	(13, Null, 'videos\\frutas\\melon.mov'), 	  (14, Null, 'videos\\frutas\\naranja.mov'),
	(15, Null, 'videos\\frutas\\pera.mov'), 	  (16, Null, 'videos\\frutas\\pina.mov'),
	(17, Null, 'videos\\frutas\\platano.mov'),  (18, Null, 'videos\\frutas\\sandia.mov'),
	(19, Null, 'videos\\frutas\\uva.mov');

-- Insetar los videos de las VERDURAS en la tabla de videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (20, NULL, 'videos\\verduras\\verdura.mov'),			(21, NULL, 'videos\\verduras\\ajo.mov'),
   (22, NULL, 'videos\\verduras\\berenjena.mov'),		(23, NULL, 'videos\\verduras\\calabacin.mov'),
   (24, NULL, 'videos\\verduras\\calabaza.mov'),		(25, NULL, 'videos\\verduras\\cebolla.mov'),
   (26, NULL, 'videos\\verduras\\champinon.mov'),		(27, NULL, 'videos\\verduras\\col.mov'),
   (28, NULL, 'videos\\verduras\\coliflor.mov'),		(29, NULL, 'videos\\verduras\\espinaca.mov'),
   (30, NULL, 'videos\\verduras\\guisante.mov'),		(31, NULL, 'videos\\verduras\\judia.mov'),
	(32, NULL, 'videos\\verduras\\judia_verde.mov'),	(33, NULL, 'videos\\verduras\\lechuga.mov'),
   (34, NULL, 'videos\\verduras\\maiz.mov'),				(35, NULL, 'videos\\verduras\\patata.mov'),
   (36, NULL, 'videos\\verduras\\pepino.mov'),			(37, NULL, 'videos\\verduras\\pimiento.mov'),
   (38, NULL, 'videos\\verduras\\seta.mov'),				(39, NULL, 'videos\\verduras\\tomate.mov'),
   (40, NULL, 'videos\\verduras\\zanahoria.mov');

-- Inserción de los videos de SEMILLAS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (41, NULL, 'videos\\semillas\\semilla.mov'),		(42, NULL, 'videos\\semillas\\almendra.mov'),
   (43, NULL, 'videos\\semillas\\alubia.mov'),		(44, NULL, 'videos\\semillas\\alubia-blanca.mov'),
   (45, NULL, 'videos\\semillas\\arroz.mov'),		(46, NULL, 'videos\\semillas\\avellana.mov'),
   (47, NULL, 'videos\\semillas\\cacahuete.mov'),	(48, NULL, 'videos\\semillas\\castana.mov'),
   (49, NULL, 'videos\\semillas\\garbanzo.mov'),	(50, NULL, 'videos\\semillas\\guisante.mov'),
   (51, NULL, 'videos\\semillas\\nuez.mov'),			(52, NULL, 'videos\\semillas\\pasa.mov'),
   (53, NULL, 'videos\\semillas\\pinon.mov'),		(54, NULL, 'videos\\semillas\\pipa-comida.mov'),
   (55, NULL, 'videos\\semillas\\pistacho.mov');

-- Inserción de los videos de ANIMALES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (56, NULL, 'videos\\animales\\abeja.mov'),			(57, NULL, 'videos\\animales\\arana.mov'),
   (58, NULL, 'videos\\animales\\ardilla.mov'),			(59, NULL, 'videos\\animales\\caballo.mov'),
   (60, NULL, 'videos\\animales\\ciervo.mov'),			(61, NULL, 'videos\\animales\\cordero.mov'),
   (62, NULL, 'videos\\animales\\cucaracha.mov'),		(63, NULL, 'videos\\animales\\delfin.mov'),
   (64, NULL, 'videos\\animales\\gallina.mov'),			(65, NULL, 'videos\\animales\\gallo.mov'),
   (66, NULL, 'videos\\animales\\hormiga.mov'),			(67, NULL, 'videos\\animales\\iguana.mov'),
   (68, NULL, 'videos\\animales\\lobo.mov'),				(69, NULL, 'videos\\animales\\loro-animal.mov'),
   (70, NULL, 'videos\\animales\\mariposa.mov'),		(71, NULL, 'videos\\animales\\mosquito.mov'),
   (72, NULL, 'videos\\animales\\oso.mov'),				(73, NULL, 'videos\\animales\\pajaro.mov'),
   (74, NULL, 'videos\\animales\\pavo_real.mov'),		(75, NULL, 'videos\\animales\\perro.mov'),
   (76, NULL, 'videos\\animales\\pez.mov'),				(77, NULL, 'videos\\animales\\rana.mov'),
   (78, NULL, 'videos\\animales\\serpiente.mov'),		(79, NULL, 'videos\\animales\\ternero.mov'),
   (80, NULL, 'videos\\animales\\tigre.mov'),			(81, NULL, 'videos\\animales\\vaca.mov'),
	(82, NULL, 'videos\\animales\\zorro.mov'),			(83, NULL, 'videos\\animales\\mariquita.mov'),
   (84, NULL, 'videos\\animales\\murcielago.mov'),		(85, NULL, 'videos\\animales\\tortuga.mov'),
   (86, NULL, 'videos\\animales\\conejo.mov'),			(87, NULL, 'videos\\animales\\gato.mov'),
   (88, NULL, 'videos\\animales\\mosca.mov'),			(89, NULL, 'videos\\animales\\raton-ordenador.mov'),
   (90, NULL, 'videos\\animales\\toro-animal.mov'),   (91, NULL, 'videos\\animales\\rata.mov');

-- Inserción de los videos del CALENDARIO
-- Inserción de los videos de SEMANA a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(97, NULL, 'videos\\calendario\\lunes.mov'),				(98, NULL, 'videos\\calendario\\martes.mov'),
	(99, NULL, 'videos\\calendario\\miercoles.mov'),		(100, NULL, 'videos\\calendario\\jueves.mov'),
	(101, NULL, 'videos\\calendario\\viernes.mov'),			(102, NULL, 'videos\\calendario\\sabado.mov'),
	(103, NULL, 'videos\\calendario\\domingo.mov'),			(104, NULL, 'videos\\calendario\\dia_a.mov'),
	(105, NULL, 'videos\\calendario\\entre_semana.mov'),	(106, NULL, 'videos\\calendario\\fin_semana.mov'),
	(92, NULL, 'videos\\calendario\\semana.mov');
	
-- Inserción de los videos de MESES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(107, NULL, 'videos\\calendario\\enero.mov'),		(108, NULL, 'videos\\calendario\\febrero.mov'),
	(109, NULL, 'videos\\calendario\\marzo.mov'),		(110, NULL, 'videos\\calendario\\abril.mov'),
	(111, NULL, 'videos\\calendario\\mayo.mov'),			(112, NULL, 'videos\\calendario\\junio_N.mov'),
	(113, NULL, 'videos\\calendario\\julio.mov'),		(114, NULL, 'videos\\calendario\\agosto.mov'),
	(115, NULL, 'videos\\calendario\\septiembre.mov'),	(116, NULL, 'videos\\calendario\\octubre.mov'),
	(117, NULL, 'videos\\calendario\\noviembre.mov'),	(118, NULL, 'videos\\calendario\\diciembre.mov'),
	(119, NULL, 'videos\\calendario\\ano-meses.mov'),	(120, NULL, 'videos\\calendario\\calendario.mov'),
	(93, NULL, 'videos\\calendario\\mes.mov');

-- Inserción de los videos de ESTACIONES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(121, NULL, 'videos\\calendario\\primavera.mov'),	(122, NULL, 'videos\\calendario\\otono.mov'),
	(123, NULL, 'videos\\calendario\\verano.mov'),		(124, NULL, 'videos\\calendario\\invierno.mov');
	
-- Inserción de los videos de FIESTAS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(125, NULL, 'videos\\calendario\\cumpleanos.mov'),	(126, NULL, 'videos\\calendario\\navidad.mov'),
	(127, NULL, 'videos\\calendario\\dia-festivo.mov');
	
-- Inserción de los videos de TIEMPO a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
	(128, NULL, 'videos\\calendario\\ayer.mov'),				(129, NULL, 'videos\\calendario\\hoy.mov'),
	(130, NULL, 'videos\\calendario\\manana.mov'),			(131, NULL, 'videos\\calendario\\noche.mov'),
	(132, NULL, 'videos\\calendario\\tarde_a.mov'),			(133, NULL, 'videos\\calendario\\en_punto.mov'),
	(134, NULL, 'videos\\calendario\\cuarto-menos.mov'),	(135, NULL, 'videos\\calendario\\cuarto-y.mov'),
	(136, NULL, 'videos\\calendario\\hora.mov'),				(137, NULL, 'videos\\calendario\\minuto.mov'),
	(138, NULL, 'videos\\calendario\\segundo-geometria.mov');
	
-- Inserción de los videos de INTERACCIONES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (139, NULL, 'videos\\interacciones\\si.mov'),               (140, 'Expresa negación.', 'videos\\interacciones\\no.mov'),
   (140, 'Para rechazar cortésmente algo o para disculpar algo.', 'videos\\interacciones\\no-nada.mov'),
   (141, NULL, 'videos\\interacciones\\hola.mov'),             (142, NULL, 'videos\\interacciones\\adios_5.mov'),
   (143, NULL, 'videos\\interacciones\\dias_buenos.mov'),      (144, NULL, 'videos\\interacciones\\tardes_buenas.mov'),
   (145, NULL, 'videos\\interacciones\\noches_buenas.mov'),    (146, NULL, 'videos\\interacciones\\gracias_dar.mov'),
   (147, NULL, 'videos\\interacciones\\nada_de.mov'),          (148, NULL, 'videos\\interacciones\\favor_por-pedir.mov'),
	(149, 'Fórmula de saludo, abreviación de ¿Qué tal estás? o ¿Qué tal está usted?', 'videos\\interacciones\\que_tal.mov'),
   (150, 'Para denotar sorpresa o incredulidad sobre un hecho que no se entiende.', 'videos\\interacciones\\como-sorpresa.mov'),
   (150, 'De qué modo, de qué manera.', 'videos\\interacciones\\como.mov'),	
   (151, 'En qué tiempo (futuro).', 'videos\\interacciones\\cuando-futuro.mov'),
   (151, 'En qué tiempo (pasado).', 'videos\\interacciones\\cuando-pasado.mov'),
   (152, '¿Dónde?', 'videos\\interacciones\\donde.mov'),
   (153, '¿Qué precio?/¿Cuánto cuesta?', 'videos\\interacciones\\cuanto-dinero.mov'),
   (153, '1. Qué número/cantidad de... 2. En qué grado, cantidad, intensidad o medida.', 'videos\\interacciones\\cuanto-numero.mov'),
   (153, 'Para preguntar a una persona sobre la duración de una actividad que está desarrollando (para periodos largos de tiempo).', 'videos\\interacciones\\cuanto-tiempo.mov'),
   (155, NULL, 'videos\\interacciones\\nombre.mov'),
   (156, NULL, 'videos\\interacciones\\apellido.mov'),
   (157, NULL, 'videos\\interacciones\\signo.mov'),
   (154, 'Pregunta por la identidad de una o varias cosas.', 'videos\\interacciones\\que.mov');

-- Inserción de los videos de RELACIONES FAMILIARES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (158, NULL, 'videos\\familia\\familia.mov'),		(159, NULL, 'videos\\familia\\abuelo.mov'),
	(160, NULL, 'videos\\familia\\abuelo.mov'),		(161, NULL, 'videos\\familia\\bebe.mov'),
	(162, NULL, 'videos\\familia\\bisabuelo.mov'),	(163, NULL, 'videos\\familia\\bisabuelo.mov'),
   (164, NULL, 'videos\\familia\\hermano.mov'),		(165, NULL, 'videos\\familia\\hermano.mov'),
   (166, NULL, 'videos\\familia\\mama.mov'),			(167, NULL, 'videos\\familia\\papa.mov'),
   (168, NULL, 'videos\\familia\\niño.mov'),			(169, NULL, 'videos\\familia\\niño.mov'),
   (170, NULL, 'videos\\familia\\primo.mov'),		(171, NULL, 'videos\\familia\\primo.mov'),
   (172, NULL, 'videos\\familia\\tio.mov'),			(173, NULL, 'videos\\familia\\tio.mov'),
	(174, NULL, 'videos\\familia\\sobrino.mov'),		(175, NULL, 'videos\\familia\\sobrino.mov'),
	(176, NULL, 'videos\\familia\\cunado.mov'),		(177, NULL, 'videos\\familia\\cunado.mov');

-- Inserción de los videos de EMOCIONES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (178, NULL, 'videos\\emociones\\aburrido.mov'),			(179, NULL, 'videos\\emociones\\agradable.mov'),
   (180, NULL, 'videos\\emociones\\alegre.mov'),
	(181, 'Dicho de una persona: Que tiene un carácter débil, sensible o excesivamente benévolo.', 'videos\\emociones\\blando-persona.mov'),
   (182, 'Dicho de una persona: Que piensa o actúa con la norma moral.', 'videos\\emociones\\bueno-persona.mov'),
	(183, 'Alegre, satisfecho.', 'videos\\emociones\\contento_bim.mov'),
   (184, NULL, 'videos\\emociones\\desagradable.mov'),   (185, NULL, 'videos\\emociones\\divertido.mov'),
	(186, 'Naturalmente afable, complaciente.', 'videos\\emociones\\dulce-persona.mov'),
	(187, NULL, 'videos\\emociones\\duro-terco.mov'),     (188, NULL, 'videos\\emociones\\enfadado.mov'),
   (189, NULL, 'videos\\emociones\\enfermo.mov'),        (190, NULL, 'videos\\emociones\\feliz.mov'),
   (191, NULL, 'videos\\emociones\\frio-persona.mov'),   (192, NULL, 'videos\\emociones\\hambriento.mov'),
	(193, 'Dicho comúnmente de un muchacho: Travieso, inquieto, enredador (persona con un comportamiento inadecuado).', 'videos\\emociones\\malo-caracter.mov'),
   (193, 'Enfermo (que padece enfermedad).', 'videos\\emociones\\malo-enfermo.mov'),
	(194, 'Persona que goza de una perfecta salud.', 'videos\\emociones\\sano.mov'),
   (195, 'Tener ganas de dormir.', 'videos\\emociones\\sueno-dormir.mov'),
	(196, NULL, 'videos\\emociones\\terco.mov'),          (197, 'Estar afligido/apesadumbrado.', 'videos\\emociones\\triste-caracter.mov');

-- Inserción de los videos de SABORES a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (198, NULL, 'videos\\sabores\\acido.mov'),			(199, NULL, 'videos\\sabores\\agrio.mov'),
   (200, NULL, 'videos\\sabores\\amargo.mov'),			(201, 'Gustoso, apetecible.', 'videos\\sabores\\bueno-sabor.mov'),
   (202, 'Que tiene o produce calor.', 'videos\\sabores\\caliente.mov'),
   (203, NULL, 'videos\\sabores\\desagradable.mov'),
   (204, 'Que causa cierta sensación suave y agradable al paladar, como la producida por la miel, el azúcar, etc.', 'videos\\sabores\\dulce-sabor.mov'),	
	(205, 'Que no está todo blanda, mullido o tierno.', 'videos\\sabores\\duro.mov'),
   (206, 'Sensación que se experimenta ante un notorio descenso de temperatura.', 'videos\\sabores\\frio-helado.mov'),
	(206, 'Que tiene una temperatura inferior a la ordinaria o conveniente (temperatura baja).', 'videos\\sabores\\frio.mov'),
   (207, 'Dicho de una cosa: Deteriorada o estropeada.', 'videos\\sabores\\malo-calidad.mov'),
	(208, NULL, 'videos\\sabores\\picante.mov'), 		(209, NULL, 'videos\\sabores\\salado.mov'),
	(210, NULL, 'videos\\sabores\\templado.mov');

-- Inserción de los videos de ROPA a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (211, NULL, 'videos\\ropa\\pantalon.mov'),		(212, NULL, 'videos\\ropa\\falda-ropa.mov'),
   (213, NULL, 'videos\\ropa\\vestido.mov'),			(214, NULL, 'videos\\ropa\\camiseta.mov'),
   (215, NULL, 'videos\\ropa\\camisa.mov'),			(216, NULL, 'videos\\ropa\\chaqueta.mov'),
   (217, NULL, 'videos\\ropa\\abrigo.mov'),			(218, NULL, 'videos\\ropa\\bota.mov'),
   (219, NULL, 'videos\\ropa\\zapato.mov'),			(220, NULL, 'videos\\ropa\\cinturon.mov'),
   (221, NULL, 'videos\\ropa\\gorro.mov'),			(222, NULL, 'videos\\ropa\\reloj.mov'),
   (223, NULL, 'videos\\ropa\\mochila.mov'),			(224, NULL, 'videos\\ropa\\bolso.mov'),
   (225, NULL, 'videos\\ropa\\gorra.mov'),			(226, NULL, 'videos\\ropa\\pulsera.mov'),
   (227, NULL, 'videos\\ropa\\calcetin.mov'),		(228, NULL, 'videos\\ropa\\braga-cuello.mov'),
   (228, NULL, 'videos\\ropa\\braga-mujer.mov'),	(229, NULL, 'videos\\ropa\\bufanda.mov'),
   (230, NULL, 'videos\\ropa\\collar.mov'),			(231, NULL, 'videos\\ropa\\anillo.mov'),
   (232, NULL, 'videos\\ropa\\calzoncillo.mov'),	(233, NULL, 'videos\\ropa\\chandal.mov'),
   (234, NULL, 'videos\\ropa\\gafa.mov'),				(235, NULL, 'videos\\ropa\\corbata.mov'),
   (236, NULL, 'videos\\ropa\\ropa.mov');
   
-- Inserción de los videos de CUERPO a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (237, NULL, 'videos\\cuerpo\\cabeza.mov'),			(238, NULL, 'videos\\cuerpo\\cara-cuerpo.mov'),
   (239, NULL, 'videos\\cuerpo\\boca.mov'),				(240, NULL, 'videos\\cuerpo\\nariz.mov'),
   (241, NULL, 'videos\\cuerpo\\oreja.mov'),				(242, NULL, 'videos\\cuerpo\\cuerpo.mov'),
   (243, NULL, 'videos\\cuerpo\\cuello.mov'),			(244, NULL, 'videos\\cuerpo\\ojo.mov'),
   (245, NULL, 'videos\\cuerpo\\codo.mov'),				(246, NULL, 'videos\\cuerpo\\dedo-cuerpo_a.mov'),
   (247, NULL, 'videos\\cuerpo\\cadera.mov'),			(248, NULL, 'videos\\cuerpo\\pie.mov'),
   (249, NULL, 'videos\\cuerpo\\talon-pie.mov'),		(250, NULL, 'videos\\cuerpo\\mano-cuerpo.mov'),
   (251, NULL, 'videos\\cuerpo\\brazo-cuerpo.mov'),	(252, NULL, 'videos\\cuerpo\\pecho.mov'),
   (253, NULL, 'videos\\cuerpo\\tripa.mov'),				(254, NULL, 'videos\\cuerpo\\barriga.mov'),
   (255, NULL, 'videos\\cuerpo\\estomago.mov'),			(256, NULL, 'videos\\cuerpo\\pierna.mov'),
   (257, NULL, 'videos\\cuerpo\\rodilla.mov'),			(258, NULL, 'videos\\cuerpo\\espalda.mov'),
   (259, NULL, 'videos\\cuerpo\\culo.mov'),				(260, NULL, 'videos\\cuerpo\\diente.mov'),
   (261, NULL, 'videos\\cuerpo\\lengua-boca.mov'),		(262, NULL, 'videos\\cuerpo\\garganta.mov'),
   (263, NULL, 'videos\\cuerpo\\corazon.mov'),			(264, NULL, 'videos\\cuerpo\\pulmon.mov'),
   (265, NULL, 'videos\\cuerpo\\costilla.mov'),			(266, NULL, 'videos\\cuerpo\\hueso.mov'),
   (267, NULL, 'videos\\cuerpo\\musculo.mov'),			(268, NULL, 'videos\\cuerpo\\vejiga.mov'),
   (269, NULL, 'videos\\cuerpo\\rinon.mov');
   
-- Inserción de los videos de VERBOS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (270, NULL, 'videos\\verbos\\abrazar.mov'),
   (271, NULL, 'videos\\verbos\\afirmar.mov'),
   (272, NULL, 'videos\\verbos\\amar.mov'),
   (273, 'Para expresar admiración/sorpresa.', 'videos\\verbos\\anda-sorpresa.mov'),
   (273, 'Para expresar extrañeza/incredulidad (¡anda ya!).', 'videos\\verbos\\anda.mov'),
   (273, 'Dicho del tiempo ej: pasar, correr.', 'videos\\verbos\\andar-avanzar.mov'),
   (273, 'Ir de un lugar a otro dando pasos.', 'videos\\verbos\\andar-caminar.mov'),  
   (273, 'Dicho de un artefacto o de una máquina (moverse para ejecutar sus funciones).', 'videos\\verbos\\andar-funcionar.mov'),
   (273, 'Pretender insistentemente algo.', 'videos\\verbos\\andar-insistir.mov'),
   (274, 'Auxiliar, socorrer.', 'videos\\verbos\\apoyar.mov'),
   (275, 'Adquirir el conocimiento por medio del estudio/experiencia (fijar algo en la memoria).', 'videos\\verbos\\aprender.mov'),
   (275, 'Aprender la lección (por propio escarmiento).', 'videos\\verbos\\aprender_leccion.mov'),
   (276, 'Adelantar, mover o prolongar hacia adelante.', 'videos\\verbos\\avanzar-prorroga.mov'),
   (277, 'Adelantar, progresar o mejorar en la acción, condición o estado.', 'videos\\verbos\\avanzar.mov'),
   (277, 'Auxiliar, socorrer.', 'videos\\verbos\\ayudar-apoyar.mov'),
   (277, 'Prestar cooperación (ofrecer tú ayuda).', 'videos\\verbos\\ayudar.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (278, NULL, 'videos\\verbos\\beber.mov'),
   (279, 'Hacer el ademán de besar a alguien/algo, sin llegar a tocarlos con los labios.', 'videos\\verbos\\besar-beso.mov'),
   (279, 'Tocar con un movimiento de labios a alguien/algo como expresión de amor, deseo, reverencia, o como saludo.', 'videos\\verbos\\besar.mov'),
	(280, 'Tener evidencia de algo.', 'videos\\verbos\\cantar-destacar.mov'),
   (280, NULL, 'videos\\verbos\\cantar.mov'),
   (281, NULL, 'videos\\verbos\\castigar.mov'),
   (282, 'Ingerir alimento.', 'videos\\verbos\\comer-alimento.mov'),
   (282, 'Quitar el sol/luz intensidad al color.', 'videos\\verbos\\comer-decolorar.mov'),
   (282, 'Omitir alguna frase/sílaba/letra/palabra ... cuando se habla escribe.', 'videos\\verbos\\comer-omitir.mov'),
   (282, 'Sin haber tenido parte en la causa/motivo del daño/provecho que sigue (sin comerlo ni beberlo).', 'videos\\verbos\\comerlo_sin.mov'),
   (283, 'Comprar.', 'videos\\verbos\\comprar_bim.mov'),
   (283, 'Comprar.', 'videos\\verbos\\comprar_mon.mov'),
   (284, 'No conocer ...', 'videos\\verbos\\conocer-no.mov'),
   (284, 'Conocer.', 'videos\\verbos\\conocer.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (225, 'Establecer la cantidad exacta (de personas/cosas) numerando/las.', 'videos\\verbos\\contar-matematicas.mov'),
   (285, 'Decir/dar a conocer un hecho/historia (reales/imaginarias).', 'videos\\verbos\\contar-narrar.mov'),
   (286, NULL, 'videos\\verbos\\correr-deporte.mov'),	
   (287, 'Impedir el paso por una carretera/calle/avenida.', 'videos\\verbos\\cortar-carretera.mov'),
   (287, 'Cortar lo que dice alguien/interrumpir.', 'videos\\verbos\\cortar-interrumpir.mov'),
   (287, 'Dividir algo o separar sus partes con unas tijeras.', 'videos\\verbos\\cortar-tijera.mov'),
   (287, 'Quedarse sin palabras por algo que se ve/te están contando.', 'videos\\verbos\\cortar_a.mov'),
   (287, 'Quedarse sin palabras por algo que te están contando en una conversación.', 'videos\\verbos\\cortar_b.mov'),
   (287, 'Corte de pello.', 'videos\\verbos\\corte-pelo.mov'),
   (288, 'Aumentar de tamaño los animales.', 'videos\\verbos\\crecer-animal.mov'),
   (288, 'Crecer en estatura una persona.', 'videos\\verbos\\crecer-persona.mov'),
   (288, 'Aumentar el tamaño de las plantas.', 'videos\\verbos\\crecer-planta.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (289, 'Trasladar información de alguien.', 'videos\\verbos\\decir-a-otro.mov'),
   (289, 'Denotar algo o dar muestras de ello.', 'videos\\verbos\\decir-destacar.mov'),
   (289, 'Hacer referencia a un libro/manifiesto.', 'videos\\verbos\\decir-hablar.mov'),
   (289, 'Decir que sí (afirmar, dar por cierto).', 'videos\\verbos\\decir_de_si.mov'),
   (289, 'Para dar a entender que se va a explicar mejor/de otra forma.', 'videos\\verbos\\decir_es.mov'),
   (289, 'Decir lo de antes.', 'videos\\verbos\\decir_lo_de_antes.mov'),
   (289, '¡¿qué dices?! cuando involucra algo que alguien está diciendo.', 'videos\\verbos\\dice_que.mov'),
   (289, 'No decir nada (omitir voluntariamente lo que se puede decir y no se dice).', 'videos\\verbos\\decir_no_mon.mov'),
   (290, 'Quitar color a algo.', 'videos\\verbos\\decolorar.mov'),
   (291, 'Reposar, dormir.', 'videos\\verbos\\descansar-dormir.mov'),
   (291, '1. Cesar en el trabajo, reparar las fuerzas con la quietud. 2. Tener algún alivio en las preocupaciones.', 'videos\\verbos\\descansar.mov'),
   (292, NULL, 'videos\\verbos\\desear.mov'),
   (293, NULL, 'videos\\verbos\\destacar.mov'),
   (294, NULL, 'videos\\verbos\\dormir.mov'),
   (295, NULL, 'videos\\verbos\\duchar.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (296, 'No entender (no conocer el ánimo/intención de alguien).', 'videos\\verbos\\entender-no.mov'),
   (296, 'Conocer algo/tener conocimiento de algo.', 'videos\\verbos\\entender-saber.mov'),
   (296, 'Tener una idea clara de las cosas.', 'videos\\verbos\\entender.mov'),
   (296, 'No entender nada.', 'videos\\verbos\\entender_nada_no.mov'),
   (297, NULL, 'videos\\verbos\\escribir.mov'),
   (298, 'Tener esperanzas.', 'videos\\verbos\\esperar-esperanza.mov'),
   (298, 'Esperar en un sitio.', 'videos\\verbos\\esperar_c.mov'),
   (299, 'Explicar.', 'videos\\verbos\\explicar.mov'),
   (299, 'No explicarse.', 'videos\\verbos\\explicarse_no.mov'),
   (300, NULL, 'videos\\verbos\\gritar.mov'),
   (301, 'Gustar.', 'videos\\verbos\\gustar.mov'),
   (301, 'No gustar nada (en absoluto).', 'videos\\verbos\\gustar_nada_no.mov'),
   (301, 'No gustar.', 'videos\\verbos\\gustar-no.mov'),
   (302, 'Hablar consigo mismo.', 'videos\\verbos\\hablar_consigo_mismo.mov'),
   (302, 'Dirigirse a alguien para tratar un asunto/solucionar un problema.', 'videos\\verbos\\hablar-entrevista.mov'),
   (302, 'Hablar.', 'videos\\verbos\\hablar-oral.mov'),
   (302, 'No hablarse.', 'videos\\verbos\\hablarse_no_5.mov'),
   (302, 'Darse a entender.', 'videos\\verbos\\hablar-signado.mov'),
   (302, 'No se habla más de ello (no hablar con ...).', 'videos\\verbos\\hable_no_se.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (303, 'Ser una persona/cosa motivo de interés/preocupación para alguien.', 'videos\\verbos\\importar.mov'),
   (303, 'No me importa.', 'videos\\verbos\\importa_no_me_1.mov'),
   (303, 'No me importa (una persona que está conforme con algo).', 'videos\\verbos\\importa_no_me_A.mov'),
   (303, 'A ti que te importa (indicarle a alguien que el tema que se está hablando no es asunto suyo y no debe intervenir).', 'videos\\verbos\\importa_que_te.mov'),
   (304, NULL, 'videos\\verbos\\insistir.mov'),
   (305, NULL, 'videos\\verbos\\interrumpir.mov'),
   (306, 'Arriesgar, aventurar.', 'videos\\verbos\\jugar-arriesgarse.mov'),
   (306, NULL, 'videos\\verbos\\jugar.mov'),
   (307, 'Lavar la ropa.', 'videos\\verbos\\lavar-ropa.mov'),
   (307, 'Lavar la cara.', 'videos\\verbos\\lavarse-cara.mov'),
   (307, 'Lavarse los dientes.', 'videos\\verbos\\lavarse-dientes.mov'),
   (307, 'Lavarse las manos.', 'videos\\verbos\\lavarse-manos.mov'),
   (307, 'Lavarse el pelo.', 'videos\\verbos\\lavarse-pelo.mov'),
   (308, 'Pasar un lector electrónico para leer un código de barras, etiqueta ...', 'videos\\verbos\\leer-escaner.mov'),
   (308, 'Leer el pensamiento de alguien.', 'videos\\verbos\\leer-telepatia.mov'),
   (308, NULL, 'videos\\verbos\\leer.mov'),
   (309, 'Levantarse de la cama.', 'videos\\verbos\\levantar-cama.mov'),
   (310, NULL, 'videos\\verbos\\llorar.mov'),
   (311, NULL, 'videos\\verbos\\llover.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (312, 'Subir a una bicicleta ...', 'videos\\verbos\\montar-a.mov'),
   (312, 'Armar, poner en su lugar las piezas de cualquier aparato o máquina.', 'videos\\verbos\\montar_Q.mov'),
   (313, 'Nacer un animal.', 'videos\\verbos\\nacer-animal.mov'),
   (313, NULL, 'videos\\verbos\\nacer-cosa.mov'),
   (313, 'Nacer una planta.', 'videos\\verbos\\nacer-vegetal.mov'),
   (314, NULL, 'videos\\verbos\\narrar.mov'),
   (315, NULL, 'videos\\verbos\\oir.mov'),
   (316, 'Sospechar/Presentir algo.', 'videos\\verbos\\oler-sospechar.mov'),
   (316, 'Percibir los olores.', 'videos\\verbos\\oler_a.mov'),
   (316, 'Procurar percibir o identificar un olor.', 'videos\\verbos\\oler_b.mov'),
   (317, NULL, 'videos\\verbos\\omitir.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (318, NULL, 'videos\\verbos\\pedir.mov'),
   (319, 'Unir una cosa con otra mediante alguna sustancia como un post-it/parche en la ropa.', 'videos\\verbos\\pegar-adherir.mov'),
   (319, 'Castigar a alguien con golpes.', 'videos\\verbos\\pegar-castigar.mov'),
   (319, 'Quemarse/Adherirse a una olla, cacuela, sarten ...', 'videos\\verbos\\pegar-comida.mov'),
   (319, 'Dicho de una persona: Comunicar a otra algo por el contacto, por el trato, etc., y especialmente vicios o enfermedades contagiosas.', 'videos\\verbos\\pegar-contagiar.mov'),
   (319, 'Pelearse con alguien.', 'videos\\verbos\\pegar-pelear.mov'),
   (319, 'Dicho de la luz/del sol: Incidir intensamente en una superficie.', 'videos\\verbos\\pegar-sol.mov'),
   (319, 'Sufrir una caída o un accidente violento.', 'videos\\verbos\\pegarsela_alguien.mov'),
   (320, NULL, 'videos\\verbos\\peinar.mov'),
   (321, NULL, 'videos\\verbos\\poner.mov'),
   (321, 'Hacer que alguien se ponga rojo.', 'videos\\verbos\\ponerse_rojo.mov'),
   (322, NULL, 'videos\\verbos\\preferir.mov'),
   (323, NULL, 'videos\\verbos\\prorroga.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (324, 'Amar/tener cariño, voluntad/inclinacion a alguien.', 'videos\\verbos\\querer-amar.mov'),
   (324, 'Desear/apetecer, tener voluntad/determinación de ejecutar algo.', 'videos\\verbos\\querer-desear.mov'),
   (324, 'No querer.', 'videos\\verbos\\querer-no.mov'),
   (324, 'Significar, indicar, dar a entender algo.', 'videos\\verbos\\querer_decir.mov'),
   (324, 'Hacer algo sin querer (sin mala intención).', 'videos\\verbos\\querer_sin.mov'),
   (324, 'Adonde/Cuando/Como quiera.', 'videos\\verbos\\quiera_como_mon.mov'),
   (325, NULL, 'videos\\verbos\\quitar-apartar.mov'),
   (325, 'Tomar algo separándolo y apartándolo de otras cosas, o del lugar o sitio en que estaba.', 'videos\\verbos\\quitar-coger.mov'),
   (325, 'Tomar o coger algo ajeno, hurtar.', 'videos\\verbos\\quitar-robar.mov'),
   (326, NULL, 'videos\\verbos\\regalar.mov'),
   (327, 'Reirse de forma burlona de algo/alguien.', 'videos\\verbos\\reir-burla.mov'),
   (327, NULL, 'videos\\verbos\\reir.mov'),
   (328, 'No saber ...', 'videos\\verbos\\saber-no_b.mov'),
   (328, NULL, 'videos\\verbos\\saber.mov'),
   (329, NULL, 'videos\\verbos\\saltar.mov'),
   (330, NULL, 'videos\\verbos\\sentar.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (331, 'No tener ...', 'videos\\verbos\\tener-haber-no.mov'),	(331, NULL, 'videos\\verbos\\tener-haber.mov'),
   (332, NULL, 'videos\\verbos\\tocar-tacto.mov'),						(333, 'No ver ...', 'videos\\verbos\\ver-no.mov'),
   (333, NULL, 'videos\\verbos\\ver_aa.mov'),
   (333, 'Examinar algo, reconocerlo con cuidado y atención.', 'videos\\verbos\\ver_b.mov'),
   (333, 'Para expresar extrañeza.', 'videos\\verbos\\ver_no-extrañeza.mov'),
   (334, NULL, 'videos\\verbos\\vestir.mov'),							(335, NULL, 'videos\\verbos\\vivir.mov');

-- Inserción de los videos de ADJETIVOS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (336, NULL, 'videos\\adjetivos\\aburrido.mov'),			(337, NULL, 'videos\\adjetivos\\acido.mov'),
   (338, NULL, 'videos\\adjetivos\\agradable.mov'),		(339, NULL, 'videos\\adjetivos\\agrio.mov'),
   (340, NULL, 'videos\\adjetivos\\alegre.mov'),			(341, 'Estatura.', 'videos\\adjetivos\\alto-estatura.mov'),
   (341, 'Para ordenar a alguien que se detenga/suspenda lo que está haciendo.', 'videos\\adjetivos\\alto-pararse.mov'),
   (341, 'Dicho de una clase social/del lugar en que se establece: Opulenta, acomodada.', 'videos\\adjetivos\\alto-sociedad.mov'),
   (342, NULL, 'videos\\adjetivos\\amargo.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
	(343, 'De poca altura.', 'videos\\adjetivos\\bajo-estatura.mov'),
   (343, 'Piso bajo de las casas que tienen dos o más.', 'videos\\adjetivos\\bajo-piso.mov'),
   (343, 'Dicho de una clase social/del lugar en que se establece: Modesto, humilde.', 'videos\\adjetivos\\bajo-sociedad.mov'),
   (344, 'Gustoso, apetecible.', 'videos\\adjetivos\\bonito.mov'),
   (345, 'Dicho de una persona: Que piensa o actúa con la norma moral.', 'videos\\adjetivos\\bueno-persona.mov'),
   (345, 'Sabor.', 'videos\\adjetivos\\bueno-sabor.mov'),	(345, NULL, 'videos\\adjetivos\\bueno_c.mov'),
	(346, 'Cosa.', 'videos\\adjetivos\\blando-cosa.mov'),	(346, 'Persona', 'videos\\adjetivos\\blando-persona.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (347, NULL, 'videos\\adjetivos\\caliente.mov'),
   (348, NULL, 'videos\\adjetivos\\castano.mov'),
   (350, '1. Dicho de un color: Que tiende al blanco. 2. Inteligible, fácil de comprender. 3. De manera clara. 4. Que se percibe/distingue bien.', 'videos\\adjetivos\\claro-color.mov'),
   (349, 'Contraste acusado entre la luz y las sombras en un cuadro.', 'videos\\adjetivos\\claro_oscuro.mov'),
   (351, 'Alegre, satisfecho.', 'videos\\adjetivos\\contento_bim.mov'),
   (351, 'Alegre, satisfecho.', 'videos\\adjetivos\\contento_mon.mov'),
   (352, NULL, 'videos\\adjetivos\\delgado.mov'),
   (353, NULL, 'videos\\adjetivos\\desagradable.mov'),
   (354, NULL, 'videos\\adjetivos\\diferente.mov'),
   (355, NULL, 'videos\\adjetivos\\divertido.mov'),
   (356, 'Dicho de una persona que es dulce.', 'videos\\adjetivos\\dulce-persona.mov'),
   (356, 'Sabor dulce.', 'videos\\adjetivos\\dulce-sabor.mov'),
   (357, 'Trabajar duro.', 'videos\\adjetivos\\duro-esfuerzo (trabajar duro).mov'),
   (357, 'Dicho de persona: Que tiene un carácter fuerte, exigente, severo o poco sensible.', 'videos\\adjetivos\\duro-riguroso.mov'),
   (357, 'Terco y obstinado.', 'videos\\adjetivos\\duro-terco.mov'),
   (357, NULL, 'videos\\adjetivos\\duro.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (358, NULL, 'videos\\adjetivos\\enfadado.mov'),
   (359, NULL, 'videos\\adjetivos\\enfermo.mov'),
   (360, NULL, 'videos\\adjetivos\\feliz.mov'),
   (361, NULL, 'videos\\adjetivos\\feo.mov'),
   (362, 'Sensación que se experimenta ante un notorio descenso de temperatura.', 'videos\\adjetivos\\frio-helado.mov'),
   (362, 'Dicho de una persona.', 'videos\\adjetivos\\frio-persona.mov'),
   (362, 'Temperatura baja.', 'videos\\adjetivos\\frio.mov'),
   (363, 'Muy grande o importante.', 'videos\\adjetivos\\gordo-importante.mov'),
   (363, '1. De abundantes carnes. 2. Muy abultado y corpulento.', 'videos\\adjetivos\\gordo-obeso.mov'),
   (364, NULL, 'videos\\adjetivos\\hambriento.mov'),
   (365, NULL, 'videos\\adjetivos\\igual.mov'),
   (366, NULL, 'videos\\adjetivos\\lento.mov'),
   (367, NULL, 'videos\\adjetivos\\limpio.mov'),
   (368, '1. Ocupado hasta el límite o por gran cantidad de personas o cosas. 2. Que tiene todas las plazas ocupadas. 3. Ocupación de la totalidad de las localidades de un recinto público.', 'videos\\adjetivos\\lleno_a.mov'),
   (368, 'Saciado de comida o de bebida.', 'videos\\adjetivos\\lleno_e.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (369, 'De mal humor y poco complaciente.', 'videos\\adjetivos\\malas_de.mov'),
   (369, 'Dicho de una cosa: Deteriorada o estropeada.', 'videos\\adjetivos\\malo-calidad.mov'),
   (369, 'De comportamiento/caracter inadecuado.', 'videos\\adjetivos\\malo-caracter.mov'),
   (369, 'Enfermo (que padece enfermedad).', 'videos\\adjetivos\\malo-enfermo.mov'),
   (370, 'Característica del pelo de una persona.', 'videos\\adjetivos\\moreno-pelo.mov'),
   (370, 'Característica de la piel de una persona.', 'videos\\adjetivos\\moreno-piel.mov'),
   (371, NULL, 'videos\\adjetivos\\mucho.mov'),
   (372, NULL, 'videos\\adjetivos\\oscuro.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (373, NULL, 'videos\\adjetivos\\pelirrojo.mov'),			(374, NULL, 'videos\\adjetivos\\picante.mov'),
   (375, NULL, 'videos\\adjetivos\\poco_a.mov'),				(376, 'Poco a poco.', 'videos\\adjetivos\\poco_a_poco.mov'),
   (377, 'Por poco.', 'videos\\adjetivos\\poco_por.mov'),	(378, 'Un poco.', 'videos\\adjetivos\\poco_un.mov'),
   (379, NULL, 'videos\\adjetivos\\primero-vertical.mov'),	(380, NULL, 'videos\\adjetivos\\rapido.mov'),
   (381, NULL, 'videos\\adjetivos\\rubio.mov'),					(382, NULL, 'videos\\adjetivos\\salado.mov'),
   (383, NULL, 'videos\\adjetivos\\sano.mov'),					(384, NULL, 'videos\\adjetivos\\sucio.mov'),
   (385, 'Dormir.', 'videos\\adjetivos\\sueno-dormir.mov'),
   (385, 'Tener un sueño o fantasía.', 'videos\\adjetivos\\sueno-fantasia.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (386, NULL, 'videos\\adjetivos\\templado.mov'),
   (387, NULL, 'videos\\adjetivos\\terco.mov'),
   (388, '1. Afligido, apesadumbrado. 2. De carácter o genio melancólico.', 'videos\\adjetivos\\triste-caracter.mov'),
   (388, 'Doloroso, enojoso, difícil de soportar.', 'videos\\adjetivos\\triste-doloroso.mov'),
   (388, 'Que denota pesadumbre o melancolía.', 'videos\\adjetivos\\triste_bim.mov'),
   (389, NULL, 'videos\\adjetivos\\ultimo_a.mov'),
   (390, NULL, 'videos\\adjetivos\\vacio.mov');

-- Inserción de los videos de ADVERBIOS a la tabla videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (391, '1. En un lugar que está más bajo o en la parte baja. 2. En una situación social o jerárquica más baja.', 'videos\\adverbios\\abajo.mov'),
   (391, 'Seguido de un nombre que expresa cantidad, por debajo de ella.', 'videos\\adverbios\\abajo_de.mov'),
   (392, NULL, 'videos\\adverbios\\ahora.mov'),
   (393, NULL, 'videos\\adverbios\\algo.mov'),
   (394, NULL, 'videos\\adverbios\\alli.mov'),
   (395, NULL, 'videos\\adverbios\\antes-lugar.mov'),
   (396, NULL, 'videos\\adverbios\\aqui.mov'),
   (397, 'Hacia un lugar que está más alto o en la parte alta.', 'videos\\adverbios\\arriba_a.mov'),
   (397, 'En un lugar que está más alto o en la parte alta.', 'videos\\adverbios\\arriba_b.mov');

INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (398, '1. Suficiente, que basta. 2. Una cantidad que basta, que es suficiente.', 'videos\\adverbios\\bastante-suficiente.mov'),
   (398, 'Una cantidad abundante de algo.', 'videos\\adverbios\\bastante.mov'),
   (340, 'Acuerdo.', 'videos\\adverbios\\bien-acuerdo.mov'),
   (399, 'Aquello que en sí mismo tiene el complemento de la perfección en su propio género, o lo que es objeto de la voluntad, la cual ni se mueve ni puede moverse sino por el bien, sea verdadero o aprehendido falsamente como tal.', 'videos\\adverbios\\bien_a.mov'),
   (399, 'Según se apetece/requiere, felizmente, de manera propia/adecuada para algún fin.', 'videos\\adverbios\\bien_b.mov'),
   (400, 'Próxima o inmediatamente en el espacio o en el tiempo.', 'videos\\adverbios\\cerca_a.mov'),
   (400, 'Próxima o inmediatamente en el espacio o en el tiempo.', 'videos\\adverbios\\cerca_b.mov'),
   (400, 'Próxima o inmediatamente en el tiempo.', 'videos\\adverbios\\cerca_c.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (401, NULL, 'videos\\adverbios\\debajo.mov'),
   (402, 'Enfrente.', 'videos\\adverbios\\delante-enfrente.mov'),
   (402, 'Con prioridad de lugar, en la parte anterior o en sitio detrás del cual hay alguien o algo.', 'videos\\adverbios\\delante.mov'),
   (403, NULL, 'videos\\adverbios\\demasiado.mov'),
   (404, 'En la parte interior de un espacio o término real o imaginario.', 'videos\\adverbios\\dentro_B.mov'),
   (404, 'En la parte interior de un espacio o término real o imaginario.', 'videos\\adverbios\\dentro_Q.mov'),
   (406, NULL, 'videos\\adverbios\\deprisa.mov'),
   (406, 'Dirección correspondiente al lado derecho.', 'videos\\adverbios\\derecha-direccion.mov'),
   (406, 'Mano derecha.', 'videos\\adverbios\\derecha-mano.mov'),
   (406, 'Que cae hacia la parte derecha de un objeto.', 'videos\\adverbios\\derecho-parte-derecha.mov'),
   (407, NULL, 'videos\\adverbios\\despacio.mov'),
   (408, NULL, 'videos\\adverbios\\despues.mov'),
   (409, 'En la parte posterior, o con posterioridad de lugar, o en sitio delante del cual está alguien o algo.', 'videos\\adverbios\\detras.mov'),
   (409, 'Por detrás: Detrás (en ausencia).', 'videos\\adverbios\\detras_por.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (410, NULL, 'videos\\adverbios\\encima-lugar.mov'),
   (411, NULL, 'videos\\adverbios\\fuera.mov'),
   (412, 'Dirección correspondiente al lado izquierdo.', 'videos\\adverbios\\izquierda-direccion.mov'),
   (412, 'Mano izquierda.', 'videos\\adverbios\\izquierda-mano.mov'),
   (412, 'Que cae hacia la parte izquierda de un objeto.', 'videos\\adverbios\\izquierdo.mov'),
   (413, 'Personas que favorecen, aconsejan o protegen a alguien.', 'videos\\adverbios\\lado.mov'),
   (413, 'En comparación con (al lado de...).', 'videos\\adverbios\\lado_al-comparacion.mov'),
   (413, 'En el lugar inmediato o contiguo a (al lado de...).', 'videos\\adverbios\\lado_al.mov'),
   (414, NULL, 'videos\\adverbios\\lejos.mov'),
   (415, NULL, 'videos\\adverbios\\luego.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (416, NULL, 'videos\\adverbios\\mal.mov'),
   (417, 'Preferible o más conveniente.', 'videos\\adverbios\\mejor-bien.mov'),
   (417, 'Quizá, tal vez (a lo mejor).', 'videos\\adverbios\\mejor_a_lo.mov'),
   (418, NULL, 'videos\\adverbios\\mucho.mov'),
   (419, 'Expresa estar sin dinero encima.', 'videos\\adverbios\\nada-dinero_b.mov'),
   (419, 'Inexistencia total o carencia absoluta de todo ser.', 'videos\\adverbios\\nada_a.mov'),
   (419, 'Ninguna cosa.', 'videos\\adverbios\\nada_b.mov'),
   (419, 'De ninguna manera. Usado para expresar orden o prohibición.', 'videos\\adverbios\\nada_d.mov'),
   (419, '1. Para reprender por lo que se ha hecho. 2. Para reprochar que no se hace absolutamente nada.', 'videos\\adverbios\\nada_e.mov'),
   (419, 'Para manifestarse en contra de la opinión de la persona que está hablando.', 'videos\\adverbios\\nada_f.mov'),
   (419, 'Para expresar que alguien no lleva o no trae nada en las manos.', 'videos\\adverbios\\nada_g.mov'),
   (419, 'Solamente (nada más).', 'videos\\adverbios\\nada_mas_mon.mov'),
   (419, 'Para quitar importancia al daño producido (no ser nada).', 'videos\\adverbios\\nada_no_ser.mov'),
   (419, 'No tener nada que ver.', 'videos\\adverbios\\nada_que_ver_no_tener.mov');
   
INSERT INTO videos (id_palabra, contexto, url_video) VALUES
   (420, NULL, 'videos\\adverbios\\peor.mov'),
   (421, 'En número, cantidad o intensidad escasos respecto de lo regular, ordinario o preciso.', 'videos\\adverbios\\poco_a.mov'),
   (421, 'Poco a poco.', 'videos\\adverbios\\poco_a_poco.mov'),
   (421, 'En número, cantidad o intensidad escasos respecto de lo regular, ordinario o preciso.', 'videos\\adverbios\\poco_b.mov'),
   (421, 'Un tiempo escaso o insuficiente.', 'videos\\adverbios\\poco_c.mov'),
   (421, 'Por poco.', 'videos\\adverbios\\poco_por.mov'),
   (421, 'Un poco.', 'videos\\adverbios\\poco_un.mov'),
   (422, NULL, 'videos\\adverbios\\tambien-igual.mov'),
   (423, NULL, 'videos\\adverbios\\tampoco.mov'),
   (424, 'Todavía no.', 'videos\\adverbios\\todavia-no.mov'),
   (424, NULL, 'videos\\adverbios\\todavia.mov'),
   (425, 'Enteramente o por completo en cuanto a la salud, ropa, higiene, etc., de una persona.', 'videos\\adverbios\\todo-cuerpo.mov'),
   (425, 'Que ha sido realizado enteramente o por completo por una única persona.', 'videos\\adverbios\\todo_ma.mov'),
   (425, '1. Designa la totalidad de los miembros de un conjunto. 2. Todas las personas. 3. Todas las cosas. 4. Enteramente o por completo.', 'videos\\adverbios\\todo_mp.mov'),
   (425, 'Sobre todo.', 'videos\\adverbios\\todo_sobre.mov');


-- Insertar ABECEDARIO en la tabla de videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (426, Null, 'videos\\abecedario\\a.mov'),  (427, Null, 'videos\\abecedario\\b.mov'),
   (428, Null, 'videos\\abecedario\\c.mov'),  (429, Null, 'videos\\abecedario\\ch.mov'),
   (430, Null, 'videos\\abecedario\\d.mov'),  (431, Null, 'videos\\abecedario\\e.mov'),    
   (432, Null, 'videos\\abecedario\\f.mov'),  (433, Null, 'videos\\abecedario\\g.mov'),
   (434, Null, 'videos\\abecedario\\h.mov'),  (435, Null, 'videos\\abecedario\\i.mov'),
   (436, Null, 'videos\\abecedario\\j.mov'),  (437, Null, 'videos\\abecedario\\k.mov'),
   (438, Null, 'videos\\abecedario\\l.mov'),  (439, Null, 'videos\\abecedario\\ll.mov'),
   (440, Null, 'videos\\abecedario\\m.mov'),  (441, Null, 'videos\\abecedario\\n.mov'),
   (442, Null, 'videos\\abecedario\\ñ.mov'),  (443, Null, 'videos\\abecedario\\o.mov'),
   (444, Null, 'videos\\abecedario\\p.mov'),  (445, Null, 'videos\\abecedario\\q.mov'),
   (446, Null, 'videos\\abecedario\\r.mov'),  (447, Null, 'videos\\abecedario\\rr.mov'),
   (448, Null, 'videos\\abecedario\\s.mov'), (449, Null, 'videos\\abecedario\\t.mov'),
   (450, Null, 'videos\\abecedario\\u.mov'),  (451, Null, 'videos\\abecedario\\v.mov'),
   (452, Null, 'videos\\abecedario\\w.mov'),  (453, Null, 'videos\\abecedario\\x.mov'),
   (454, Null, 'videos\\abecedario\\y.mov'),  (455, Null, 'videos\\abecedario\\z.mov');


-- Insertar COLORES en la tabla de videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (456, 'Dicho de un color: Semejante al del oro o al de yema del huevo.', 'videos\\colores\\amarillo.mov'),
   (457, 'Dicho de un color: Semejante al de la sangre o al del tomate maduro.', 'videos\\colores\\rojo.mov'),
   (458, 'Dicho de un color: Semejante al de la hierba fresca o al de la esmeralda.', 'videos\\colores\\verde.mov'),
   (459, 'Dicho de un color: Rojo muy pálido, como el de la rosa común.', 'videos\\colores\\rosa-color.mov'),
   (460, 'Dicho de un color: Semejante al de la nieve o la leche.', 'videos\\colores\\blanco-color.mov'),
   (461, 'Dicho de un color: Semejante al del carbón o al de la oscuridad total.', 'videos\\colores\\negro-color.mov'),    
   (462, 'Dicho de un color: Que está entre el rojo y el azul.', 'videos\\colores\\morado.mov'),
   (463, 'Dicho de un color: Semejante al del cielo sin nubes o el mar en un día soleado.', 'videos\\colores\\azul.mov'),
   (464, 'Dicho de un color: Semejante al de la ceniza o el acero, y que resulta de mezclar el blanco y el negro.', 'videos\\colores\\gris-color.mov'),
   (465, 'Dicho de un color: Semejante al de la cáscara de la castaña o el pelaje de la ardilla.', 'videos\\colores\\marron.mov'),
   (466, 'Color entre rojo y amarillo.', 'videos\\frutas\\naranja.mov'),
   (467, 'Dicho de un color: Semejante al del oro.', 'videos\\colores\\dorado.mov'),
   (468, 'Dicho de un color: Semejante al de la plata.', 'videos\\colores\\plateado.mov');


-- Insertar BEBIDAS en la tabla de videos
INSERT INTO videos (id_palabra, contexto, url_video) VALUES 
   (469, 'Sustancia líquida que, en estado puro, no tiene olor ni sabor y que es el componente más abundante de la superficie terrestre y el esencial de los seres vivos.', 'videos\\bebidas\\agua.mov'),
   (470, 'Líquido de las hierbas, flores, frutas u otras cosas semejantes, que se saca exprimiéndolas o majándolas.', 'videos\\bebidas\\zumo.mov'),  
   (471, 'Bebida que se hace batiendo helado, leche u otros ingredientes.', 'videos\\bebidas\\batido.mov'),
   (472, 'Infusión a base de hojas.', 'videos\\bebidas\\te-bebida.mov'),
   (473, 'Bebida refrescante, generalmente sin alcohol, que se sirve fría.', 'videos\\bebidas\\refresco.mov'),  
   (474, 'Bebida alcohólica hecha con granos germinados de cebada u otros cereales fermentados en agua, y aromatizada con lúpulo, boj, casia, etc.', 'videos\\bebidas\\cerveza.mov'),
   (475, 'Bebida alcohólica que se hace del zumo de las uvas exprimido, y cocido naturalmente por la fermentación.', 'videos\\bebidas\\vino.mov'),  
   (476, 'Bebida alcohólica de color dorado que se hace del zumo de las uvas blancas exprimido, y cocido naturalmente por la fermentación.', 'videos\\bebidas\\vino-blanco.mov'),
   (477, 'Bebida alcohólica de color rojo oscuro que se hace del zumo de las uvas negras exprimido, y cocido naturalmente por la fermentación.', 'videos\\bebidas\\vino-tinto.mov'),
   (478, 'Infusión que se hace con granos de café tostados y molidos.', 'videos\\bebidas\\cafe.mov'),  
   (479, 'Café al que se le añade una cantidad similar o mayor de leche.', 'videos\\bebidas\\cafe-leche.mov'),
   (480, 'Café con muy poca leche.', 'videos\\bebidas\\cafe_cortado.mov'),  
   (481, 'Café al que se ha reducido el contenido de cafeína.', 'videos\\bebidas\\cafe_descafeinado.mov'),
   (482, 'Café que se prepara añadiendo tan solo agua al café ya molido.', 'videos\\bebidas\\cafe_solo.mov'),  
   (483, 'Café que se prepara añadiendo tan solo agua al café ya molido.', 'videos\\bebidas\\cafe_solo.mov'),    
   (484, 'Café que se prepara añadiendo tan solo agua al café ya molido.', 'videos\\bebidas\\cafe_solo.mov');
