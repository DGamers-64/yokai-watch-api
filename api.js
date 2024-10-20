const express = require('express')
const crypto = require('node:crypto')
const cors = require('cors')

const app = express()
const yokais = require('./json/yokai.json')
const { validateYokai, validatePartialYokai } = require('./schemas/yokai')
const PORT = 3000

app.disable('x-powered-by')

// MIDDLEWARE

app.use(cors())
app.use(express.json())

// GET INDEX

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html')
})

// GET YOKAI

app.get('/yokai', (req, res) => {
    const { tribu, rango } = req.query
    if (tribu) {
        const tribusFiltradas = yokais.filter(
            yokai => yokai.tribu.toLowerCase() === tribu.toLowerCase()
        )
        return res.json(tribusFiltradas)
    }

    res.json(yokais)
})

// GET YOKAI

app.get('/yokai/:id', (req, res) => {
    const { id } = req.params
    const yokai = yokais.find(yokai => yokai.id === id)
    if (!yokai) return res.status(404).json({ message : "Yokai no encontrado" })
    res.json(yokai)
})

// POST YOKAI

app.post('/yokai', (req, res) => {
    const result = validateYokai(req.body)

    if (result.error) {
        return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const newYokai = {
        id: crypto.randomUUID(),
        ...result.data
    }

    yokais.push(newYokai)
    res.status(201).json(newYokai)
})

// PATCH YOKAI

app.patch('/yokai/:id', (req, res) => {
    const result = validatePartialYokai(req.body)
    
    if(result.error){
        return res.status(422).json({ error: JSON.parse(result.error.message) })
    }
    
    const { id } = req.params
    const yokaiIndex = yokais.findIndex(yokai => yokai.id === id)

    if (yokaiIndex == -1) return res.status(404).json({ message : "Yokai no encontrado" })

    const updateYokai = {
        ...yokais[yokaiIndex],
        ...result.data
    }

    yokais[yokaiIndex] = updateYokai

    return res.json(updateYokai)    
})

app.delete('/yokai/:id', (req, res) => {
    const { id } = req.params
    const yokaiIndex = yokais.findIndex(yokai => yokai.id === id)

    if (yokaiIndex == -1) return res.status(404).json({ message : "Yokai no encontrado" })

    yokais.splice(yokaiIndex, 1)

    return res.json({ message: 'Yo-Kai borrado' })
})

// ERROR 404

app.use((req, res) => {
    res.status(404).send('<h1>Error 404: File Not Found</h1>')
})

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto http://localhost:${PORT}`)
})