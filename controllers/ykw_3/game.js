const modelType = process.env.MODEL

const { Game } = await import(`../../models/${modelType}/ykw_3/game.js`)

export class GameController {
static async getGame(req, res) {
        const { game } = req.params

        let gameData

        if (game === 'games') {
            gameData = await Game.getAllGames()
        } else {
            gameData = await Game.getGameInfo({ game })
        }

        res.send(gameData)
    }
}