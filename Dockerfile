FROM node:22-alpine3.20

WORKDIR /usr/code/

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000