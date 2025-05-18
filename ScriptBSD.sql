DROP DATABASE IF EXISTS web_futbol;
CREATE DATABASE web_futbol CHARACTER SET utf8mb4;
USE web_futbol;

CREATE TABLE Equipos (
                         id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(50) NOT NULL UNIQUE,
                         estadio VARCHAR(50),
                         imagen_escudo VARCHAR(50),
                         imagen_estadio VARCHAR(50),
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


INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Alaves', 'Mendizorrotza', 'escudos/alaves.png', 'estadios/Alaves.jpg', 'camisetas_local/camisetalocalAlaves.jpg', 'camisetas_visitante/camisetavisitanteAlaves.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Athletic', 'San Mamés', 'escudos/athletic.png', 'estadios/Athletic.jpg', 'camisetas_local/camisetalocalAthletic.jpg', 'camisetas_visitante/camisetavisitanteAthletic.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Atlmadrid', 'Cívitas Metropolitano', 'escudos/atlmadrid.png', 'estadios/AtleticoMadrid.jpg', 'camisetas_local/camisetalocalAtleticodeMadrid.jpg', 'camisetas_visitante/camisetavisitanteAtleticodeMadrid.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Barcelona', 'Spotify Camp Nou', 'escudos/barcelona.png', 'estadios/Barsa.jpg', 'camisetas_local/camisetalocalBarcelona.jpg', 'camisetas_visitante/camisetavisitanteBarcelona.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Betis', 'Benito Villamarín', 'escudos/betis.png', 'estadios/Betis.jpg', 'camisetas_local/camisetalocalBetis.jpg', 'camisetas_visitante/camisetavisitanteBetis.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Celta', 'Abanca-Balaídos', 'escudos/celta.png', 'estadios/Celta.jpg', 'camisetas_local/camisetalocalCelta.jpg', 'camisetas_visitante/camisetavisitanteCelta.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Espanyol', 'RCDE Stadium', 'escudos/espanyol.png', 'estadios/Espanyol.jpg', 'camisetas_local/camisetalocalEspanyol.jpg', 'camisetas_visitante/camisetavisitanteEspanyol.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Getafe', 'Coliseum Alfonso Pérez', 'escudos/getafe.png', 'estadios/Getafe.jpg', 'camisetas_local/camisetalocalGetafe.jpg', 'camisetas_visitante/camisetavisitanteGetafe.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Girona', 'Montilivi', 'escudos/girona.png', 'estadios/Girona.jpg', 'camisetas_local/camisetalocalGirona.jpg', 'camisetas_visitante/camisetavisitanteGirona.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Leganes', 'Estadio Municipal de Butarque', 'escudos/leganes.png', 'estadios/Leganes.jpg', 'camisetas_local/camisetalocalLeganes.jpg', 'camisetas_visitante/camisetavisitanteLeganes.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Mallorca', 'Visit Mallorca Estadi', 'escudos/mallorca.png', 'estadios/Mallorca.jpg', 'camisetas_local/camisetalocalMallorca.jpg', 'camisetas_visitante/camisetavisitanteMallorca.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Osasuna', 'El Sadar', 'escudos/osasuna.png', 'estadios/Osasuna.jpg', 'camisetas_local/camisetalocalOsasuna.jpg', 'camisetas_visitante/camisetavisitanteOsasuna.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Rayovallecano', 'Estadio de Vallecas', 'escudos/rayovallecano.png', 'estadios/RayoVallecano.jpg', 'camisetas_local/camisetalocalRayoVallecano.jpg', 'camisetas_visitante/camisetavisitanteRayoVallecano.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Realmadrid', 'Santiago Bernabéu', 'escudos/realmadrid.png', 'estadios/Madrid.jpg', 'camisetas_local/camisetalocalRealMadrid.jpg', 'camisetas_visitante/camisetavisitanteRealMadrid.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Realsociedad', 'Reale Arena', 'escudos/realsociedad.png', 'estadios/RealSociedad.jpg', 'camisetas_local/camisetalocalRealSociedad.jpg', 'camisetas_visitante/camisetavisitanteRealSociedad.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Sevilla', 'Ramón Sánchez-Pizjuán', 'escudos/sevilla.png', 'estadios/Sevilla.jpg', 'camisetas_local/camisetalocalSevilla.jpg', 'camisetas_visitante/camisetavisitanteSevilla.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Udlaspalmas', 'Estadio de Gran Canaria', 'escudos/udlaspalmas.png', 'estadios/GranCanarias.jpg', 'camisetas_local/camisetalocalUDLasPalmas.jpg', 'camisetas_visitante/camisetavisitanteUDLasPalmas.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Valencia', 'Mestalla', 'escudos/valencia.png', 'estadios/Valencia.jpg', 'camisetas_local/camisetalocalValencia.jpg', 'camisetas_visitante/camisetavisitanteValencia.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Valladolid', 'Estadio José Zorrilla', 'escudos/valladolid.png', 'estadios/Valladolid.jpg', 'camisetas_local/camisetalocalValladolid.jpg', 'camisetas_visitante/camisetavisitanteValladolid.jpg');
INSERT INTO Equipos (nombre, estadio, imagen_escudo, imagen_estadio, imagen_camiseta_local, imagen_camiseta_visitante) VALUES ('Villarreal', 'Estadio de la Cerámica', 'escudos/villarreal.png', 'estadios/Villarreal.jpg', 'camisetas_local/camisetalocalVillarreal.jpg', 'camisetas_visitante/camisetavisitanteVillarreal.jpg');

-- Nuevos partidos
INSERT INTO Partidos (fecha) VALUES
('2025-05-21'), -- Partido 2
('2025-05-22'), -- Partido 3
('2025-05-23'), -- Partido 4
('2025-05-24'), -- Partido 5
('2025-05-25'); -- Partido 6

-- Relación Juegan (id_partido, id_equipo, goles)
-- Partido 2: Betis vs Sevilla
INSERT INTO Juegan (id_partido, id_equipo, goles) VALUES
(2, 5, 1),
(2, 16, 1);

-- Partido 3: Valencia vs Villarreal
INSERT INTO Juegan (id_partido, id_equipo, goles) VALUES
(3, 18, 2),
(3, 20, 2);

-- Partido 4: Athletic vs Osasuna
INSERT INTO Juegan (id_partido, id_equipo, goles) VALUES
(4, 2, 3),
(4, 12, 0);

-- Partido 5: Atlético de Madrid vs Getafe
INSERT INTO Juegan (id_partido, id_equipo, goles) VALUES
(5, 3, 2),
(5, 8, 1);

-- Partido 6: Girona vs Celta
INSERT INTO Juegan (id_partido, id_equipo, goles) VALUES
(6, 9, 1),
(6, 6, 3);
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






