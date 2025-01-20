import { connection } from "./config.js"

export class InventarioModel {
    static async getAllBolsillos() {

        const [bolsillos] = await connection.query(
            'SELECT DISTINCT bolsillo AS nombre FROM inventario'
        )

        if (bolsillos.length === 0) return []

        return bolsillos
    }

    static async getItemsInBolsillo({ bolsillo }) {

        switch (bolsillo) {
            case "comida":
                const [items] = await connection.query(
                    'SELECT * FROM comida'
                )
                if (items.length === 0) return []
                return items
        
            default:
                break;
        }

    }
}