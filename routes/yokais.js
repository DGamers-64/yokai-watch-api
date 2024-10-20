import { validateYokai, validatePartialYokai } from '../schemas/yokai.js'
import { Router } from "express"
import { YokaiModel } from "../models/yokai.js";

export const yokaisRouter = Router()

yokaisRouter.get('/', async (req, res) => {
    const { tribu, rango } = req.query
    const yokai = await YokaiModel.getAll({ tribu, rango })
    res.json(yokai)
})

yokaisRouter.get('/:id', async (req, res) => {
    const { id } = req.params
    const yokai = await YokaiModel.getById({ id })
    if (!yokai) return res.status(404).json({ message : "Yokai no encontrado" })
    res.json(yokai)
})

yokaisRouter.post('/', async (req, res) => {
    const result = validateYokai(req.body)

    if (result.error) {
        return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const newYokai = await YokaiModel.create({ input: result.data })

    res.status(201).json(newYokai)
})

yokaisRouter.delete('/:id', async (req, res) => {
    const { id } = req.params

    const result = await YokaiModel.delete({ id })

    if (result === false) return res.status(404).json({ message : "Yokai no encontrado" })

    return res.json({ message: 'Yo-Kai borrado' })
})

yokaisRouter.patch('/:id', async (req, res) => {
    const result = validatePartialYokai(req.body)
    
    if(result.error){
        return res.status(422).json({ error: JSON.parse(result.error.message) })
    }
    
    const { id } = req.params

    const updatedYokai = await YokaiModel.update({ id, input: result.data })

    return res.json(updatedYokai)    
})
