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
                    'SELECT id, nombre, tipo FROM comida'
                )
                if (comida.length === 0) return []
                return comida

            case "objeto":
                const [objetos] = await connection.query(
                    'SELECT id, nombre FROM objeto'
                )
                if (objetos.length === 0) return []
                return objetos
        
            default:
                const vacio = {}
                return vacio
        }
    }

    static async getItemsInfoById({ bolsillo, id }) {
        switch (bolsillo) {
            case "comida":
                const [comida] = await connection.query(
                    'SELECT * FROM comida WHERE id = ?',
                    [ id ]
                )

                if (comida.length === 0) return []

                const [comidaLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ comida[0].nombre ]
                )

                comida[0].localizaciones = comidaLocalizaciones

                return comida

            case "objeto":
                const [objetos] = await connection.query(
                    'SELECT * FROM objeto WHERE id = ?',
                    [ id ]
                )

                if (objetos.length === 0) return []

                const [objetoLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ objetos[0].nombre ]
                )

                objetos[0].localizaciones = objetoLocalizaciones

                return objetos
            
            case "equipamiento":
                const [equipamiento] = await connection.query(
                    'SELECT * FROM objeto WHERE id = ?',
                    [ id ]
                )

                if (equipamiento.length === 0) return []

                const [equipamientoLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ equipamiento[0].nombre ]
                )

                equipamiento[0].localizaciones = equipamientoLocalizaciones

                return equipamiento
        
            default:
                return []
        }
    }
}