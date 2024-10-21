import { YokaiModel } from "../models/mysql/yokai.js"
import { validateYokai, validatePartialYokai } from '../schemas/yokai.js'

export class YokaiController {
    static async getAll(req, res) {
        const { nombre, tribu, rango } = req.query
        const yokai = await YokaiModel.getAll({ nombre, tribu, rango })
        res.json(yokai)
    }

    static async getById(req, res) {
        const { id } = req.params
        const yokai = await YokaiModel.getById({ id })
        if (!yokai) return res.status(404).json({ message : "Yokai no encontrado" })
        res.json(yokai)
    }

    static async create(req, res) {
        const result = validateYokai(req.body)
    
        if (result.error) {
            return res.status(422).json({ error: JSON.parse(result.error.message) })
        }
    
        const newYokai = await YokaiModel.create({ input: result.data })
    
        res.status(201).json(newYokai)
    }

    static async delete(req, res) {
        const { id } = req.params
    
        const result = await YokaiModel.delete({ id })
    
        if (result === false) return res.status(404).json({ message : "Yokai no encontrado" })
    
        return res.json({ message: 'Yo-Kai borrado' })
    }

    static async update(req, res) {
        const result = validatePartialYokai(req.body)
        
        if(result.error){
            return res.status(422).json({ error: JSON.parse(result.error.message) })
        }
        
        const { id } = req.params
    
        const updatedYokai = await YokaiModel.update({ id, input: result.data })
    
        return res.json(updatedYokai)    
    }
}