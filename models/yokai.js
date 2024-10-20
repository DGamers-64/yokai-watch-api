import { readJSON } from '../utils.js'
import { randomUUID } from 'node:crypto'

const yokais = readJSON('./yokai.json')

export class YokaiModel {
    static async getAll ({ tribu, rango }) {
        if (tribu) {
            return yokais.filter(
                yokai => yokai.tribu.toLowerCase() === tribu.toLowerCase()
            )
        } else if (rango) {
            return yokais.filter(
                yokai => yokai.rango.toLowerCase() === rango.toLowerCase()
            )
        }

        return yokais
    }

    static async getById ({id}) {
        const yokai = yokais.find(yokai => yokai.id === id)
        if (yokai) return yokai
    }

    static async create ({ input }) {
        const newYokai = {
            id: randomUUID(),
            ...input
        }
    
        yokais.push(newYokai)

        return newYokai
    }

    static async delete ({ id }) {
        const yokaiIndex = yokais.findIndex(yokai => yokai.id === id)
        if (yokaiIndex == -1) return false
        yokais.splice(yokaiIndex, 1)
        return true
    }

    static async update ({ id, input }) {
        const yokaiIndex = yokais.findIndex(yokai => yokai.id === id)
        if (yokaiIndex == -1) return false
    
        yokais[yokaiIndex] = {
            ...yokais[yokaiIndex],
            ...input
        }

        return yokais[yokaiIndex]
    }
}