import { connection } from './config.js'

export class LangModel {
    static async getAllLangs() {
        const [allLangs] = await connection.query(
            'SELECT * FROM lang'
        )

        if (allLangs.length === 0) return []

        return allLangs
    }

    static async getLangInfo({ lang }) {
        const [langInfo] = await connection.query(
            'SELECT * FROM lang WHERE nombre = ?',
            [ lang ]
        )

        return langInfo
    }
}