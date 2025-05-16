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


INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Alaves', 'Mendizorrotza', 'escudos/alaves.png', 'estadios/alaves.jpg', 'plantillas/alaves.jpg', 'camisetas/alaves_local.jpg', 'camisetas/alaves_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Athletic', 'San Mamés', 'escudos/athletic.png', 'estadios/athletic.jpg', 'plantillas/athletic.jpg', 'camisetas/athletic_local.jpg', 'camisetas/athletic_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Atlmadrid', 'Cívitas Metropolitano', 'escudos/atlmadrid.png', 'estadios/atlmadrid.jpg', 'plantillas/atlmadrid.jpg', 'camisetas/atlmadrid_local.jpg', 'camisetas/atlmadrid_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Barcelona', 'Spotify Camp Nou', 'escudos/barcelona.png', 'estadios/barcelona.jpg', 'plantillas/barcelona.jpg', 'camisetas/barcelona_local.jpg', 'camisetas/barcelona_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Betis', 'Benito Villamarín', 'escudos/betis.png', 'estadios/betis.jpg', 'plantillas/betis.jpg', 'camisetas/betis_local.jpg', 'camisetas/betis_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Celta', 'Abanca-Balaídos', 'escudos/celta.png', 'estadios/celta.jpg', 'plantillas/celta.jpg', 'camisetas/celta_local.jpg', 'camisetas/celta_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Espanyol', 'RCDE Stadium', 'escudos/espanyol.png', 'estadios/espanyol.jpg', 'plantillas/espanyol.jpg', 'camisetas/espanyol_local.jpg', 'camisetas/espanyol_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Getafe', 'Coliseum Alfonso Pérez', 'escudos/getafe.png', 'estadios/getafe.jpg', 'plantillas/getafe.jpg', 'camisetas/getafe_local.jpg', 'camisetas/getafe_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Girona', 'Montilivi', 'escudos/girona.png', 'estadios/girona.jpg', 'plantillas/girona.jpg', 'camisetas/girona_local.jpg', 'camisetas/girona_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Leganes', 'Estadio Municipal de Butarque', 'escudos/leganes.png', 'estadios/leganes.jpg', 'plantillas/leganes.jpg', 'camisetas/leganes_local.jpg', 'camisetas/leganes_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Mallorca', 'Visit Mallorca Estadi', 'escudos/mallorca.png', 'estadios/mallorca.jpg', 'plantillas/mallorca.jpg', 'camisetas/mallorca_local.jpg', 'camisetas/mallorca_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Osasuna', 'El Sadar', 'escudos/osasuna.png', 'estadios/osasuna.jpg', 'plantillas/osasuna.jpg', 'camisetas/osasuna_local.jpg', 'camisetas/osasuna_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Rayovallecano', 'Estadio de Vallecas', 'escudos/rayovallecano.png', 'estadios/rayovallecano.jpg', 'plantillas/rayovallecano.jpg', 'camisetas/rayovallecano_local.jpg', 'camisetas/rayovallecano_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Realmadrid', 'Santiago Bernabéu', 'escudos/realmadrid.png', 'estadios/realmadrid.jpg', 'plantillas/realmadrid.jpg', 'camisetas/realmadrid_local.jpg', 'camisetas/realmadrid_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Realsociedad', 'Reale Arena', 'escudos/realsociedad.png', 'estadios/realsociedad.jpg', 'plantillas/realsociedad.jpg', 'camisetas/realsociedad_local.jpg', 'camisetas/realsociedad_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Sevilla', 'Ramón Sánchez-Pizjuán', 'escudos/sevilla.png', 'estadios/sevilla.jpg', 'plantillas/sevilla.jpg', 'camisetas/sevilla_local.jpg', 'camisetas/sevilla_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Udlaspalmas', 'Estadio de Gran Canaria', 'escudos/udlaspalmas.png', 'estadios/udlaspalmas.jpg', 'plantillas/udlaspalmas.jpg', 'camisetas/udlaspalmas_local.jpg', 'camisetas/udlaspalmas_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Valencia', 'Mestalla', 'escudos/valencia.png', 'estadios/valencia.jpg', 'plantillas/valencia.jpg', 'camisetas/valencia_local.jpg', 'camisetas/valencia_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Valladolid', 'Estadio José Zorrilla', 'escudos/valladolid.png', 'estadios/valladolid.jpg', 'plantillas/valladolid.jpg', 'camisetas/valladolid_local.jpg', 'camisetas/valladolid_visitante.jpg');

INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_plantilla, imagen_camiseta_local, imagen_camiseta_visitante)
VALUES ('Villarreal', 'Estadio de la Cerámica', 'escudos/villarreal.png', 'estadios/villarreal.jpg', 'plantillas/villarreal.jpg', 'camisetas/villarreal_local.jpg', 'camisetas/villarreal_visitante.jpg');
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






