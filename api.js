import express, { json } from 'express'
import { mainRouter } from './routes/main.js'
import { client } from './client/client.js'
import cors from 'cors'
import fs from 'fs'
import path from 'path'

const PORT = process.env.PORT
const app = express()


app.disable('x-powered-by')
app.use(json())
app.use(cors())
app.use(express.static('public'))

app.use((req, res, next) => {
    if (req.originalUrl != '/favicon.ico') {
        console.log(Date.now(), `: ${req.method} ${req.originalUrl}`)

        const log = `${Date.now()} : ${req.method} ${req.originalUrl}\n`
        
        fs.appendFile(path.join('./access.log'), log, (err) => {
            if (err) {
                console.error('Error:', err)
            }
        })

        next()
    }
})

app.use('/:game', mainRouter)

app.use('/', client)

app.listen(PORT, () => {
    console.log('---------------------------------------')
    console.log(`Servidor encendido en el puerto ${PORT}`)
    console.log(`Modelo de base de datos usado: ${process.env.MODEL}`)
    console.log('---------------------------------------')
})