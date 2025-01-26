
# Yo-Kai Watch API

Esta API contendrá todos los datos posibles de la saga Yo-Kai Watch disponibles para su uso desde cualquier cliente.

# Requisitos

- [Node JS v22.10.0](https://nodejs.org/en)

- [MySQL Server](https://dev.mysql.com/downloads/mysql/)

# Instalación

Para instalar las dependencias usa:

	npm install

Además tienes que configurar el archivo `.env.example` según tus configuraciones de MySQL. ¡Recuerda renombrarlo a `.env` a secas!

Para ejecutar la API puedes usar:

	node --run start

**Opcional**: Si quieres correr la API en un entorno de Docker tienes que editar el archivo `docker-compose.yml` con las mismas variables que hemos editado antes, después usa:

	docker-compose up -d --build

# Establecimiento las bases de datos

Tendrás que ejecutar en tu servidor los scripts que vienen en `./databases/`. Con ejecutarlos y establecer las variables de entorno correspondientes debería de ser suficiente para que tu proyecto funcione.

# Endpoints
Para conocer más sobre los distintos endpoints que tiene el proyecto comprueba `endpoints.md` o la página de inicio.