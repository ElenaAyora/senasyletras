DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS palabras;
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS alfabeto;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS mensajes;
DROP TABLE IF EXISTS usuario_palabra;

-- Tabla de categorías
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


-- Tabla de palabras
CREATE TABLE palabras (
    id_palabra INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE CASCADE
);


-- Tabla de videos de lengua de señas
CREATE TABLE videos (
	id_video INT AUTO_INCREMENT PRIMARY KEY,
	id_palabra INT NOT NULL,
-- 	tipo ENUM('sustantivo','verbo','adjetivo','adverbio','otros') NOT NULL,
	contexto VARCHAR(500),
	url_video VARCHAR(500) NOT NULL,
	FOREIGN KEY (id_palabra) REFERENCES palabras(id_palabra) ON DELETE CASCADE
);


-- Tabla imagenes alfabeto dactilológico
CREATE TABLE alfabeto (
	id_alfabeto INT AUTO_INCREMENT,
	letra CHAR(2) NOT NULL,
	ruta_imagen VARCHAR(500) NOT NULL,
	PRIMARY KEY (id_alfabeto)
);


-- Tablas de usuarios
CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	userName VARCHAR(100) NOT NULL,
	correo VARCHAR(250) NOT NULL UNIQUE,
	contrasena VARCHAR(255) NOT NULL,
	rol ENUM('admin','usuario') NOT NULL DEFAULT 'usuario'
);


-- Tabla de mensajes
CREATE TABLE mensajes (
	id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
	emisor INT NOT NULL, 	  -- Emisor
    receptor INT NOT NULL, -- Receptor
	mensaje TEXT NOT NULL,
	estado ENUM('pendiente','resuelto') DEFAULT 'pendiente',
	respuesta TEXT DEFAULT NULL,
	fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	fecha_respuesta TIMESTAMP,
	FOREIGN KEY (emisor) REFERENCES usuarios(id_usuario) ON DELETE CASCADE, -- Referencia al emisor
	FOREIGN KEY (receptor) REFERENCES usuarios(id_usuario) ON DELETE CASCADE -- Referencia al receptor
);

-- Tabla palabras aprendidas por el usuario
CREATE TABLE usuario_palabra (
    id_usuario INT NOT NULL,
    id_palabra INT NOT NULL,
    id_video INT NOT NULL,
    url_video VARCHAR(500) NOT NULL,
    contexto VARCHAR(500),
    aciertos INT DEFAULT 0,
    PRIMARY KEY (id_usuario, id_palabra, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_palabra) REFERENCES palabras(id_palabra) ON DELETE CASCADE,
    FOREIGN KEY (id_video) REFERENCES videos(id_video) ON DELETE CASCADE
);