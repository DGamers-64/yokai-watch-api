import { LangModel } from "../models/mysql/lang.js"

export class LangController {
    static async getLangs(req, res) {
        const { lang } = req.params

        let dataToSend

        if (lang === 'lang'){
            dataToSend = await LangModel.getAllLangs()
        } else {
            dataToSend = await LangModel.getLangInfo({ lang })
        }

        return res.send(dataToSend)
    }
}