import express, { json } from 'express'
import { mainRouter } from './routes/main.js'
import { client } from './client/client.js'

const PORT = process.env.PORT
const app = express()


app.disable('x-powered-by')
app.use(json())

app.use('/:game', mainRouter)

app.use('/', client)

app.listen(PORT, () => {
    console.log(`Servidor encendido en el puerto ${PORT}`)
})