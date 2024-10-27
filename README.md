# Yo-Kai Watch API
Esta API contendrá todos los datos posibles de Yo-Kai Watch disponibles para su uso desde cualquier cliente.
# Requisitos
- [Node JS v22.10.0](https://nodejs.org/en)
- MySQL Server (Opcional)
# Instalación
Para instalar las dependencias usa:

    npm install
Además tienes que crear un archivo .env con el siguiente formato:

	PORT=
	MYSQL_DB_HOST=
	MYSQL_DB_USER=
	MYSQL_DB_PORT=
	MYSQL_DB_PASSWORD=
	MYSQL_DB_NAME=
Según tus configuraciones tendrás que rellenarlo de una u otra forma

Para ejecutar la API puedes usar:

	node --run start
**Opcional**: Si quieres correr la API en un entorno de Docker usa:

    docker-compose up -d --build
# Uso
Para llamar a la API es tan simple como entrar al dominio ([localhost normalmente](http://localhost:3000)) y usar alguno de los siguientes parámetros:

## Ver que juegos hay disponibles (TODO)
	http://host/games
## Ver que contenidos tiene un juego (TODO)
	http://host/:game
:game = Abreviatura del juego a consultar
## Ver todos los yokais de un juego
	http://host/:game/yokai
:game = Abreviatura del juego a consultar
## Buscar un yokai específico según id
	http://host/:game/yokai/:id
:game = Abreviatura del juego a consultar
:id = Nº de Medallium a ser consultado
## Buscar un yokai específico según nombre
	http://host/:game/yokai/:nombre
:game = Abreviatura del juego a consultar
:nombre = Nombre a ser consultado
# Features
- No se discrimina ni por tildes ni por mayúsculas en ningún modelo
- Se recoge toda la información posible (TODO)