const { InventarioModel } = await import(`../../models/ykw_2/inventario.js`)

export class InventarioController {
    static async getBolsillos(req, res) {
        let { lang, format, offset, limit } = req.query
        if (offset) {
            offset--
        }

        const allBolsillos = await InventarioModel.getAllBolsillos(lang, format, offset, limit)

        res.send(allBolsillos)
    }

    static async getItemsInBolsillo(req, res) {
        let { lang, format, offset, limit } = req.query
        if (offset) {
            offset--
        }
        
        const { bolsillo } = req.params

        const filtros = req.filtros

        const listaObjetos = await InventarioModel.getItemsInBolsillo({ bolsillo, lang, format, offset, limit, filtros })

        res.send(listaObjetos)
    }

    static async getItemsInfoByParam(req, res) {
        let { lang, format, offset, limit } = req.query
        if (offset) {
            offset--
        }

        const { bolsillo, id } = req.params

        const objeto = await InventarioModel.getItemsInfo({ bolsillo, id, lang, format, offset, limit })

        res.send(objeto)
    }
}