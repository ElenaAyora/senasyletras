DELETE FROM usuarios;
DELETE FROM categorias;
DELETE FROM alfabeto;

-- Inserta valores a la tabla usuarios


-- Inserta valores de las categorias de las respectivas palabras
INSERT INTO categorias (id_categoria, nombre) VALUES 
	(1, 'Frutas'), (2, 'Verduras'),(3, 'Semillas'), (4, 'Animales'),(5, 'Calendario'), (6, 'Semana'),
	(7, 'Meses'), (8, 'Estaciones'), (9, 'Fiestas'), (10, 'Tiempo'), (11, 'Interacciones'), (12, 'Familia'),
	(13, 'Emociones'), (14, 'Sabores'), (15, 'Ropa'), (16, 'Cuerpo'), (17, 'Verbos'), (18, 'Adjetivos'), 
	(19, 'Adverbios'), (20, 'Abecedario'), (21, 'Colores'), (22, 'Bebidas');


-- Inserta valores del alfabeto dactilológico
INSERT INTO alfabeto (letra, ruta_imagen) VALUES
	('a', 'img-dicc-dactilologico\\a.png'),
	('b', 'img-dicc-dactilologico\\b.png'), 
	('c', 'img-dicc-dactilologico\\c.png'),
	('ch', 'img-dicc-dactilologico\\ch.png'), 
	('d', 'img-dicc-dactilologico\\d.png'),
	('e', 'img-dicc-dactilologico\\e.png'),
	('f', 'img-dicc-dactilologico\\f.png'),
	('g', 'img-dicc-dactilologico\\g.png'),
	('h', 'img-dicc-dactilologico\\h.png'),
	('i', 'img-dicc-dactilologico\\i.png'),
	('j', 'img-dicc-dactilologico\\j.png'),
	('k', 'img-dicc-dactilologico\\k.png'),
	('l', 'img-dicc-dactilologico\\l.png'),
	('ll', 'img-dicc-dactilologico\\ll.png'),
	('m', 'img-dicc-dactilologico\\m.png'),
	('n', 'img-dicc-dactilologico\\n.png'),
	('ñ', 'img-dicc-dactilologico\\ñ.png'),
	('o', 'img-dicc-dactilologico\\o.png'),
	('p', 'img-dicc-dactilologico\\p.png'),
	('q', 'img-dicc-dactilologico\\q.png'),
	('r', 'img-dicc-dactilologico\\r.png'),
	('rr', 'img-dicc-dactilologico\\rr.png'),
	('s', 'img-dicc-dactilologico\\s.png'),
	('t', 'img-dicc-dactilologico\\t.png'),
	('u', 'img-dicc-dactilologico\\u.png'),
	('v', 'img-dicc-dactilologico\\v.png'),
	('w', 'img-dicc-dactilologico\\w.png'),
	('x', 'img-dicc-dactilologico\\x.png'),
	('y', 'img-dicc-dactilologico\\y.png'),
	('z', 'img-dicc-dactilologico\\z.png'),
	(' ', 'img-dicc-dactilologico\\espacio.png'),
	('á', 'img-dicc-dactilologico\\a.png'),
	('à', 'img-dicc-dactilologico\\a.png'),
	('ä', 'img-dicc-dactilologico\\a.png'),
	('é', 'img-dicc-dactilologico\\e.png'),
	('è', 'img-dicc-dactilologico\\e.png'),
	('ë', 'img-dicc-dactilologico\\e.png'),
	('í', 'img-dicc-dactilologico\\i.png'),
	('`1', 'img-dicc-dactilologico\\i.png'),
	('ï', 'img-dicc-dactilologico\\i.png'),
	('ó', 'img-dicc-dactilologico\\o.png'),
	('ò', 'img-dicc-dactilologico\\o.png'),
	('ö', 'img-dicc-dactilologico\\o.png'),
	('ú', 'img-dicc-dactilologico\\u.png'),
	('ù', 'img-dicc-dactilologico\\u.png'),
	('ü', 'img-dicc-dactilologico\\u.png')
;
