# Yo-Kai Watch API
Esta API contendrá todos los datos posibles de Yo-Kai Watch disponibles para su uso desde cualquier cliente.
# Requisitos
- [Node JS v22.10.0](https://nodejs.org/en)
- MySQL Server
# Instalación
Para instalar las dependencias usa:

    npm install
Además tienes que crear un archivo .env con las siguientes variables:

	PORT=
PORT indicará el puerto en el que estará alojada la API

	MYSQL_DB_HOST=
	MYSQL_DB_USER=
	MYSQL_DB_PORT=
	MYSQL_DB_PASSWORD=
Estas variables tendrás que configurarlas según tu configuración de mysql.

Para ejecutar la API puedes usar:

	node --run start
**Opcional**: Si quieres correr la API en un entorno de Docker tienes que editar el archivo `docker-compose.yml` con las mismas variables que hemos editado antes, después usa:

    docker-compose up -d --build

# Establecimiento las bases de datos
Tendrás que ejecutar en tu servidor los scripts que vienen en `./databases/`. Con ejecutarlos y establecer las variables de entorno correspondientes debería de ser suficiente para que tu proyecto funcione.

# Uso
Para llamar a la API es tan simple como entrar al dominio ([localhost normalmente](http://localhost:3000)) y usar alguno de los siguientes parámetros:

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