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
    nombre VARCHAR(25) UNIQUE,
    poder INT,
    golpes INT
);

CREATE TABLE tecnica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) UNIQUE,
    poder VARCHAR(6),
    elemento VARCHAR(20)
);

CREATE TABLE espiritacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) UNIQUE,
    descripcion TEXT,
    objetivo VARCHAR(10),
    poder VARCHAR(15)
);

CREATE TABLE animaximum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) UNIQUE,
    poder INT,
    golpes INT,
    descripcion TEXT,
    elemento VARCHAR(20)
);

CREATE TABLE tipo_comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    tipo INT,
    imagen TEXT,
    FOREIGN KEY (tipo) REFERENCES tipo_comida(id)
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

INSERT INTO juego (abreviatura, nombre_completo, descripcion, fecha_de_lanzamiento) VALUES
    ("ykw1","Yo-Kai Watch 1","Yo-Kai Watch narra las aventuras de un niño, llamado Nate, que tiene un reloj especial que le alienta a descubrir seres misterios llamados Yo-Kai. Intentará averiguar por qué se comportan mal con la esperanza de poder hacerles entrar en razón.","2013-7-11"),
    ("ykw2","Yo-Kai Watch 2","El juego trata sobre las aventuras de Nathan Adams, un niño de 11 años al que le roban el reloj Yo-kai, junto a Whisper y Jibanyan, tendrán que adentrarse en el pasado para derrotar a Lady Desdicha, villana principal, y sus secuaces, los Yo-kai maléficos.","2014-7-10");

INSERT INTO habilidad (nombre, descripcion) VALUES
    ("Despreocupación","Recibe golpes críticos con más frecuencia."),
    ("Cuerpo afilado","Inflige daño por contacto al atacante."),
    ("Pulcritud","Los atributos bajan cuando está espiritado."),
    ("Currante","Recibe más puntos de experiencia."),
    ("Espera Leonina","No hace nada durante uno o dos turnos."),
    ("Incordio","Puede atacar a un aliado."),
    ("Caza de Espadas","Aumenta el poder cada vez que derrotan a un aliado."),
    ("Piel Suave","Mejora la defensa tras infligir un golpe crítico."),
    ("Rechupeteo","Purifica a los aliados contiguos."),
    ("Arroz Veloz","Los ataques del Yo-kai harán más daño a los oni."),
    ("Bola de Arroz","Se recupera una vez cuando tiene pocos PV."),
    ("Cortafuegos","Inmune a los ataques de fuego."),
    ("Espiridefensa","La debilidad elemental se anula al estar en guardia."),
    ("Lodazal","Al perder, se venga del enemigo."),
    ("Cien Flexiones","Aumenta la FUE de todos los Yo-kai contiguos."),
    ("Ímpetu de Fuego","Aumenta el poder al caer un aliado.");

INSERT INTO ataque (nombre, poder, golpes) VALUES
    ("Pelmapunzadas",15,1),
    ("Multipuñalada",12,3),
    ("Corte Doble",18,2),
    ("Pulverizador",100,1),
    ("Puñetazo",15,1),
    ("Tajo Luminoso",20,3),
    ("Puños Poderosos",50,1),
    ("Lengüetada",50,1),
    ("Cabezazo",55,1),
    ("Lluvia Punzante",10,5),
    ("Puñetazo Preciso",90,1);

INSERT INTO tecnica (nombre, poder, elemento) VALUES
    ("Ascuas",20,"Fuego"),
    ("Guijarro",20,"Tierra"),
    ("Torbellino",20,"Viento"),
    ("Granizo",20,"Hielo"),
    ("Helada",50,"Hielo"),
    ("Chispa",20,"Rayo"),
    ("Sanación",20,"Cura"),
    ("Llamarada",50,"Fuego"),
    ("Relámpago",50,"Rayo"),
    ("Absorción",50,"Segavidas"),
    ("Desprendimiento",50,"Tierra");

INSERT INTO espiritacion (nombre, descripcion, objetivo, poder) VALUES
    ("A la Ligera","Hace que el Yo-kai se tome todo a la ligera","Enemigo","Defensa"),
    ("Sin Defensa","Deja a un Yo-kai indefenso y... reduce su DEF. ¡Obvio!","Enemigo","Defensa"),
    ("Atrevimiento","¡Mejora la VEL de un aliado al hacerlo atrevido!","Aliado","Velocidad"),
    ("Dejadez","Hace que el Yo-kai pierda su motivación y vaguee más.","Enemigo","Vagueo"),
    ("Pereza","Hace que los enemigos se vuelvan perezosos y absorbe su FUE.","Enemigo","Fuerza"),
    ("Lavado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado","Cura"),
    ("Aseado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado","Cura"),
    ("Leonizado","El poder de un león surge en el Yo-kai espiritado. Aumenta su FUE.","Aliado","Fuerza"),
    ("Pataleta","El Yo-kai espiritado, enfadado por todo, ataca a sus aliados.","Enemigo","Confusión"),
    ("Berserk","Un rival pierde el control y ataca a sus aliados.","Enemigo","Confusión"),
    ("Atemorizar","Hace que un enemigo le tenga tanto miedo que no se pueda mover.","Enemigo","Bloqueo"),
    ("Poder Mochi","Aumenta la FUE de un aliado gracias al poder del sabroso mochi.","Aliado","Fuerza"),
    ("Celos","¡Hace que un rival sienta celos de sus aliados y los ataque!","Enemigo","Confusión"),
    ("Lametazo Letal","Chupa al Yo-kai espiritado y evita que actúe al sentirse fatal.","Enemigo","Bloqueo"),
    ("Superaperitivo","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado","Fuerza"),
    ("Megapiscolabis","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado","Fuerza"),
    ("Yelmodefensa","Aumenta la DEF de un aliado... ¡como si este llevase un casco!","Aliado","Defensa"),
    ("Maldición Noble","Disminuye el ESP de un rival con el poder de un caballero no muerto.","Enemigo","Espíritu"),
    ("Maleficio Infernal","Reduce el ESP de un rival mediante un poder extraño del averno.","Enemigo","Espíritu"),
    ("Barro Movedizo","El Yo-kai espiritado pierde PV al enfadarse por un campo de arroz.","Enemigo","Veneno"),
    ("Arrebato","El Yo-kai espiritado mejora todos sus atributos en el Campamento Capi-Cachas.","Aliado","Todo"),
    ("Avivar","Hace que el corazón de un aliado arda con pasión y mejora su FUE","Aliado","Fuerza");

INSERT INTO animaximum (nombre, poder, golpes, descripcion, elemento) VALUES
    ("Palillo Puntiagudo",18,5,"Pincha a sus enemigos con su querido palillo.","Físico"),
    ("Lluvia de Palillos",20,7,"Descarga mil pinchazos sobre sus enemigos con su querido palillo.","Físico"),
    ("Corte Profundo",155,1,"Corta a un enemigo con seguridad e inflige mucho daño.","Físico"),
    ("Tajo Desganado",20,5,"Rebana a sus enemigos mientras se ríe en sus caras.","Físico"),
    ("Ráfaga Resignada",20,7,"Se apresura a la batalla y da vueltas mientras rebana a sus enemigos.","Físico"),
    ("Golpe Fantasma",155,1,"Rebana a un enemigo con su pelo. O falla o inflige un gran daño.","Físico"),
    ("Círculo Puro",0,0,"Usa su cepilo para frotar a sus aliados hasta que estén bien limpios.","Purificación"),
    ("Pulverización",70,1,"Limpia a sus aliados con su pistola rociadora y restaura sus PV.","Cura"),
    ("Uñas y Dientes",16,5,"Da una buena paliza a sus enemigos a base de guantazos.","Físico"),
    ("Espada Félida",28,8,"Espera el momento perfecto para asestar un mandoble a sus enemigos","Físico"),
    ("Corte Rabioso",18,5,"En un ataque de rabia, zarandea su esplada y golpea a los enemigos.","Físico"),
    ("Tajo Osfurio",20,10,"Pierde el control con sus espadas y corta a todos sus rivales.","Físico"),
    ("Corre que te Pillo",22,10,"Pierde el control con sus espadas y corta a todos sus rivales.","Físico"),
    ("Puñetazo Mochi",105,1,"Se infla y derriba al oponente de un gran golpe.","Físico"),
    ("Machipuñetazo",120,1,"Se infla y derriba al oponente de un gran golpe.","Físico"),
    ("Lametazo",40,3,"Extiende su larga lengua y daña a todos los rivales.","Físico"),
    ("Tajo Arrocero",120,1,"Da un salto y suelta un mandoble contra un rival.","Físico"),
    ("Tajo Tostado",180,1,"Da un salto y suelta un mandoble contra un rival.","Físico"),
    ("Yelmocoraza",0,0,"Da una orden que aumenta la moral y la DEF de los aliados.","Aumenta defensa"),
    ("Tajo del Caballero",130,1,"Saca su espada y ataca a todos los enemigos de solo un golpe.","Físico"),
    ("Billete al Hades",135,1,"Corta a sus enemigos. O falla o inflige un gran daño","Físico"),
    ("Truco Sucio",100,1,"Concentra su ira en atacar a sus enemigos y quitarles su FUE.","Físico"),
    ("¡Victoriaaa!",0,0,"Mejora todos los atributos de los aliados tras un tiempo en su campamento.","Aumenta todo"),
    ("Puño Abrasador",60,1,"Quema a sus enemigos con el poder llameante de su espíritu de lucha.","Fuego");