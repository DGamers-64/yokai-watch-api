DROP DATABASE IF EXISTS yokaidb;
CREATE DATABASE yokaidb;
USE yokaidb;

CREATE TABLE juego (
	id INT AUTO_INCREMENT PRIMARY KEY,
    abreviatura VARCHAR(8),
    nombre_completo VARCHAR(20),
    descripcion TEXT,
    fecha_de_lanzamiento DATE
);

CREATE TABLE habilidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    descripcion VARCHAR(60)
);

CREATE TABLE ataque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15),
    poder VARCHAR(6)
);

CREATE TABLE tecnica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15),
    poder VARCHAR(6),
    elemento VARCHAR(10)
);

CREATE TABLE espiritacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15),
    descripcion VARCHAR(50),
    poder VARCHAR(15)
);

CREATE TABLE animaximum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15),
    poder VARCHAR(6),
    descripcion VARCHAR(50)
);

CREATE TABLE tipo_comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_bolsillo INT,
    id_dentro INT
);

CREATE TABLE yokai (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
	nombre VARCHAR(30),
    medalla TEXT,
    modelo_3d TEXT,
    no_de_medallium INT,
    tribu VARCHAR(20),
    rango VARCHAR(5),
    bio TEXT,
    id_habilidad INT,
    id_ataque INT,
    id_tecnica INT,
    id_espiritacion INT,
    id_animaximum INT,
    id_comida_favorita INT,
    id_comida_odiada INT,
    fuego FLOAT,
    hielo FLOAT,
    tierra FLOAT,
    rayo FLOAT,
    agua FLOAT,
    viento FLOAT,
    id_drop_comun INT,
    prob_comun INT,
    id_drop_raro INT,
    prob_raro INT,
    dinero FLOAT,
    experiencia INT,
    blasters VARCHAR(15),
    huecos_obj INT,
	FOREIGN KEY (id_juego) REFERENCES juego(id),
    FOREIGN KEY (id_habilidad) REFERENCES habilidad(id),
    FOREIGN KEY (id_ataque) REFERENCES ataque(id),
    FOREIGN KEY (id_tecnica) REFERENCES tecnica(id),
    FOREIGN KEY (id_espiritacion) REFERENCES espiritacion(id),
    FOREIGN KEY (id_animaximum) REFERENCES animaximum(id),
    FOREIGN KEY (id_comida_favorita) REFERENCES tipo_comida(id),
    FOREIGN KEY (id_comida_odiada) REFERENCES tipo_comida(id),
    FOREIGN KEY (id_drop_comun) REFERENCES inventario(id),
    FOREIGN KEY (id_drop_raro) REFERENCES inventario(id)
);

CREATE TABLE forma_alt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_yokai INT,
    bando VARCHAR(20),
    modelo_3d TEXT,
    id_habilidad INT,
    FOREIGN KEY (id_yokai) REFERENCES yokai(id),
    FOREIGN KEY (id_habilidad) REFERENCES habilidad(id)
);
