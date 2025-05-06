
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

Para ello puedes ejecutar el comando `node --run insertar_bbdd` y todo debería de ir correctamente. En caso de que no, siempre puedes ejecutar a mano los archivos de la carpeta `./databases/`.

# Endpoints
Para conocer más sobre los distintos endpoints que tiene el proyecto comprueba [`endpoints.md`](https://github.com/DGamers-64/yokai-watch-api/blob/master/endpoints.md) o la página de inicio.