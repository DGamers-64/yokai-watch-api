import { connection } from "./config.js"
import { Game } from "./game.js"

export class InventarioModel {
    static async getAllBolsillosByGame({ game }) {

        const gameId = await Game.getGameId({ game })

        const [bolsillos] = await connection.query(
            'SELECT DISTINCT bolsillo AS nombre FROM inventario WHERE id_juego = ?',
            [ gameId ]
        )

        if (bolsillos.length === 0) return []

        return bolsillos
    }
}