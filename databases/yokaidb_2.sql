-- DECLARACIÓN BASE DE DATOS

DROP DATABASE IF EXISTS yokaidb_2;
CREATE DATABASE yokaidb_2;
USE yokaidb_2;

-- VARIABLES

SET @png = ".png";
SET @linkComida = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/comida/";
SET @linkObjeto = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/objeto/";
SET @linkMedalla = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/medallas/";
SET @linkEquipamiento = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/equipamiento/";
SET @linkAnimal = "https://raw.githubusercontent.com/DGamers-64/yokai-watch-api/refs/heads/master/img/items/animal/";

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

CREATE TABLE localizacion (
    nombre VARCHAR(50) PRIMARY KEY,
    zona VARCHAR(30)
);

CREATE TABLE comida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    descripcion VARCHAR(90),
    tipo VARCHAR(20),
    imagen TEXT
);

CREATE TABLE objeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    descripcion VARCHAR(90),
    efecto VARCHAR(50),
    imagen TEXT
);

CREATE TABLE equipamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    descripcion VARCHAR(90),
    efecto VARCHAR(50),
    imagen TEXT
);

CREATE TABLE animal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    tipo VARCHAR(5),
    descripcion VARCHAR(90),
    localizacion VARCHAR(50),
    anotaciones VARCHAR(30),
    imagen TEXT,
    FOREIGN KEY (localizacion) REFERENCES localizacion(nombre)
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
    bio VARCHAR(150),
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

CREATE TABLE equipamiento_localizacion (
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
INSERT INTO localizacion (nombre, zona) VALUES
    ("Calle inhóspita", "Floridablanca Norte"),
    ("Floridablanca Norte", "Floridablanca Norte"),
    ("Maldiexprés", "Gerageralandia"),
    ("Superhíper Norte", "Floridablanca Norte"),
    ("Túnel Infinito", "Vellón"),
    ("Camino misterioso", "San Fantástico"),
    ("La pasarela", "Floridablanca Norte"),
    ("Colegio de Floridablanca", "Floridablanca Norte"),
    ("Portales místicos", "Portales místicos"),
    ("Evolución", "Evolución"),
    ("Infierno Infinito", "Infierno Infinito");

INSERT INTO comida (nombre, descripcion, tipo, imagen) VALUES
    ("Chocobarrita","El dulce de chocolate favorito de los Yo-kai gatos.","Chocobarritas",CONCAT(@linkComida, "72", @png)),
    ("Arroz con ciruelas","Triángulo de arroz con ciruelas dentro. Está un poco amargo.","Arroz",CONCAT(@linkComida, "1", @png)),
    ("Arroz en hoja de col","Triángulo de arroz envuelto en una hoja de col. Le da sabor.","Arroz",CONCAT(@linkComida, "2", @png)),
    ("Arroz con huevas","Triángulo de arroz con huevas de salmón. ¡Son huevos de pescado!","Arroz",CONCAT(@linkComida, "3", @png)),
    ("Arroz con gambas","Suculento arroz con tempura recién hecha. ¡Es puro arte!","Arroz",CONCAT(@linkComida, "4", @png)),
    ("Sándwich","Un sándwich común. Jamón y lechuga en pan de molde blanco.","Pan",CONCAT(@linkComida, "5", @png)),
    ("Bollo con crema","A todos les gusta el bollo con crema. ¡Está delicioso!","Pan",CONCAT(@linkComida, "6", @png)),
    ("Pan de curry","Un pan de curry poco común. O es perfecto, o no lo ponen a la venta.","Pan",CONCAT(@linkComida,"71",@png)),
    ("Baguette","Está un poco dura, pero es una auténtica baguette.","Pan",CONCAT(@linkComida, "7", @png)),
    ("Rosca lenguaraz","La reputación de la Panadería Chacharal depende de esta rosca.","Pan",CONCAT(@linkComida, "8", @png)),
    ("Chicle de 10","Un chicle tan barato que no hacen falta motivos para comprarlo.","Chuches",CONCAT(@linkComida, "9", @png)),
    ("Caramelo pegajoso","Este caramelo pegajoso sabe mejor tras juguetear con él.","Chuches",CONCAT(@linkComida, "10", @png)),
    ("Galleta gigante","Una galleta gigante que sabe a gamba. ¡Es muy popular!","Chuches",CONCAT(@linkComida, "11", @png)),
    ("Caramelos de frutas","Caramelos de frutas en un bote que evocan los buenos tiempos.","Chuches",CONCAT(@linkComida, "12", @png)),
    ("Helado granizado","El granizado sienta genial en verano, sea cual sea el sabor","Chuches",CONCAT(@linkComida,"13",@png)),
    ("Manz. caramelo","Un básico de los puestos. ¡Está envuelta en caramelo!","Chuches",CONCAT(@linkComida,"14",@png)),
    ("Leche","Una botella de leche fría. ¡Sienta genial después de ir a las termas!","Lácteos",CONCAT(@linkComida,"15",@png)),
    ("Café con leche","Intenso café, leche tibia, un poco de azúcar... Esto es vida.","Lácteos",CONCAT(@linkComida, "16", @png)),
    ("Leche de frutas","No es muy común, pero la leche de frutas está deliciosa, ¡en serio!","Lácteos",CONCAT(@linkComida, "17", @png)),
    ("Leche fresca","Deliciosa leche. Solo podría ser más fresca si tienes vaca propia.","Lácteos",CONCAT(@linkComida,"18",@png)),
    ("Y-Cola",'Es famosa por su eslogan: "Súbete a la ola, bebe Y-Cola".',"Refrescos",CONCAT(@linkComida,"19",@png)),
    ("Té relajante","Un té corriente. La marca dice que usan sus hojas más selectas.","Refrescos",CONCAT(@linkComida,"20",@png)),
    ("Insomnia Y","Una bebida revitalizante","Refrescos",CONCAT(@linkComida,"21",@png)),
    ("Energicina","No es muy conocida... pero ¡parece ser muy efectiva!","Refrescos",CONCAT(@linkComida,"22",@png)),
    ("Hamburguesa","Una hamburguesa bien hecha de una cadena conocida de la ciudad.","Hamburguesas",CONCAT(@linkComida,"23",@png)),
    ("Hambur. queso","Una hamburguesa de queso de una cadena local. Muy popular.","Hamburguesas",CONCAT(@linkComida,"24",@png)),
    ("Hambur. doble","Esta hamburguesa doble dará a conocer la cadena en el país.","Hamburguesas",CONCAT(@linkComida,"25",@png)),
    ("Hamburguesa Ñam","La cadena da nombre a esta brutal hamburguesa.","Hamburguesas",CONCAT(@linkComida,"26",@png)),
    ("Vaso de ramen","No tiene mucha ciencia, es un vaso de ramen instantáneo.","Ramen",CONCAT(@linkComida,"27",@png)),
    ("Ramen con cerdo","Delicioso caldo de cerdo con fideos finos. ¡Otro, por favor!","Ramen",CONCAT(@linkComida,"28",@png)),
    ("Ramen deluxe","Un ramen de lujo con un caldo sabroso, huevo y mucho cerdo.","Ramen",CONCAT(@linkComida,"29",@png)),
    ("Ramen completo","Cuando dicen completo, ¡es completo! Tiene de todo.","Ramen",CONCAT(@linkComida,"30",@png)),
    ("Maki de pepino","¿A quién no le gustan unas tiras de pepino y arroz con algas?","Sushi",CONCAT(@linkComida,"53",@png)),
    ("Nigiri de gamba","La suculenta gamba es un éxito entre los fans del sushi.","Sushi",CONCAT(@linkComida,"54",@png)),
    ("Maki de huevas","Rollos de sushi con deliciosas huevas de salmón.","Sushi",CONCAT(@linkComida,"55",@png)),
    ("Nigiri de atún","Este atún de calidad se deshace en la boca.","Sushi",CONCAT(@linkComida,"56",@png)),
    ("Empanad. chinas","Unas empanadillas chinas deliciosas con mucho relleno.","Comida china",CONCAT(@linkComida,"31",@png)),
    ("Hígado cebollino","Un jugoso fiete de hígado. ¿Que no te gusta? ¡Pruébalo y verás!","Comida china",CONCAT(@linkComida,"32",@png)),
    ("Tortilla de cangrejo","Huevo, una rica salsa y carne de cangrejo. Menuda combinación.","Comida china",CONCAT(@linkComida,"33",@png)),
    ("Gambas picantes","Es un poco caro, pero ¡las gambas son grandes y están riquísimas!","Comida china",CONCAT(@linkComida,"34",@png)),
    ("Tofu con carne","Un plato de primera, con un montón de tofu.","Comida china",CONCAT(@linkComida,"47",@png)),
    ("Zanahoria","Es de color naranja porque está buenísima. ¡A comer!","Verduras",CONCAT(@linkComida,"35",@png)),
    ("Pepino","Un pepino fresco y jugoso. Sabe mejor aún frío.","Verduras",CONCAT(@linkComida,"36",@png)),
    ("Brote de bambú","Un brote de bambú recién recogido. Aún huele a tierra.","Verduras",CONCAT(@linkComida, "37", @png)),
    ("Seta japonesa","Una seta olorosa de gran calidad. Suele venderse en cajas vistosas.","Verduras",CONCAT(@linkComida,"38",@png)),
    ("Muslo de pollo","Un muslo de pollo fresco y sabroso. ¡A comer!","Carne",CONCAT(@linkComida,"39",@png)),
    ("Panceta","Si quieres un pedazo de delicia porcina, prueba esto.","Carne",CONCAT(@linkComida,"40",@png)),
    ("Lengua de vaca","Su textura es un poco extraña, pero aún así, es muy sabrosa.","Carne",CONCAT(@linkComida,"41",@png)),
    ("Carne veteada","Carne veteada de gran calidad que se derrite en la boca.","Carne",CONCAT(@linkComida, "42", @png)),
    ("Caballa en salazón","Caballa en salazón con el punto justo de sal.","Pescado",CONCAT(@linkComida, "43", @png)),
    ("Jurel","Un filete grueso de jurel. ¡Recién pescado esta mañana!","Pescado",CONCAT(@linkComida,"44",@png)),
    ("Erizo fresco","Un erizo de mar fresco. Las espinas esconden la carne.","Pescado",CONCAT(@linkComida,"45",@png)),
    ("Atún selecto","Atún de excepcional calidad. ¡Los ricos dicen que adoran su textura!","Pescado",CONCAT(@linkComida, "46", @png)),
    ("Curry de pollo","¡Un crury reparador acompañado de pollo, arroz y verduras!","Curry",CONCAT(@linkComida,"57",@png)),
    ("Curry de cordero","Este cordero cocinado a fuego lento no puede estar más tierno.","Curry",CONCAT(@linkComida,"58",@png)),
    ("Curry de marisco","Calamares y gambas dan a este plato picante el espíritu del mar.","Curry",CONCAT(@linkComida,"59",@png)),
    ("Curry mixto","Lleno de carne y marisco, este plato te deja bien satisfecho.","Curry",CONCAT(@linkComida,"60",@png)),
    ("Curry de verduras","Un laureado curry tan lleno de verduras que casi es ensalada.","Curry",CONCAT(@linkComida,"48",@png)),
    ("Tarta de queso","Un postre de ensueño tan bueno que ni daña tus dientes.","Postres",CONCAT(@linkComida,"61",@png)),
    ("Tarta de fresa","Con una fresa incluida, ¡merece la pena hacer cola por este postre!","Postres",CONCAT(@linkComida,"62",@png)),
    ("Tortitas","Tortitas rebosantes de frutos rojos y nata.","Postres",CONCAT(@linkComida,"63",@png)),
    ("Helado con frutas","Un postre desmesurado que nadie ha sido capaz de terminar.","Postres",CONCAT(@linkComida,"64",@png)),
    ("Dulce de arroz","Este dulce exquisito viene acompañado de delicioso sirope.","Postres",CONCAT(@linkComida,"65",@png)),
    ("Fantasquebollo","Los fantasquebollos están rellenos de dulce chocolate.","Postres",CONCAT(@linkComida,"73",@png)),
    ("Carnanibollo","Los carnanibollos están rellenos de deliciosa nata.","Postres",CONCAT(@linkComida, "74", @png)),
    ("Daikon al vapor","Una buena cantidad de rábanos guisados servidos bien calientes.","Productos cocidos",CONCAT(@linkComida,"66",@png)),
    ("Huevo cocido","¡Servido con un delicioso caldo, es el plato invernal perfecto!","Productos cocidos",CONCAT(@linkComida,"67",@png)),
    ("Brochetas de carne","Carne hecha a fuego tan lento que se salió de la brocheta.","Productos cocidos",CONCAT(@linkComida, "68", @png)),
    ("Caldo completo","Un delicioso guiso que te reconfortará y llenará de alegría.","Productos cocidos",CONCAT(@linkComida,"69",@png)),
    ("Fideos sarracenos","Estos fideos fríos son perfectos para los calurosos días de verano.","Fideos",CONCAT(@linkComida,"70",@png)),
    ("Patatas fritas","De entre los aperitivos crujientes, ¡nada iguala a las patatas fritas!","Aperitivos",CONCAT(@linkComida,"49",@png)),
    ("Saladitos","Quien avisa no es traidor: si empiezas, ¡no podrás parar!","Aperitivos",CONCAT(@linkComida,"50",@png)),
    ("Palomitas de queso","Bolsa de aperitivos de maíz salados recubiertso de queso.","Aperitivos",CONCAT(@linkComida,"51",@png)),
    ("Guisantes aperitivo","Los guisantes blancos crujientes son la debilidad de todo padre.","Aperitivos",CONCAT(@linkComida,"52",@png));
INSERT INTO animal (nombre, tipo, descripcion, localizacion, anotaciones, imagen) VALUES
    ("Cigarra verde","Bicho","¡Una cigarra verde que canta una canción que recuerda al verano!","Floridablanca Norte","Árboles",CONCAT(@linkAnimal,"1",@png)),
    ("Cigarra marrón","Bicho","Una cigarra marrón que emite un sonido muy fuerte.","Floridablanca Norte","Árboles",CONCAT(@linkAnimal,"2",@png));
INSERT INTO objeto (nombre, descripcion, efecto, imagen) VALUES
    ("Exporbe mini", "Una pizca de este pequeño orbe vale tres horas de entrenamiento.","En amigo. Gana 10 pts. de EXP.",CONCAT(@linkObjeto, "19", @png)),
    ("Exporbe S", "Tres días de entrenamiento con solo tocar este exporbe.", "En amigo. Gana 50 pts. de EXP.", CONCAT(@linkObjeto,"60",@png)),
    ("Exporbe M", "Quien toca este exporbe consigue la experiencia de un maestro.", "En amigo. Gana 500 pts. de EXP.", CONCAT(@linkObjeto,"61",@png)),
    ("Exporbe L", "Otorga la experiencia de tres vidas con solo tocarlo.", "En amigo. Gana 2000 pts. de EXP.", CONCAT(@linkObjeto,"62",@png)),
    ("Exporbe XL", "Contiene la sabiudría de algunas de las mentes más brillantes.","En amigo. Gana 8000 pts. de EXP.", CONCAT(@linkObjeto,"63",@png)),
    ("Exporbe sagrado", "Una lagartija diminuta tocó este orbe y ahora es un dinosaurio","En amigo. Gana 20.000 pts. de EXP.", CONCAT(@linkObjeto,"64",@png)),
    ("Date vida","Un libro de motivación para todos los Yo-kai. Sobre todo los vagos.","En amigo. El Yo-kai vaguea menos.",CONCAT(@linkObjeto,"71",@png)),
    ("Golpes secretos","Un libro de secretos de combate. ¡Serás un profesional del ataque!","En amigo. Nivel +1 a un ataque.",CONCAT(@linkObjeto,"68",@png)),
    ("Resistina", "Esta bebida permite que los humanos corran sin cansarse.","En amigo. Corre sin cansarte durante un tiempo.",CONCAT(@linkObjeto, "58", @png)),
    ("Resistina Alfa", "El efecto de la Resistina Alfa dura más que el de la normal.","En amigo. Corre sin cansarte durante un tiempo.",CONCAT(@linkObjeto, "59", @png)),
    ("Secretos del alma","Un libro sobre los secretos del animáximum.","En amigo. Nivel +1 a un animáximum.",CONCAT(@linkObjeto,"70",@png)),
    ("Técnicas a tope","Mejora tus técnicas con la ayuda de este libro didáctico.","En amigo. Nivel +1 a una técnica.",CONCAT(@linkObjeto,"69",@png));

INSERT INTO equipamiento (nombre, descripcion, efecto, imagen) VALUES
    ("Pulsera gastada","Es algo barata, pero ¡para algunos Yo-kai es más que suficiente!","Fuerza +10 Velocidad -5",CONCAT(@linkEquipamiento,"1",@png)),
    ("Pulsera barata","No tiene mucho estilo, pero por lo menos hace el apaño.","Fuerza +10 Defensa -5",CONCAT(@linkEquipamiento,"37",@png)),
    ("Pulsera punki","Complemento con púas para amantes del rock. ¡No te pinches!","Fuerza +18 Velocidad -8",CONCAT(@linkEquipamiento,"2",@png)),
    ("Pulsera de fuego","Quien la lleva puede aplastar manzanas con sus propias manos","Fuerza +18 Defensa -8",CONCAT(@linkEquipamiento,"38",@png)),
    ("Pulsera de pinchos","¿Eres de los de más vale fuerza que maña? Esto es para ti.","Fuerza +25 Velocidad -12",CONCAT(@linkEquipamiento,"3",@png)),
    ("Pulsera excelente","Un objeto muy elegante. Aumenta la fuerza y ayuda a levantar peso.","Fuerza +25 Defensa -12",CONCAT(@linkEquipamiento,"39",@png));
INSERT INTO inventario (nombre, bolsillo, id_interior)
    SELECT nombre, 'Comida', id FROM comida
    UNION
    SELECT nombre, 'Objeto', id FROM objeto
    UNION
    SELECT nombre, 'Equipamiento', id FROM equipamiento;
INSERT INTO yokai (nombre,medalla,tribu,rango,bio,habilidad,ataque,tecnica,animaximum,espiritacion,comida_favorita,comida_odiada,blasters,drop_comun,prob_comun,drop_raro,prob_raro,dinero,experiencia,huecos_obj,fuego,hielo,tierra,rayo,agua,viento) VALUES
    ("Alcaldero",CONCAT(@linkMedalla, "1", @png),"Valiente","E","Un Yo-kai descuidado que solo lleva un taparrabos y una sartén en la cabeza. No intentes imitarlo.","Despreocupación","Pelmapunzadas","Ascuas","Palillo Puntiagudo","A la Ligera","Arroz","Pan","Luchador","Arroz con ciruelas",45,"Exporbe S",17,0.07,28,1,0.7,1,1,1,1.3,1),
    ("Sinná",CONCAT(@linkMedalla,"2",@png),"Valiente","C","Al quitarse la sartén, Sinná está desprotegido ante el mundo. Pero no le verás ni un moratón en el cuerpo ni expresar dolor.","Despreocupación","Multipuñalada","Ascuas","Lluvia de Palillos","Sin Defensa","Arroz","Pan","Luchador","Arroz en hoja de col",55,"Pulsera de fuego",16,0.16,32,1,0.5,1,1,1,1.5,1),
    ("Sinnareno",CONCAT(@linkMedalla,"3",@png),"Valiente","B","Un Yo-kai que siempre está dispuesto a combatir. Sin ropa que lo ralentice, siempre llega temprano y se pone moreno.","Despreocupación","Multipuñalada","Guijarro","Corte Profundo","Atrevimiento","Arroz","Pan","Luchador","Arroz con huevas",50,"Golpes secretos",5,0.21,38,2,1,1,0.5,0.5,1,1.8);
INSERT INTO yokai_localizacion (yokai, localizacion, anotaciones) VALUES
    (1, "La pasarela", NULL),
    (1, "Floridablanca Norte", "Hierba"),
    (1, "Floridablanca Norte", "Bajo los coches"),
    (1, "Infierno Infinito", "1-3er Círculo"),
    (1, "Camino misterioso", "Ruta 2"),
    (1, "Maldiexprés", "Rango E"),
    (1, "Maldiexprés", "Valiente"),
    (1, "Calle inhóspita", NULL),
    (1, "Colegio de Floridablanca", "Pisos 1-3, Noche"),
    (1, "Portales místicos", NULL),
    (2, "Evolución", "Alcaldero, Nivel 18"),
    (2, "Maldiexprés", "Rango C"),
    (2, "Maldiexprés", "Valiente");
INSERT INTO objetos_localizacion (nombre, localizacion, anotaciones, precio) VALUES
    ("Arroz con ciruelas", "Superhíper Norte", "Precio anterior a preguntabla Abuzampa",1.00),
    ("Arroz con ciruelas", "Superhíper Norte", "Precio posterior a preguntabla Abuzampa",0.70);