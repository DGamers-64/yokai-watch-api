const { InventarioModel } = await import(`../../models/ykw_2/inventario.js`)

export class InventarioController {
    static async getBolsillos(req, res) {

        const allBolsillos = await InventarioModel.getAllBolsillos()

        res.send(allBolsillos)
    }

    static async getItemsInBolsillo(req, res) {
        const { game, bolsillo } = req.params

        const listaObjetos = await InventarioModel.getItemsInBolsillo({ game, bolsillo })

        res.send(listaObjetos)
    }
}