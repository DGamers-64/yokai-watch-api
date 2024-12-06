DROP DATABASE IF EXISTS yokaidb_2;
CREATE DATABASE yokaidb_2;
USE yokaidb_2;

CREATE TABLE juego (
	id INT AUTO_INCREMENT PRIMARY KEY,
    abreviatura VARCHAR(8),
    nombre_completo VARCHAR(20),
    descripcion TEXT,
    fecha_de_lanzamiento DATE
);

CREATE TABLE habilidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(30),
    descripcion VARCHAR(60),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE ataque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(25) UNIQUE,
    poder INT,
    golpes INT,
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE tecnica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(25) UNIQUE,
    poder VARCHAR(6),
    elemento VARCHAR(20),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE espiritacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(25) UNIQUE,
    descripcion TEXT,
    objetivo VARCHAR(10),
    poder VARCHAR(15),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE animaximum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(25) UNIQUE,
    poder INT,
    golpes INT,
    descripcion TEXT,
    elemento VARCHAR(20),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE tipo_comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(20),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    nombre VARCHAR(25),
    tipo INT,
    imagen TEXT,
    FOREIGN KEY (tipo) REFERENCES tipo_comida(id),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT,
    bolsillo VARCHAR(15),
    id_interior INT,
	FOREIGN KEY (id_juego) REFERENCES juego(id)
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
    id_juego INT,
    id_yokai INT,
    bando VARCHAR(20),
    modelo_3d TEXT,
    id_habilidad INT,
    FOREIGN KEY (id_yokai) REFERENCES yokai(id),
    FOREIGN KEY (id_habilidad) REFERENCES habilidad(id),
	FOREIGN KEY (id_juego) REFERENCES juego(id)
);

INSERT INTO juego (abreviatura, nombre_completo, descripcion, fecha_de_lanzamiento) VALUES
    ("ykw1","Yo-Kai Watch 1","Yo-Kai Watch narra las aventuras de un niño, llamado Nate, que tiene un reloj especial que le alienta a descubrir seres misterios llamados Yo-Kai. Intentará averiguar por qué se comportan mal con la esperanza de poder hacerles entrar en razón.","2013-7-11"),
    ("ykw2","Yo-Kai Watch 2","El juego trata sobre las aventuras de Nathan Adams, un niño de 11 años al que le roban el reloj Yo-kai, junto a Whisper y Jibanyan, tendrán que adentrarse en el pasado para derrotar a Lady Desdicha, villana principal, y sus secuaces, los Yo-kai maléficos.","2014-7-10");

INSERT INTO habilidad (id_juego, nombre, descripcion) VALUES
    (2,"Despreocupación","Recibe golpes críticos con más frecuencia."),
    (2,"Cuerpo afilado","Inflige daño por contacto al atacante."),
    (2,"Pulcritud","Los atributos bajan cuando está espiritado."),
    (2,"Currante","Recibe más puntos de experiencia."),
    (2,"Espera Leonina","No hace nada durante uno o dos turnos."),
    (2,"Incordio","Puede atacar a un aliado."),
    (2,"Caza de Espadas","Aumenta el poder cada vez que derrotan a un aliado."),
    (2,"Piel Suave","Mejora la defensa tras infligir un golpe crítico."),
    (2,"Rechupeteo","Purifica a los aliados contiguos."),
    (2,"Arroz Veloz","Los ataques del Yo-kai harán más daño a los oni."),
    (2,"Bola de Arroz","Se recupera una vez cuando tiene pocos PV."),
    (2,"Cortafuegos","Inmune a los ataques de fuego."),
    (2,"Espiridefensa","La debilidad elemental se anula al estar en guardia."),
    (2,"Lodazal","Al perder, se venga del enemigo."),
    (2,"Cien Flexiones","Aumenta la FUE de todos los Yo-kai contiguos."),
    (2,"Ímpetu de Fuego","Aumenta el poder al caer un aliado.");

INSERT INTO ataque (id_juego, nombre, poder, golpes) VALUES
    (2,"Pelmapunzadas",15,1),
    (2,"Multipuñalada",12,3),
    (2,"Corte Doble",18,2),
    (2,"Pulverizador",100,1),
    (2,"Puñetazo",15,1),
    (2,"Tajo Luminoso",20,3),
    (2,"Puños Poderosos",50,1),
    (2,"Lengüetada",50,1),
    (2,"Cabezazo",55,1),
    (2,"Lluvia Punzante",10,5),
    (2,"Puñetazo Preciso",90,1);

INSERT INTO tecnica (id_juego, nombre, poder, elemento) VALUES
    (2,"Ascuas",20,"Fuego"),
    (2,"Guijarro",20,"Tierra"),
    (2,"Torbellino",20,"Viento"),
    (2,"Granizo",20,"Hielo"),
    (2,"Helada",50,"Hielo"),
    (2,"Chispa",20,"Rayo"),
    (2,"Sanación",20,"Cura"),
    (2,"Llamarada",50,"Fuego"),
    (2,"Relámpago",50,"Rayo"),
    (2,"Absorción",50,"Segavidas"),
    (2,"Desprendimiento",50,"Tierra");

INSERT INTO espiritacion (id_juego, nombre, descripcion, objetivo, poder) VALUES
    (2,"A la Ligera","Hace que el Yo-kai se tome todo a la ligera","Enemigo","Defensa"),
    (2,"Sin Defensa","Deja a un Yo-kai indefenso y... reduce su DEF. ¡Obvio!","Enemigo","Defensa"),
    (2,"Atrevimiento","¡Mejora la VEL de un aliado al hacerlo atrevido!","Aliado","Velocidad"),
    (2,"Dejadez","Hace que el Yo-kai pierda su motivación y vaguee más.","Enemigo","Vagueo"),
    (2,"Pereza","Hace que los enemigos se vuelvan perezosos y absorbe su FUE.","Enemigo","Fuerza"),
    (2,"Lavado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado","Cura"),
    (2,"Aseado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado","Cura"),
    (2,"Leonizado","El poder de un león surge en el Yo-kai espiritado. Aumenta su FUE.","Aliado","Fuerza"),
    (2,"Pataleta","El Yo-kai espiritado, enfadado por todo, ataca a sus aliados.","Enemigo","Confusión"),
    (2,"Berserk","Un rival pierde el control y ataca a sus aliados.","Enemigo","Confusión"),
    (2,"Atemorizar","Hace que un enemigo le tenga tanto miedo que no se pueda mover.","Enemigo","Bloqueo"),
    (2,"Poder Mochi","Aumenta la FUE de un aliado gracias al poder del sabroso mochi.","Aliado","Fuerza"),
    (2,"Celos","¡Hace que un rival sienta celos de sus aliados y los ataque!","Enemigo","Confusión"),
    (2,"Lametazo Letal","Chupa al Yo-kai espiritado y evita que actúe al sentirse fatal.","Enemigo","Bloqueo"),
    (2,"Superaperitivo","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado","Fuerza"),
    (2,"Megapiscolabis","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado","Fuerza"),
    (2,"Yelmodefensa","Aumenta la DEF de un aliado... ¡como si este llevase un casco!","Aliado","Defensa"),
    (2,"Maldición Noble","Disminuye el ESP de un rival con el poder de un caballero no muerto.","Enemigo","Espíritu"),
    (2,"Maleficio Infernal","Reduce el ESP de un rival mediante un poder extraño del averno.","Enemigo","Espíritu"),
    (2,"Barro Movedizo","El Yo-kai espiritado pierde PV al enfadarse por un campo de arroz.","Enemigo","Veneno"),
    (2,"Arrebato","El Yo-kai espiritado mejora todos sus atributos en el Campamento Capi-Cachas.","Aliado","Todo"),
    (2,"Avivar","Hace que el corazón de un aliado arda con pasión y mejora su FUE","Aliado","Fuerza");

INSERT INTO animaximum (id_juego, nombre, poder, golpes, descripcion, elemento) VALUES
    (2,"Palillo Puntiagudo",18,5,"Pincha a sus enemigos con su querido palillo.","Físico"),
    (2,"Lluvia de Palillos",20,7,"Descarga mil pinchazos sobre sus enemigos con su querido palillo.","Físico"),
    (2,"Corte Profundo",155,1,"Corta a un enemigo con seguridad e inflige mucho daño.","Físico"),
    (2,"Tajo Desganado",20,5,"Rebana a sus enemigos mientras se ríe en sus caras.","Físico"),
    (2,"Ráfaga Resignada",20,7,"Se apresura a la batalla y da vueltas mientras rebana a sus enemigos.","Físico"),
    (2,"Golpe Fantasma",155,1,"Rebana a un enemigo con su pelo. O falla o inflige un gran daño.","Físico"),
    (2,"Círculo Puro",0,0,"Usa su cepilo para frotar a sus aliados hasta que estén bien limpios.","Purificación"),
    (2,"Pulverización",70,1,"Limpia a sus aliados con su pistola rociadora y restaura sus PV.","Cura"),
    (2,"Uñas y Dientes",16,5,"Da una buena paliza a sus enemigos a base de guantazos.","Físico"),
    (2,"Espada Félida",28,8,"Espera el momento perfecto para asestar un mandoble a sus enemigos","Físico"),
    (2,"Corte Rabioso",18,5,"En un ataque de rabia, zarandea su esplada y golpea a los enemigos.","Físico"),
    (2,"Tajo Osfurio",20,10,"Pierde el control con sus espadas y corta a todos sus rivales.","Físico"),
    (2,"Corre que te Pillo",22,10,"Pierde el control con sus espadas y corta a todos sus rivales.","Físico"),
    (2,"Puñetazo Mochi",105,1,"Se infla y derriba al oponente de un gran golpe.","Físico"),
    (2,"Machipuñetazo",120,1,"Se infla y derriba al oponente de un gran golpe.","Físico"),
    (2,"Lametazo",40,3,"Extiende su larga lengua y daña a todos los rivales.","Físico"),
    (2,"Tajo Arrocero",120,1,"Da un salto y suelta un mandoble contra un rival.","Físico"),
    (2,"Tajo Tostado",180,1,"Da un salto y suelta un mandoble contra un rival.","Físico"),
    (2,"Yelmocoraza",0,0,"Da una orden que aumenta la moral y la DEF de los aliados.","Aumenta defensa"),
    (2,"Tajo del Caballero",130,1,"Saca su espada y ataca a todos los enemigos de solo un golpe.","Físico"),
    (2,"Billete al Hades",135,1,"Corta a sus enemigos. O falla o inflige un gran daño","Físico"),
    (2,"Truco Sucio",100,1,"Concentra su ira en atacar a sus enemigos y quitarles su FUE.","Físico"),
    (2,"¡Victoriaaa!",0,0,"Mejora todos los atributos de los aliados tras un tiempo en su campamento.","Aumenta todo"),
    (2,"Puño Abrasador",60,1,"Quema a sus enemigos con el poder llameante de su espíritu de lucha.","Fuego");

INSERT INTO tipo_comida (id_juego, nombre) VALUES
    (2,"Arroz"),
    (2,"Pan"),
    (2,"Chuches"),
    (2,"Lácteos"),
    (2,"Hamburguesas"),
    (2,"Ramen"),
    (2,"Comida China"),
    (2,"Verduras"),
    (2,"Carne"),
    (2,"Pescado"),
    (2,"Aperitivos"),
    (2,"Fideos"),
    (2,"Chocobarritas"),
    (2,"Postre"),
    (2,"Productos cocidos")

INSERT INTO comida (id_juego, nombre, tipo, imagen) VALUES
    (2,"Arroz con ciruelas",1,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/1.png"),
    (2,"Arroz en hoja de col",1,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/2.png"),
    (2,"Arroz con huevas",1,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/3.png"),
    (2,"Arroz con gambas",1,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/4.png"),
    (2,"Atún selecto",10,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/46.png"),
    (2,"Baguette",2,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/7.png"),
    (2,"Bollo con crema",2,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/6.png"),
    (2,"Brochetas de carne",15,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/68.png"),
    (2,"Brote de bambú",8,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/37.png"),
    (2,"Caballa en salazón",10,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/43.png"),
    (2,"Café con leche",4,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/16.png"),
    (2,"Caramelo pegajoso",3,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/10.png"),
    (2,"Caramelos de frutas",3,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/12.png"),
    (2,"Carnanibollo",14,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/74.png"),
    (2,"Carne veteada",9,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/42.png"),
    (2,"Chicle de 10",3,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/9.png"),
    (2,"Chocobarrita",13,"https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/72.png");

INSERT INTO inventario (id_juego, bolsillo, id_interior) VALUES
    (2,"Comida",1),
    (2,"Comida",2),
    (2,"Comida",3),
    (2,"Comida",4),
    (2,"Comida",5),
    (2,"Comida",6),
    (2,"Comida",7),
    (2,"Comida",8),
    (2,"Comida",9),
    (2,"Comida",10),
    (2,"Comida",11),
    (2,"Comida",12),
    (2,"Comida",13),
    (2,"Comida",14),
    (2,"Comida",15),
    (2,"Comida",16);

INSERT INTO yokai (id_juego, nombre, medalla, modelo_3d, no_de_medallium, tribu, rango, bio, id_habilidad, id_ataque, id_tecnica, id_espiritacion, id_animaximum, id_comida_favorita, id_comida_odiada, fuego, hielo, tierra, rayo, agua, viento, id_drop_comun, prob_comun, id_drop_raro, prob_raro, dinero, experiencia, blasters, huecos_obj) VALUES
    (2,"Alcaldero","https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/medallas/1.png","https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/medallas/1.png",1,"Valiente","E","Un Yo-kai descuidado que solo lleva un taparrabos y una sartén en la cabeza. No intentes imitarlo.",1,1,1,1,1,1,2,0.7,1.0,1.0,1.0,1.3,1.0,1,45,2,17,0.07,28,"Luchador",1); -- A CAMBIAR LINK A MODELO 3D Y DROP RARO