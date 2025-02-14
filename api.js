import express, { json } from 'express'
import { ykw2Router } from './routes/ykw_2.js'
import { client } from './client/client.js'
import cors from 'cors'
import { filterMiddleware, accessLog } from './middlewares/middlewares.js'

const PORT = process.env.PORT
const app = express()


app.disable('x-powered-by')
app.use(json())
app.use(cors())
app.use(express.static('public'))

app.use(accessLog)
app.use(filterMiddleware)

// app.use('/ykw1', ykw1Router)

app.use('/ykw2', ykw2Router)

// app.use('/ykw3', ykw3Router)

// app.use('/ykwb', ykwBlastersRouter)

app.use((req, res) => {
    res.status(404).send({ res: `Error 404: ${req.url}`})
})

app.use('/', client)

app.listen(PORT, () => {
    console.log('--------------------------------------------')
    console.log(`Servidor encendido en el puerto ${PORT}`)
    console.log(`Cliente alojado en http://localhost:${PORT}`)
    console.log('--------------------------------------------')
})