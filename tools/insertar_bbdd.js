import mysql from 'mysql2';
import fs from 'node:fs';

const connection = mysql.createConnection({
    host: process.env.MYSQL_DB_HOST,
    user: process.env.MYSQL_DB_USER,
    port: process.env.MYSQL_DB_PORT,
    password: process.env.MYSQL_DB_PASSWORD,
    multipleStatements: true
});

const databases = {
    // yokaidb_1: fs.readFileSync('../databases/yokaidb_1.sql', 'utf-8'),
    yokaidb_2: fs.readFileSync('./databases/yokaidb_2.sql', 'utf-8'),
    // yokaidb_3: fs.readFileSync('../databases/yokaidb_3.sql', 'utf-8'),
    // yokaidb_b: fs.readFileSync('../databases/yokaidb_b.sql', 'utf-8')
};

const tasks = Object.entries(databases).map(([name, sql]) =>
    new Promise((resolve, reject) => {
        connection.query(sql, (err) => {
            if (err) {
                console.error(`Err: ${name}:`, err.message);
                reject(err);
            } else {
                console.log(`Base de datos ${name} insertada con éxito`);
                resolve();
            }
        });
    })
);

Promise.all(tasks)
    .then(() => {
        console.log("Todos los scripts se ejecutaron correctamente.");
        connection.end();
    })
    .catch(() => {
        console.error("Se produjo un error durante la ejecución.");
        connection.end();
    });
