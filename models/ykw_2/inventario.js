import { connection } from "./config.js"

export class InventarioModel {
    static async getAllBolsillos(lang="es", format="json", offset=0, limit=100) {
        if (!isNaN(offset)) offset = parseInt(offset)
        if (!isNaN(limit)) limit = parseInt(limit)

        const [bolsillos] = await connection.query(
            'SELECT bolsillo, COUNT(bolsillo) AS "longitud" FROM inventario GROUP BY bolsillo'
        )

        if (bolsillos.length === 0) return []

        return bolsillos
    }

    static async getItemsInBolsillo({ bolsillo, lang = "es", format = "json", offset = 0, limit = 100, filtros }) {
        if (!isNaN(offset)) offset = parseInt(offset)
        if (!isNaN(limit)) limit = parseInt(limit)
    
        const [items] = await connection.query(
            `SELECT id, nombre FROM ?? WHERE ${filtros.consulta} LIMIT ? OFFSET ?`,
            [ bolsillo, ...filtros.valores, limit, offset ]
        )

        if (items.length === 0) return []
        return items
    }

    static async getItemsInfo({ bolsillo, id, lang="es", format="json", offset=0, limit=100 }) {
        if (!isNaN(offset)) offset = parseInt(offset)
        if (!isNaN(limit)) limit = parseInt(limit)

        switch (bolsillo) {
            case "comida":
                let comida

                if (!isNaN(id)) {
                    [comida] = await connection.query(
                        'SELECT * FROM comida WHERE id = ?',
                        [ id ]
                    )
                } else {
                    [comida] = await connection.query(
                        'SELECT * FROM comida WHERE nombre = ?',
                        [ id ]
                    )
                }

                if (comida.length === 0) return []

                const [comidaLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ comida[0].nombre ]
                )

                comida[0].localizaciones = comidaLocalizaciones

                const [dropsComida] = await connection.query(
                    'SELECT id, nombre, drop_comun, prob_comun, drop_raro, prob_raro FROM yokai WHERE drop_comun = ? OR drop_raro = ?',
                    [ comida[0].nombre, comida[0].nombre ]
                )

                if (dropsComida.length > 0) {
                    dropsComida.forEach(i => {
                        if (comida.nombre == i.drop_comun) {
                            i.prob = i.prob_comun
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        } else {
                            i.prob = i.prob_raro
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        }
                    });
                }
                
                comida[0].drops = dropsComida

                return comida

            case "objeto":
                let objetos
                if (!isNaN(id)) {
                    [objetos] = await connection.query(
                        'SELECT * FROM objeto WHERE id = ?',
                        [ id ]
                    )
                } else {
                    [objetos] = await connection.query(
                        'SELECT * FROM objeto WHERE nombre = ?',
                        [ id ]
                    )
                }

                if (objetos.length === 0) return []

                const [objetoLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ objetos[0].nombre ]
                )

                objetos[0].localizaciones = objetoLocalizaciones

                const [dropsObjetos] = await connection.query(
                    'SELECT id, nombre, drop_comun, prob_comun, drop_raro, prob_raro FROM yokai WHERE drop_comun = ? OR drop_raro = ?',
                    [ objetos[0].nombre, objetos[0].nombre ]
                )

                if (dropsObjetos.length > 0) {
                    dropsObjetos.forEach(i => {
                        if (objetos.nombre == i.drop_comun) {
                            i.prob = i.prob_comun
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        } else {
                            i.prob = i.prob_raro
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        }
                    });
                }
                
                objetos[0].drops = dropsObjetos

                return objetos
            
            case "equipamiento":
                let equipamiento
                if (!isNaN(id)) {
                    [equipamiento] = await connection.query(
                        'SELECT * FROM equipamiento WHERE id = ?',
                        [ id ]
                    )
                } else {
                    [equipamiento] = await connection.query(
                        'SELECT * FROM equipamiento WHERE nombre = ?',
                        [ id ]
                    )
                }

                if (equipamiento.length === 0) return []

                const [equipamientoLocalizaciones] = await connection.query(
                    'SELECT nombre, localizacion, anotaciones, precio FROM objetos_localizacion WHERE nombre = ?',
                    [ equipamiento[0].nombre ]
                )

                equipamiento[0].localizaciones = equipamientoLocalizaciones

                const [dropsEquipamiento] = await connection.query(
                    'SELECT id, nombre, drop_comun, prob_comun, drop_raro, prob_raro FROM yokai WHERE drop_comun = ? OR drop_raro = ?',
                    [ equipamiento[0].nombre, equipamiento[0].nombre ]
                )

                if (dropsEquipamiento.length > 0) {
                    dropsEquipamiento.forEach(i => {
                        if (equipamiento.nombre == i.drop_comun) {
                            i.prob = i.prob_comun
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        } else {
                            i.prob = i.prob_raro
                            delete i.drop_comun
                            delete i.prob_comun
                            delete i.drop_raro
                            delete i.prob_raro
                        }
                    });
                }
                
                equipamiento[0].drops = dropsEquipamiento

                return equipamiento
        
            default:
                return []
        }
    }
}