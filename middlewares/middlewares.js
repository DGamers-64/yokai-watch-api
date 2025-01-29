import fs from 'fs'
import path from 'path'

export function accessLog(req, res, next) {
    if (req.originalUrl != '/favicon.ico') {
        console.log(Date.now(), `: ${req.method} ${req.originalUrl}`)

        const log = `${Date.now()} : ${req.method} ${req.originalUrl}\n`
        
        fs.appendFile(path.join('./access.log'), log, (err) => {
            if (err) {
                console.error('Error:', err)
            }
        })
    }
    next()
}

export function filterMiddleware(req, res, next) {
    if (req.query.filter) {
        let filtrosConsulta = "1"
        let valoresFiltros = []

        const filtros = Array.isArray(req.query.filter) ? req.query.filter : [req.query.filter]

        const parsedFilters = filtros.map(f => {
            const match = f.match(/^(\w+)([:=<>]+)(.+)$/)
            if (!match) {
                return { error: `Filtro inválido: ${f}` }
            }

            const [, columna, operador, valor] = match

            if (operador === ":") {
                const regexMatch = valor.match(/^"(.*)"$/)
                if (!regexMatch) {
                    return { error: `Valor inválido para REGEXP en el filtro: ${f}. Use comillas dobles.` }
                }
                return { columna, operador: "REGEXP", valor: regexMatch[1] }
            } else if (!["=", "<", ">", "<=", ">="].includes(operador)) {
                return { error: `Operador no soportado: ${operador}` }
            }

            return { columna, operador, valor }
        });

        for (const filtro of parsedFilters) {
            if (filtro.error) {
                return res.status(400).json({ error: filtro.error })
            }
        }

        filtrosConsulta = parsedFilters.map(f => `?? ${f.operador} ?`).join(" AND ")
        valoresFiltros = parsedFilters.flatMap(f => [f.columna, f.valor])

        req.filtros = { consulta: filtrosConsulta, valores: valoresFiltros }
    } else {
        req.filtros = { consulta: "? = ?", valores: [1, 1] }
    }

    next()
}