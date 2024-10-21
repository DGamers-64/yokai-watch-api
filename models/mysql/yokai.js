import mysql from 'mysql2/promise'

const config = {
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: '',
    database: 'yokaidb'
}

const connection = await mysql.createConnection(config)

export class YokaiModel {
    static async getAll ({ nombre, tribu, rango }) {
        if (nombre) {
            const lowerCaseNombre = nombre.toLowerCase()

            const [yokai] = await connection.query(
                'SELECT * FROM yokai WHERE LOWER(nombre) = ?;',
                [ lowerCaseNombre ]
            )

            if (yokai.length === 0) return []

            return yokai
        } else if (tribu) {
            const lowerCaseTribu = tribu.toLowerCase()

            const [yokai] = await connection.query(
                'SELECT * FROM yokai WHERE LOWER(tribu) = ?;',
                [ lowerCaseTribu ]
            )

            if (yokai.length === 0) return []

            return yokai
        } else if (rango) {
            const lowerCaseRango = rango.toLowerCase()

            const [yokai] = await connection.query(
                'SELECT * FROM yokai WHERE LOWER(rango) = ?;',
                [ lowerCaseRango ]
            )

            if (yokai.length === 0) return []

            return yokai
        }

        const [yokai] = await connection.query(
            'SELECT * FROM yokai;'
        )

        return yokai
    }

    static async getById ({id}) {
        const [yokai] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?;',
            [ id ]
        )

        return yokai
    }

    static async create ({ input }) {
        const {
            img,
            nombre,
            tribu,
            rango,
            elemento_debil,
            foto,
            bando
        } = input

        const result = await connection.query(
            'INSERT INTO yokai (img, nombre, tribu, rango, elemento_debil, foto, bando) VALUES (?, ?, ?, ?, ?, ?, ?);',
            [ img, nombre, tribu, rango, elemento_debil, foto, bando ]
        )

        const [newYokai] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?;',
            [ result[0].insertId ]
        )

        return newYokai
    }

    static async delete ({ id }) {
        await connection.query(
            'DELETE FROM yokai WHERE id = ?;',
            [ id ]
        )

        const [yokaiDeleted] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?;',
            [ id ]
        )

        if (yokaiDeleted.length === 1) return false

        return true
    }

    static async update ({ id, input }) {
        const [filas] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?;',
            [ id ]
        )

        const yokai = {
            ...filas[0],
            ...input
        }

        await connection.query(
            'UPDATE yokai SET id = ?, img = ?, nombre = ?, tribu = ?, rango = ?, elemento_debil = ?, foto = ?, bando = ? WHERE id = ?;',
            [ yokai.id, yokai.img, yokai.nombre, yokai.tribu, yokai.rango, yokai.elemento_debil, yokai.foto, yokai.bando, id ]
        )

        const [yokaiUpdated] = await connection.query(
            'SELECT * FROM yokai WHERE id = ?;',
            [ id ]
        )

        return yokaiUpdated[0]
    }
}