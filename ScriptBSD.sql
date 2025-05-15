DROP DATABASE IF EXISTS web_futbol;
CREATE DATABASE web_futbol CHARACTER SET utf8mb4;
USE web_futbol;

CREATE TABLE Equipos (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    estadio VARCHAR(50),
    imagen_escudo VARCHAR(50),
    imagen_estadio VARCHAR(50),
    imagen_plantilla VARCHAR(50),
    imagen_camiseta_local VARCHAR(100),
    imagen_camiseta_visitante VARCHAR(100)
);

CREATE TABLE Partidos (
    id_partido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL
);

CREATE TABLE Juegan (
    id_partido INT UNSIGNED,
    id_equipo INT UNSIGNED,
    goles INT,
    PRIMARY KEY (id_partido, id_equipo),
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Usuarios(
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(50),
password VARCHAR(50),
puntos INT

);

CREATE TABLE Apuestas (
    id_partido INT UNSIGNED,
    id_usuario INT UNSIGNED,
    puntos_apostados INT,
    PRIMARY KEY(id_partido, id_usuario),
    FOREIGN KEY(id_partido) REFERENCES Partidos(id_partido),
    FOREIGN KEY(id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Apuestas_Detalle (
    id_partido INT UNSIGNED,
    id_usuario INT UNSIGNED,
    id_equipo INT UNSIGNED,
    goles_apostados INT,
    PRIMARY KEY(id_partido, id_usuario, id_equipo),
    FOREIGN KEY (id_partido, id_usuario) REFERENCES Apuestas(id_partido, id_usuario),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);


-- Insertar equipos
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES
('Real Madrid', 'Santiago Bernabéu', 'escudos/rm.png', 'estadios/bernabeu.jpg', 'plantillas/rm.jpg', 'camisetas/rm_local.jpg', 'camisetas/rm_visitante.jpg'),
('FC Barcelona', 'Spotify Camp Nou', 'escudos/fcb.png', 'estadios/campnou.jpg', 'plantillas/fcb.jpg', 'camisetas/fcb_local.jpg', 'camisetas/fcb_visitante.jpg');

-- Insertar partido
INSERT INTO Partidos (fecha)
VALUES
('2025-05-20');

-- Insertar relación juegan (partido y goles)
INSERT INTO Juegan (id_partido, id_equipo, goles)
VALUES
(1, 1, 2),  -- Real Madrid marcó 2 goles
(1, 2, 1);  -- Barcelona marcó 1 gol

-- Insertar usuarios
INSERT INTO Usuarios (email, password, puntos)
VALUES
('usuario1@email.com', '1234', 1000),
('usuario2@email.com', 'abcd', 800);

-- Insertar apuestas
INSERT INTO Apuestas (id_partido, id_usuario, puntos_apostados)
VALUES
(1, 1, 100),
(1, 2, 200);

-- Insertar detalles de apuestas
INSERT INTO Apuestas_Detalle (id_partido, id_usuario, id_equipo, goles_apostados)
VALUES
(1, 1, 1, 2), -- Usuario 1 apuesta que Real Madrid mete 2 goles
(1, 1, 2, 1), -- Usuario 1 apuesta que Barcelona mete 1 gol
(1, 2, 1, 3), -- Usuario 2 apuesta que Real Madrid mete 3 goles
(1, 2, 2, 2); -- Usuario 2 apuesta que Barcelona mete 2 goles






