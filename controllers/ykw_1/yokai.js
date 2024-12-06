const modelType = process.env.MODEL

const { YokaiModel } = await import(`../../models/${modelType}/ykw_1/yokai.js`);

export class YokaiController {
    static async getAllYokai(req, res) {
        const { game } = req.params

        const allYokai = await YokaiModel.getAllYokai({ game })

        res.send(allYokai)
    }

    static async getYokaiByParam(req, res) {
        const { game, id } = req.params

        let yokai

        if(!isNaN(id)) {
            yokai = await YokaiModel.getYokaiById({ game, id })
        } else {
            yokai = await YokaiModel.getYokaiByName({ game, nombre: id })
        }

        res.send(yokai)
    }
}