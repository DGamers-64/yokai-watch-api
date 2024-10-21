import express, { json } from 'express'
import { yokaisRouter } from './routes/yokais.js'
import { corsMiddleware } from './middlewares/cors.js'
import { fileURLToPath } from 'url';
import path from 'path';

const app = express()
const PORT = process.env.PORT ?? 3000

app.disable('x-powered-by')

// MIDDLEWARE

app.use(corsMiddleware())
app.use(json())

// GET INDEX

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.use('/yokai', yokaisRouter)

// ERROR 404

app.use((req, res) => {
    console.log("404")
    res.status(404).send('<h1>Error 404: File Not Found</h1>')
})

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto http://localhost:${PORT}`)
})