# Yo-Kai Watch API
Esta API contendrá todos los datos posibles de Yo-Kai Watch disponibles para su uso desde cualquier cliente.
# Requisitos
- [Node JS v22.10.0](https://nodejs.org/en)
- MySQL Server (Opcional)
# Instalación
Para instalar las dependencias usa:

    npm install
Además tienes que crear un archivo .env con las siguientes variables:

	PORT=
PORT indicará el puerto en el que estará alojada la API

	MODEL=
MODEL indicará que modelo de base de datos quieres utilizar, están disponibles csv y mysql de momento

	MYSQL_DB_HOST=
	MYSQL_DB_USER=
	MYSQL_DB_PORT=
	MYSQL_DB_PASSWORD=
Estas variables tendrás que configurarlas según tu configuración de mysql, si no lo vas a utilizar son opcionales.

Para ejecutar la API puedes usar:

	node --run start
**Opcional**: Si quieres correr la API en un entorno de Docker tienes que editar el archivo `docker-compose.yml` con las mismas variables que hemos editado antes, después usa:

    docker-compose up -d --build

# Establecimiento las bases de datos
Dependiendo del modelo que necesites utilizar tendrás que hacer uno u otro proceso.
## CSV
Para CSV no tendrás que hacer nada porque ya vienen todos los archivos en la carpeta `./databases/csv` y el proyecto utilizará esta carpeta como fuente.
## MySQL
Para MySQL tendrás que ejecutar en tu servidor los scripts que vienen en `./databases/mysql`. Con ejecutarlos y establecer las variables de entorno correspondientes debería de ser suficiente para que tu proyecto funcione.

# Uso
Para llamar a la API es tan simple como entrar al dominio ([localhost normalmente](http://localhost:3000)) y usar alguno de los siguientes parámetros:

## Ver que juegos hay disponibles
	GET http://host/games
## Ver información sobre un juego
	GET http://host/:game
- :game = Abreviatura del juego a consultar
## Ver todos los yokais de un juego
	GET http://host/:game/yokai
- :game = Abreviatura del juego a consultar
## Buscar un yokai específico según id
	GET http://host/:game/yokai/:id
- :game = Abreviatura del juego a consultar
- :id = Nº de Medallium a ser consultado
## Buscar un yokai específico según nombre
	GET http://host/:game/yokai/:nombre
- :game = Abreviatura del juego a consultar
- :nombre = Nombre a ser consultado