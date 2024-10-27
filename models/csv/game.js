import { CsvHandler } from './config.js'

export class Game {
    static async getAllGames() {
        const result = await CsvHandler.getAllFromCsv('game.csv')

        return result
    }

    static async getGameId({ game }) {

        const conditions = {
            abreviatura: game
        }

        const result = await CsvHandler.findInCsv('game.csv', conditions)

        if (result.length === 0) return []
        
        return result[0].id
    }

    static async getGameInfo({ game }) {

        const conditions = {
            abreviatura: game
        }

        const result = await CsvHandler.findInCsv('game.csv', conditions)

        if (result.length === 0) return []

        return result
    }
}