import { CsvHandler } from './config.js'
import { Game } from './game.js'

export class YokaiModel {
    static async getAllYokai({ game }) {
        const gameId = await Game.getGameId({ game })

        const conditions = {
            game: gameId
        }

        const yokai = await CsvHandler.findInCsv('yokai.csv', conditions)

        if (yokai.length === 0) return []
        
        return yokai
    }

    static async getYokaiById({ game, id }) {
        const gameId = await Game.getGameId({ game })

        const conditions = {
            game: gameId,
            no_de_medallium: Number(id)
        }

        const yokai = await CsvHandler.findInCsv('yokai.csv', conditions)

        if (yokai.length === 0) return []

        return yokai
    }

    static async getYokaiByName({ game, nombre }) {
        const gameId = await Game.getGameId({ game })

        const conditions = {
            game: gameId,
            nombre: nombre
        }

        const yokai = await CsvHandler.findInCsv('yokai.csv', conditions)

        if (yokai.length === 0) return []

        return yokai
    }
}