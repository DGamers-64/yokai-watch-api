export class GameController {
    static async getGameInfo(req, res) {
        const { lang, game } = req.params
        res.send(lang + " " + game)
    }
}