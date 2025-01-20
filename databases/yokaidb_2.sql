-- DECLARACIÓN BASE DE DATOS

DROP DATABASE IF EXISTS yokaidb_2;
CREATE DATABASE yokaidb_2;
USE yokaidb_2;

-- VARIABLES

SET @png = ".png";
SET @linkComida = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/";
SET @linkObjeto = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/objeto/";
SET @linkMedalla = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/medallas/";

-- TABLAS

CREATE TABLE habilidad (
    nombre VARCHAR(30) PRIMARY KEY,
    descripcion VARCHAR(60)
);

CREATE TABLE ataque (
    nombre VARCHAR(25) PRIMARY KEY,
    poder INT,
    golpes INT
);

CREATE TABLE tecnica (
    nombre VARCHAR(25) PRIMARY KEY,
    poder VARCHAR(6),
    elemento VARCHAR(20)
);

CREATE TABLE espiritacion (
    nombre VARCHAR(25) PRIMARY KEY,
    descripcion TEXT,
    objetivo VARCHAR(10)
);

CREATE TABLE animaximum (
    nombre VARCHAR(25) PRIMARY KEY,
    descripcion TEXT,
    poder INT,
    golpes INT
);

CREATE TABLE comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    tipo VARCHAR(20),
    imagen TEXT
);

CREATE TABLE objeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    imagen TEXT
);

CREATE TABLE localizacion (
    nombre VARCHAR(50) PRIMARY KEY,
    zona VARCHAR(30)
);

CREATE TABLE inventario (
    nombre VARCHAR(50) PRIMARY KEY,
    bolsillo VARCHAR(15),
    id_interior INT
);

-- TODO: CREATE TABLE BOLSILLOS DEL INVENTARIO

CREATE TABLE yokai (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30),
    medalla TEXT,
    tribu VARCHAR(20),
    rango VARCHAR(5),
    bio TEXT,
    habilidad VARCHAR(30),
    ataque VARCHAR(25),
    tecnica VARCHAR(25),
    espiritacion VARCHAR(25),
    animaximum VARCHAR(25),
    comida_favorita VARCHAR(20),
    comida_odiada VARCHAR(20),
    blasters VARCHAR(15),
    drop_comun VARCHAR(50),
    prob_comun INT,
    drop_raro VARCHAR(50),
    prob_raro INT,
    dinero FLOAT,
    experiencia INT,
    huecos_obj INT,
    fuego FLOAT,
    hielo FLOAT,
    tierra FLOAT,
    rayo FLOAT,
    agua FLOAT,
    viento FLOAT,
    FOREIGN KEY (habilidad) REFERENCES habilidad(nombre),
    FOREIGN KEY (ataque) REFERENCES ataque(nombre),
    FOREIGN KEY (tecnica) REFERENCES tecnica(nombre),
    FOREIGN KEY (espiritacion) REFERENCES espiritacion(nombre),
    FOREIGN KEY (animaximum) REFERENCES animaximum(nombre),
    FOREIGN KEY (drop_comun) REFERENCES inventario(nombre),
    FOREIGN KEY (drop_raro) REFERENCES inventario(nombre)
);

CREATE TABLE forma_alt (
    id_yokai INT PRIMARY KEY,
    bando VARCHAR(20),
    habilidad VARCHAR(30),
    FOREIGN KEY (id_yokai) REFERENCES yokai(id),
    FOREIGN KEY (habilidad) REFERENCES habilidad(nombre)
);

CREATE TABLE yokai_localizacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    yokai INT,
    localizacion VARCHAR(50),
    anotaciones VARCHAR(50),
    FOREIGN KEY (yokai) REFERENCES yokai(id),
    FOREIGN KEY (localizacion) REFERENCES localizacion(nombre)
);

CREATE TABLE objetos_localizacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    localizacion VARCHAR(50),
    anotaciones VARCHAR(50),
    precio FLOAT,
    FOREIGN KEY (nombre) REFERENCES inventario(nombre),
    FOREIGN KEY (localizacion) REFERENCES localizacion(nombre)
);

-- INSERTADO DE DATOS

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

INSERT INTO espiritacion (nombre, descripcion, objetivo) VALUES
    ("A la Ligera","Hace que el Yo-kai se tome todo a la ligera","Enemigo"),
    ("Sin Defensa","Deja a un Yo-kai indefenso y... reduce su DEF. ¡Obvio!","Enemigo"),
    ("Atrevimiento","¡Mejora la VEL de un aliado al hacerlo atrevido!","Aliado"),
    ("Dejadez","Hace que el Yo-kai pierda su motivación y vaguee más.","Enemigo"),
    ("Pereza","Hace que los enemigos se vuelvan perezosos y absorbe su FUE.","Enemigo"),
    ("Lavado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado"),
    ("Aseado","Restaura un poco de PV al Yo-kai espiritado con un poder puro y limpio.","Aliado"),
    ("Leonizado","El poder de un león surge en el Yo-kai espiritado. Aumenta su FUE.","Aliado"),
    ("Pataleta","El Yo-kai espiritado, enfadado por todo, ataca a sus aliados.","Enemigo"),
    ("Berserk","Un rival pierde el control y ataca a sus aliados.","Enemigo"),
    ("Atemorizar","Hace que un enemigo le tenga tanto miedo que no se pueda mover.","Enemigo"),
    ("Poder Mochi","Aumenta la FUE de un aliado gracias al poder del sabroso mochi.","Aliado"),
    ("Celos","¡Hace que un rival sienta celos de sus aliados y los ataque!","Enemigo"),
    ("Lametazo Letal","Chupa al Yo-kai espiritado y evita que actúe al sentirse fatal.","Enemigo"),
    ("Superaperitivo","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado"),
    ("Megapiscolabis","La FUE del Yo-kai espiritado aumenta con el delicioso poder del arroz.","Aliado"),
    ("Yelmodefensa","Aumenta la DEF de un aliado... ¡como si este llevase un casco!","Aliado"),
    ("Maldición Noble","Disminuye el ESP de un rival con el poder de un caballero no muerto.","Enemigo"),
    ("Maleficio Infernal","Reduce el ESP de un rival mediante un poder extraño del averno.","Enemigo"),
    ("Barro Movedizo","El Yo-kai espiritado pierde PV al enfadarse por un campo de arroz.","Enemigo"),
    ("Arrebato","El Yo-kai espiritado mejora todos sus atributos en el Campamento Capi-Cachas.","Aliado"),
    ("Avivar","Hace que el corazón de un aliado arda con pasión y mejora su FUE","Aliado");

INSERT INTO animaximum (nombre, poder, golpes, descripcion) VALUES
    ("Palillo Puntiagudo",18,5,"Pincha a sus enemigos con su querido palillo."),
    ("Lluvia de Palillos",20,7,"Descarga mil pinchazos sobre sus enemigos con su querido palillo."),
    ("Corte Profundo",155,1,"Corta a un enemigo con seguridad e inflige mucho daño."),
    ("Tajo Desganado",20,5,"Rebana a sus enemigos mientras se ríe en sus caras."),
    ("Ráfaga Resignada",20,7,"Se apresura a la batalla y da vueltas mientras rebana a sus enemigos."),
    ("Golpe Fantasma",155,1,"Rebana a un enemigo con su pelo. O falla o inflige un gran daño."),
    ("Círculo Puro",NULL,NULL,"Usa su cepilo para frotar a sus aliados hasta que estén bien limpios."),
    ("Pulverización",70,1,"Limpia a sus aliados con su pistola rociadora y restaura sus PV."),
    ("Uñas y Dientes",16,5,"Da una buena paliza a sus enemigos a base de guantazos."),
    ("Espada Félida",28,8,"Espera el momento perfecto para asestar un mandoble a sus enemigos"),
    ("Corte Rabioso",18,5,"En un ataque de rabia, zarandea su esplada y golpea a los enemigos."),
    ("Tajo Osfurio",20,10,"Pierde el control con sus espadas y corta a todos sus rivales."),
    ("Corre que te Pillo",22,10,"Pierde el control con sus espadas y corta a todos sus rivales."),
    ("Puñetazo Mochi",105,1,"Se infla y derriba al oponente de un gran golpe."),
    ("Machipuñetazo",120,1,"Se infla y derriba al oponente de un gran golpe."),
    ("Lametazo",40,3,"Extiende su larga lengua y daña a todos los rivales."),
    ("Tajo Arrocero",120,1,"Da un salto y suelta un mandoble contra un rival."),
    ("Tajo Tostado",180,1,"Da un salto y suelta un mandoble contra un rival."),
    ("Yelmocoraza",NULL,NULL,"Da una orden que aumenta la moral y la DEF de los aliados."),
    ("Tajo del Caballero",130,1,"Saca su espada y ataca a todos los enemigos de solo un golpe."),
    ("Billete al Hades",135,1,"Corta a sus enemigos. O falla o inflige un gran daño"),
    ("Truco Sucio",100,1,"Concentra su ira en atacar a sus enemigos y quitarles su FUE."),
    ("¡Victoriaaa!",NULL,NULL,"Mejora todos los atributos de los aliados tras un tiempo en su campamento."),
    ("Puño Abrasador",60,1,"Quema a sus enemigos con el poder llameante de su espíritu de lucha.");

-- ("Arroz"),("Pan"),("Chuches"),("Lácteos"),("Hamburguesas"),("Ramen"),("Comida China"),("Verduras"),("Carne"),("Pescado"),("Aperitivos"),("Fideos"),("Chocobarritas"),("Postre"),("Productos cocidos")

INSERT INTO comida (nombre, tipo, imagen) VALUES
    ("Arroz con ciruelas","Arroz",CONCAT(@linkComida, "1", @png)),
    ("Arroz en hoja de col","Arroz",CONCAT(@linkComida, "2", @png)),
    ("Arroz con huevas","Arroz",CONCAT(@linkComida, "3", @png)),
    ("Arroz con gambas","Arroz",CONCAT(@linkComida, "4", @png)),
    ("Atún selecto","Pescado",CONCAT(@linkComida, "46", @png)),
    ("Baguette","Pan",CONCAT(@linkComida, "7", @png)),
    ("Bollo con crema","Pan",CONCAT(@linkComida, "6", @png)),
    ("Brochetas de carne","Productos cocidos",CONCAT(@linkComida, "68", @png)),
    ("Brote de bambú","Verduras",CONCAT(@linkComida, "37", @png)),
    ("Caballa en salazón","Pescado",CONCAT(@linkComida, "43", @png)),
    ("Café con leche","Lácteos",CONCAT(@linkComida, "16", @png)),
    ("Caramelo pegajoso","Chuches",CONCAT(@linkComida, "10", @png)),
    ("Caramelos de frutas","Chuches",CONCAT(@linkComida, "12", @png)),
    ("Carnanibollo","Postre",CONCAT(@linkComida, "74", @png)),
    ("Carne veteada","Carne",CONCAT(@linkComida, "42", @png)),
    ("Chicle de 10","Chuches",CONCAT(@linkComida, "9", @png)),
    ("Chocobarrita","Chocobarritas",CONCAT(@linkComida, "72", @png));
INSERT INTO objeto (nombre, imagen) VALUES
    ("Exporbe S",CONCAT(@linkObjeto, "60", @png)),
    ("Pulsera de fuego",CONCAT(@linkObjeto, "61", @png));
INSERT INTO inventario (nombre, bolsillo, id_interior)
    SELECT nombre, 'Comida', id FROM comida
    UNION
    SELECT nombre, 'Objeto', id FROM objeto;
INSERT INTO yokai (nombre,medalla,tribu,rango,bio,habilidad,ataque,tecnica,animaximum,espiritacion,comida_favorita,comida_odiada,blasters,drop_comun,prob_comun,drop_raro,prob_raro,dinero,experiencia,huecos_obj,fuego,hielo,tierra,rayo,agua,viento) VALUES
    ("Alcaldero",CONCAT(@linkMedalla, "1", @png),"Valiente","E","Un Yo-kai descuidado que solo lleva un taparrabos y una sartén en la cabeza. No intentes imitarlo.","Despreocupación","Pelmapunzadas","Ascuas","Palillo Puntiagudo","A la Ligera","Arroz","Pan","Luchador","Arroz con ciruelas",45,"Exporbe S",17,0.07,28,1,0.7,1,1,1,1.3,1),
    ("Sinná",CONCAT(@linkMedalla,"2",@png),"Valiente","C","Al quitarse la sartén, Sinná está desprotegido ante el mundo. Pero no le verás ni un moratón en el cuerpo ni expresar dolor.","Despreocupación","Multipuñalada","Ascuas","Lluvia de Palillos","Sin Defensa","Arroz","Pan","Luchador","Arroz en hoja de col",55,"Pulsera de fuego",16,0.16,32,1,0.5,1,1,1,1.5,1);
INSERT INTO localizacion (nombre, zona) VALUES
    ("La pasarela", "Floridablanca Norte"),
    ("Floridablanca Norte", "Floridablanca Norte"),
    ("Expresso", "Gerageralandia"),
    ("Superhíper Norte", "Floridablanca Norte");
INSERT INTO yokai_localizacion (yokai, localizacion, anotaciones) VALUES
    (1, "La pasarela", NULL),
    (1, "Floridablanca Norte", "Hierba"),
    (1, "Floridablanca Norte", "Bajo los coches"),
    (2, "Expresso", "Rango C"),
    (2, "Expresso", "Valiente");
INSERT INTO objetos_localizacion (nombre, localizacion, anotaciones, precio) VALUES
    ("Arroz con ciruelas", "Superhíper Norte", "Precio anterior a preguntabla Abuzampa",1.00),
    ("Arroz con ciruelas", "Superhíper Norte", "Precio posterior a preguntabla Abuzampa",0.70);