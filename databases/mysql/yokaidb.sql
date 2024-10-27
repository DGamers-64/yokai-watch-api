DROP DATABASE IF EXISTS yokaidb;
CREATE DATABASE yokaidb;
USE yokaidb;

CREATE TABLE game (
	id INT AUTO_INCREMENT PRIMARY KEY,
    abreviatura VARCHAR(8),
    nombre_completo VARCHAR(20),
    descripcion TEXT,
    fecha_de_lanzamiento DATE
);

CREATE TABLE yokai (
	id INT AUTO_INCREMENT PRIMARY KEY,
    game INT,
	nombre VARCHAR(30),
    
    
    pv INT,
    fue INT,
    esp INT,
    def INT,
    vel INT,
    huecos_obj INT,
    no_de_medallium INT,
    tribu VARCHAR(20),
    rango VARCHAR(5),
	FOREIGN KEY (game) REFERENCES game(id)
);

INSERT INTO game (abreviatura, fecha_de_lanzamiento, nombre_completo, descripcion) VALUES
	('ykw1', '2013-7-11', 'Yo-Kai Watch 1', 'Yo-Kai Watch narra las aventuras de un niño, llamado Nate, que tiene un reloj especial que le alienta a descubrir seres misterios llamados Yo-Kai. Intentará averiguar por qué se comportan mal con la esperanza de poder hacerles entrar en razón.'),
    ('ykw2', '2014-7-10', 'Yo-Kai Watch 2', 'El juego trata sobre las aventuras de Nathan Adams, un niño de 11 años al que le roban el reloj Yo-kai, junto a Whisper y Jibanyan, tendrán que adentrarse en el pasado para derrotar a Lady Desdicha, villana principal, y sus secuaces, los Yo-kai maléficos.');

INSERT INTO yokai (game, nombre, pv, fue, esp, def, vel, huecos_obj, no_de_medallium, tribu, rango) VALUES
	(1, 'Alcaldero', 319, 136, 95, 85, 131, 1, 1, 'Valiente', 'E'),
    (2, 'Alcaldero', 319, 160, 70, 82, 130, 1, 1, 'Valiente', 'E'),
    (2, 'Sinná', 378, 189, 84, 89, 150, 1, 2, 'Valiente', 'C');

SELECT * FROM game;
SELECT * FROM yokai;