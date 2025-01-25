import express, { json } from 'express'
import { ykw2Router } from './routes/ykw_2.js'
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

// app.use('/ykw1', ykw1Router)

app.use('/ykw2', ykw2Router)

// app.use('/ykw3', ykw3Router)

// app.use('/ykwb', ykwBlastersRouter)

app.use((req, res) => {
    res.status(404).send({ res: `Error 404: ${req.url}`})
})

app.use('/', client)

app.listen(PORT, () => {
    console.log('---------------------------------------')
    console.log(`Servidor encendido en el puerto ${PORT}`)
    console.log('---------------------------------------')
})