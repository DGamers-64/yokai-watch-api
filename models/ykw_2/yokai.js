import { connection } from './config.js'

export class YokaiModel {
    static async getAllYokai() {

        const [yokai] = await connection.query(
            'SELECT id, nombre FROM yokai'
        )

        if (yokai.length === 0) return []

        return yokai
    }

    static async getYokaiById({ id }) {

        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?',
            [ id ]
        )

        if (yokai.length === 0) return []
        
        return yokai
    }

    static async getYokaiByName({ nombre }) {
        
        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE nombre = ?',
            [ nombre ]
        )

        if (yokai.length === 0) return []
        
        return yokai
    }
}