import { connection } from './config.js'

export class YokaiModel {
    static async getAllYokai() {

        const [yokai] = await connection.query(
            'SELECT id, nombre FROM yokai'
        )

        if (yokai.length === 0) return []

        return yokai
    }

    static async getYokaiById({ id }) {

        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?',
            [ id ]
        )

        if (yokai.length === 0) return []

        const [forma_alt_query] = await connection.query(
            'SELECT * FROM forma_alt WHERE id_yokai = ?',
            [ id ]
        )

        const drops = {
            drop_comun: {
                nombre: yokai[0].drop_comun,
                prob: yokai[0].prob_comun
            },
            drop_raro: {
                nombre: yokai[0].drop_raro,
                prob: yokai[0].prob_raro
            }
        }

        const resistencias = {
            fuego: yokai[0].fuego,
            hielo: yokai[0].hielo,
            tierra: yokai[0].tierra,
            rayo: yokai[0].rayo,
            agua: yokai[0].agua,
            viento: yokai[0].viento
        }

        const comidas = {
            comida_favorita: yokai[0].comida_favorita,
            comida_odiada: yokai[0].comida_odiada
        }

        const movimientos = {
            habilidad: yokai[0].habilidad,
            ataque: yokai[0].ataque,
            tecnica: yokai[0].tecnica,
            animaximum: yokai[0].animaximum,
            espiritacion: yokai[0].espiritacion
        }

        const valoresBase = {
            dinero: yokai[0].dinero,
            experiencia: yokai[0].experiencia,
            huecos_obj: yokai[0].huecos_obj
        }

        const infoGeneral = {
            id: yokai[0].id,
            nombre: yokai[0].nombre,
            medalla: yokai[0].medalla,
            tribu: yokai[0].tribu,
            rango: yokai[0].rango,
            bio: yokai[0].bio,
            blasters: yokai[0].blasters,
        }

        const yokaiNuevo = [{}]

        yokaiNuevo[0].infoGeneral = infoGeneral
        yokaiNuevo[0].valoresBase = valoresBase
        yokaiNuevo[0].drops = drops
        yokaiNuevo[0].resistencias = resistencias
        yokaiNuevo[0].comidas = comidas
        yokaiNuevo[0].movimientos = movimientos

        if (forma_alt_query.length != 0) {
            const forma_alt = {
                bando: forma_alt_query[0].bando,
                habilidad: forma_alt_query[0].habilidad
            }

            yokaiNuevo[0].forma_alt = forma_alt
        }
        
        return yokaiNuevo
    }

    static async getYokaiByName({ nombre }) {
        
        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE nombre = ?',
            [ nombre ]
        )

        if (yokai.length === 0) return []

        const [forma_alt_query] = await connection.query(
            'SELECT * FROM forma_alt WHERE id_yokai = ?',
            [ yokai[0].id ]
        )

        const drops = {
            drop_comun: {
                nombre: yokai[0].drop_comun,
                prob: yokai[0].prob_comun
            },
            drop_raro: {
                nombre: yokai[0].drop_raro,
                prob: yokai[0].prob_raro
            }
        }

        const resistencias = {
            fuego: yokai[0].fuego,
            hielo: yokai[0].hielo,
            tierra: yokai[0].tierra,
            rayo: yokai[0].rayo,
            agua: yokai[0].agua,
            viento: yokai[0].viento
        }

        const comidas = {
            comida_favorita: yokai[0].comida_favorita,
            comida_odiada: yokai[0].comida_odiada
        }

        const movimientos = {
            habilidad: yokai[0].habilidad,
            ataque: yokai[0].ataque,
            tecnica: yokai[0].tecnica,
            animaximum: yokai[0].animaximum,
            espiritacion: yokai[0].espiritacion
        }

        const valoresBase = {
            dinero: yokai[0].dinero,
            experiencia: yokai[0].experiencia,
            huecos_obj: yokai[0].huecos_obj
        }

        const infoGeneral = {
            id: yokai[0].id,
            nombre: yokai[0].nombre,
            medalla: yokai[0].medalla,
            tribu: yokai[0].tribu,
            rango: yokai[0].rango,
            bio: yokai[0].bio,
            blasters: yokai[0].blasters,
        }

        const yokaiNuevo = [{}]

        yokaiNuevo[0].infoGeneral = infoGeneral
        yokaiNuevo[0].valoresBase = valoresBase
        yokaiNuevo[0].drops = drops
        yokaiNuevo[0].resistencias = resistencias
        yokaiNuevo[0].comidas = comidas
        yokaiNuevo[0].movimientos = movimientos

        if (forma_alt_query.length != 0) {
            const forma_alt = {
                bando: forma_alt_query[0].bando,
                habilidad: forma_alt_query[0].habilidad
            }

            yokaiNuevo[0].forma_alt = forma_alt
        }
        
        return yokaiNuevo
    }
}