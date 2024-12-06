const modelType = process.env.MODEL

const { InventarioModel } = await import(`../../models/${modelType}/ykw_1/inventario.js`)

export class InventarioController {
    static async getBolsillos(req, res) {
        const { game } = req.params

        const allBolsillos = await InventarioModel.getAllBolsillosByGame({ game })

        res.send(allBolsillos)
    }

    // static async getItemsInBolsillo(req, res) {
    //     const { game, bolsillo } = req.params

    //     const listaObjetos = await InventarioModel.getItemsInBolsillo({ game, bolsillo })

    //     res.send(listaObjetos)
    // }
}