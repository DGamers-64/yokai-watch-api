import { connection } from './config.js'
import { Game } from './game.js'

export class YokaiModel {
    static async getAllYokai({ game }) {

        const gameId = await Game.getGameId({ game })

        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id_juego = ?',
            [ gameId ]
        )

        if (yokai.length === 0) return []

        return yokai
    }

    static async getYokaiById({ game, id }) {

        const gameId = await Game.getGameId({ game })

        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id_juego = ? AND no_de_medallium = ?',
            [ gameId, id ]
        )

        if (yokai.length === 0) return []
        
        return yokai
    }

    static async getYokaiByName({ game, nombre }) {
        const gameId = await Game.getGameId({ game })
        
        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id_juego = ? AND nombre = ?',
            [ gameId, nombre ]
        )

        if (yokai.length === 0) return []
        
        return yokai
    }
}