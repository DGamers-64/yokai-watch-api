import mysql from 'mysql2/promise'

const config = {
    host: process.env.MYSQL_DB_HOST,
    user: process.env.MYSQL_DB_USER,
    port: process.env.MYSQL_DB_PORT,
    password: process.env.MYSQL_DB_PASSWORD,
    database: process.env.MYSQL_DB_NAME
}

export const connection = await mysql.createConnection(config)