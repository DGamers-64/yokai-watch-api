import { connection } from "./config.js"

export class InventarioModel {
    static async getAllBolsillos() {

        const [bolsillos] = await connection.query(
            'SELECT bolsillo, COUNT(bolsillo) AS "longitud" FROM inventario GROUP BY bolsillo'
        )

        if (bolsillos.length === 0) return []

        return bolsillos
    }

    static async getItemsInBolsillo({ bolsillo }) {

        switch (bolsillo) {
            case "comida":
                const [comida] = await connection.query(
                    'SELECT * FROM comida'
                )
                if (comida.length === 0) return []
                return comida

            case "objeto":
                const [objetos] = await connection.query(
                    'SELECT * FROM objeto'
                )
                if (objetos.length === 0) return []
                return objetos
        
            default:
                const vacio = {}
                return vacio
        }
    }

    static async getItemsInfo({ bolsillo, id }) {
        switch (bolsillo) {
            case "comida":
                const [comida] = await connection.query(
                    'SELECT * FROM comida WHERE id = ?',
                    [ id ]
                )
                if (comida.length === 0) return []
                return comida

            case "objeto":
                const [objetos] = await connection.query(
                    'SELECT * FROM objeto WHERE id = ?',
                    [ id ]
                )
                if (objetos.length === 0) return []
                return objetos
        
            default:
                const vacio = {}
                return vacio
        }
    }
}