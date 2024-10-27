import { connection } from './config.js'

export class Game {
    static async getAllGames() {
        const [games] = await connection.query(
            'SELECT * FROM game'
        )

        if (games.length === 0) return []

        return games
    }

    static async getGameId({ game }) {
        const [gameResult] = await connection.query(
            'SELECT id FROM game WHERE abreviatura = ?',
            [ game ]
        )

        if (gameResult.length === 0) return []

        return gameResult[0].id
    }
}