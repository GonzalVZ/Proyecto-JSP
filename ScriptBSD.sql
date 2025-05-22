DROP DATABASE IF EXISTS web_futbol;
CREATE DATABASE web_futbol CHARACTER SET utf8mb4;
USE web_futbol;

CREATE TABLE equipos (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    estadio VARCHAR(50),
    imagen_escudo VARCHAR(50),
    imagen_estadio VARCHAR(50),
    imagen_camiseta_local VARCHAR(100),
    imagen_camiseta_visitante VARCHAR(100)
);

CREATE TABLE partidos (
    id_partido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL
);

CREATE TABLE juegan (
    id_partido INT UNSIGNED,
    id_equipo INT UNSIGNED,
    goles INT,
    PRIMARY KEY (id_partido, id_equipo),
    FOREIGN KEY (id_partido) REFERENCES partidos(id_partido) ON DELETE CASCADE,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE
);

CREATE TABLE usuarios (
    id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    puntos INT DEFAULT 0
);

CREATE TABLE apuestas (
    id_partido INT UNSIGNED,
    id_usuario INT UNSIGNED,
    puntos_apostados INT,
    PRIMARY KEY(id_partido, id_usuario),
    FOREIGN KEY(id_partido) REFERENCES partidos(id_partido) ON DELETE CASCADE,
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE apuestas_detalle (
    id_partido INT UNSIGNED,
    id_usuario INT UNSIGNED,
    id_equipo INT UNSIGNED,
    goles_apostados INT,
    PRIMARY KEY(id_partido, id_usuario, id_equipo),
    FOREIGN KEY (id_partido, id_usuario) REFERENCES apuestas(id_partido, id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE
);



-- Insertar equipos
INSERT INTO equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES
                                                                                                                           ('Alaves', 'Mendizorrotza', 'escudos/alaves.png', 'estadios/Alaves.jpg', 'camisetas_local/camisetalocalAlaves.jpg', 'camisetas_visitante/camisetavisitanteAlaves.jpg'),
                                                                                                                           ('Athletic', 'San Mamés', 'escudos/athletic.png', 'estadios/Athletic.jpg', 'camisetas_local/camisetalocalAthletic.jpg', 'camisetas_visitante/camisetavisitanteAthletic.jpg'),
                                                                                                                           ('Atlmadrid', 'Cívitas Metropolitano', 'escudos/atlmadrid.png', 'estadios/AtleticoMadrid.jpg', 'camisetas_local/camisetalocalAtleticodeMadrid.jpg', 'camisetas_visitante/camisetavisitanteAtleticodeMadrid.jpg'),
                                                                                                                           ('Barcelona', 'Spotify Camp Nou', 'escudos/barcelona.png', 'estadios/Barsa.jpg', 'camisetas_local/camisetalocalBarcelona.jpg', 'camisetas_visitante/camisetavisitanteBarcelona.jpg'),
                                                                                                                           ('Betis', 'Benito Villamarín', 'escudos/betis.png', 'estadios/Betis.jpg', 'camisetas_local/camisetalocalBetis.jpg', 'camisetas_visitante/camisetavisitanteBetis.jpg'),
                                                                                                                           ('Celta', 'Abanca-Balaídos', 'escudos/celta.png', 'estadios/Celta.jpg', 'camisetas_local/camisetalocalCelta.jpg', 'camisetas_visitante/camisetavisitanteCelta.jpg'),
                                                                                                                           ('Espanyol', 'RCDE Stadium', 'escudos/espanyol.png', 'estadios/Espanyol.jpg', 'camisetas_local/camisetalocalEspanyol.jpg', 'camisetas_visitante/camisetavisitanteEspanyol.jpg'),
                                                                                                                           ('Getafe', 'Coliseum Alfonso Pérez', 'escudos/getafe.png', 'estadios/Getafe.jpg', 'camisetas_local/camisetalocalGetafe.jpg', 'camisetas_visitante/camisetavisitanteGetafe.jpg'),
                                                                                                                           ('Girona', 'Montilivi', 'escudos/girona.png', 'estadios/Girona.jpg', 'camisetas_local/camisetalocalGirona.jpg', 'camisetas_visitante/camisetavisitanteGirona.jpg'),
                                                                                                                           ('Leganes', 'Estadio Municipal de Butarque', 'escudos/leganes.png', 'estadios/Leganes.jpg', 'camisetas_local/camisetalocalLeganes.jpg', 'camisetas_visitante/camisetavisitanteLeganes.jpg'),
                                                                                                                           ('Mallorca', 'Visit Mallorca Estadi', 'escudos/mallorca.png', 'estadios/Mallorca.jpg', 'camisetas_local/camisetalocalMallorca.jpg', 'camisetas_visitante/camisetavisitanteMallorca.jpg'),
                                                                                                                           ('Osasuna', 'El Sadar', 'escudos/osasuna.png', 'estadios/Osasuna.jpg', 'camisetas_local/camisetalocalOsasuna.jpg', 'camisetas_visitante/camisetavisitanteOsasuna.jpg'),
                                                                                                                           ('Rayovallecano', 'Estadio de Vallecas', 'escudos/rayovallecano.png', 'estadios/RayoVallecano.jpg', 'camisetas_local/camisetalocalRayoVallecano.jpg', 'camisetas_visitante/camisetavisitanteRayoVallecano.jpg'),
                                                                                                                           ('Realmadrid', 'Santiago Bernabéu', 'escudos/realmadrid.png', 'estadios/Madrid.jpg', 'camisetas_local/camisetalocalRealMadrid.jpg', 'camisetas_visitante/camisetavisitanteRealMadrid.jpg'),
                                                                                                                           ('Realsociedad', 'Reale Arena', 'escudos/realsociedad.png', 'estadios/RealSociedad.jpg', 'camisetas_local/camisetalocalRealSociedad.jpg', 'camisetas_visitante/camisetavisitanteRealSociedad.jpg'),
                                                                                                                           ('Sevilla', 'Ramón Sánchez-Pizjuán', 'escudos/sevilla.png', 'estadios/Sevilla.jpg', 'camisetas_local/camisetalocalSevilla.jpg', 'camisetas_visitante/camisetavisitanteSevilla.jpg'),
                                                                                                                           ('Udlaspalmas', 'Estadio de Gran Canaria', 'escudos/udlaspalmas.png', 'estadios/GranCanarias.jpg', 'camisetas_local/camisetalocalUDLasPalmas.jpg', 'camisetas_visitante/camisetavisitanteUDLasPalmas.jpg'),
                                                                                                                           ('Valencia', 'Mestalla', 'escudos/valencia.png', 'estadios/Valencia.jpg', 'camisetas_local/camisetalocalValencia.jpg', 'camisetas_visitante/camisetavisitanteValencia.jpg'),
                                                                                                                           ('Valladolid', 'Estadio José Zorrilla', 'escudos/valladolid.png', 'estadios/Valladolid.jpg', 'camisetas_local/camisetalocalValladolid.jpg', 'camisetas_visitante/camisetavisitanteValladolid.jpg'),
                                                                                                                           ('Villarreal', 'Estadio de la Cerámica', 'escudos/villarreal.png', 'estadios/Villarreal.jpg', 'camisetas_local/camisetalocalVillarreal.jpg', 'camisetas_visitante/camisetavisitanteVillarreal.jpg');

-- Insertar partidos
INSERT INTO partidos (fecha) VALUES
                                 ('2025-05-20'), -- Partido 1
                                 ('2025-05-21'), -- Partido 2
                                 ('2025-05-22'), -- Partido 3
                                 ('2025-05-23'), -- Partido 4
                                 ('2025-05-24'), -- Partido 5
                                 ('2025-05-25'), -- Partido 6
                                 ('2025-05-26'); -- Partido 7

-- Relación juegan
INSERT INTO juegan (id_partido, id_equipo, goles) VALUES
                                                      (1, 1, 2), (1, 2, 1), -- Alaves vs Athletic
                                                      (2, 5, 1), (2, 16, 1), -- Betis vs Sevilla
                                                      (3, 18, 2), (3, 20, 2), -- Valencia vs Villarreal
                                                      (4, 2, 3), (4, 12, 0), -- Athletic vs Osasuna
                                                      (5, 3, 2), (5, 8, 1), -- Atlmadrid vs Getafe
                                                      (6, 9, 1), (6, 6, 3); -- Girona vs Celta

-- Insertar 20 usuarios
INSERT INTO usuarios (email, password, puntos) VALUES
                                                   ('usuario1@email.com', '1234', 1000),
                                                   ('usuario2@email.com', 'abcd', 800),
                                                   ('usuario3@email.com', 'pass3', 750),
                                                   ('usuario4@email.com', 'pass4', 950),
                                                   ('usuario5@email.com', 'clave5', 600),
                                                   ('usuario6@email.com', 'clave6', 850),
                                                   ('usuario7@email.com', 'admin', 1200),
                                                   ('usuario8@email.com', 'qwerty', 500),
                                                   ('usuario9@email.com', 'asdf', 400),
                                                   ('usuario10@email.com', 'zxcv', 300),
                                                   ('usuario11@email.com', '0000', 100),
                                                   ('usuario12@email.com', '123abc', 900),
                                                   ('usuario13@email.com', 'miPass13', 1300),
                                                   ('usuario14@email.com', 'clave14', 800),
                                                   ('usuario15@email.com', 'clave15', 700),
                                                   ('usuario16@email.com', '16pass', 950),
                                                   ('usuario17@email.com', '17clave', 650),
                                                   ('usuario18@email.com', 'pass18', 1100),
                                                   ('usuario19@email.com', 'abc123', 980),
                                                   ('usuario20@email.com', 'p@ssword', 770);


SELECT equipos.imagen_escudo
FROM equipos
         INNER JOIN juegan ON equipos.id_equipo = juegan.id_equipo INNER JOIN partidos ON juegan.id_partido = partidos.id_partido ORDER BY partidos.fecha ASC;

SELECT * FROM apuestas_detalle;
SELECT * FROM apuestas;
SELECT * FROM usuarios;