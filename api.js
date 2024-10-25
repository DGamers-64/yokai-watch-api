import express, { json } from 'express'
import { langRouter } from './routes/lang.js'
import { client } from './client/client.js'

const PORT = process.env.PORT
const app = express()


app.disable('x-powered-by')
app.use(json())

app.use('/:lang', langRouter)

app.use('/', (req, res) => {
    res.send('<h1>YokAPI is live!</h1>')
})

app.listen(PORT, () => {
    console.log(`Servidor encendido en el puerto ${PORT}`)
})