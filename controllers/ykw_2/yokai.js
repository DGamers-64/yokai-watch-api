const { YokaiModel } = await import(`../../models/ykw_2/yokai.js`);

export class YokaiController {
    static async getAllYokai(req, res) {

        const allYokai = await YokaiModel.getAllYokai()

        res.send(allYokai)
    }

    static async getYokaiByParam(req, res) {
        const { id } = req.params

        let yokai

        if (!isNaN(id)) {
            yokai = await YokaiModel.getYokaiById({ id })
        } else {
            yokai = await YokaiModel.getYokaiByName({ nombre: id })
        }

        res.send(yokai)
    }
}