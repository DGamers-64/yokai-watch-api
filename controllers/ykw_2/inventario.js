const { InventarioModel } = await import(`../../models/ykw_2/inventario.js`)

export class InventarioController {
    static async getBolsillos(req, res) {

        const allBolsillos = await InventarioModel.getAllBolsillos()

        res.send(allBolsillos)
    }

    static async getItemsInBolsillo(req, res) {
        const { bolsillo } = req.params

        const listaObjetos = await InventarioModel.getItemsInBolsillo({ bolsillo })

        res.send(listaObjetos)
    }

    static async getItemsInfo(req, res) {
        const { bolsillo, id } = req.params

        const objeto = await InventarioModel.getItemsInfo({ bolsillo, id })

        res.send(objeto)
    }
}