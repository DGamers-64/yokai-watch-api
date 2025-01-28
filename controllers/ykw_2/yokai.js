const { YokaiModel } = await import(`../../models/ykw_2/yokai.js`);

export class YokaiController {
    static async getAllYokai(req, res) {
        let { lang, format, offset, limit } = req.query
        if (offset) {
            offset--
        }

        const allYokai = await YokaiModel.getAllYokai(lang, format, offset, limit)

        res.send(allYokai)
    }

    static async getYokaiByParam(req, res) {
        let { lang, format, offset, limit } = req.query
        if (offset) {
            offset--
        }

        const { id } = req.params

        const yokai = await YokaiModel.getYokai({ id, lang, format, offset, limit })

        res.send(yokai)
    }
}