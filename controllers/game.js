export class GameController {
    static async getGame(req, res) {
        const { lang, game } = req.params
        res.send(lang + " " + game)
        return 'hola'
    }
}