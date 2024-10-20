const z = require('zod')

const yokaiSchema = z.object({
    nombre: z.string(),
    tribu: z.string(),
    rango: z.enum(['S', 'A', 'B', 'C', 'D', 'E', '-'])
})

function validateYokai(object) {
    return yokaiSchema.safeParse(object)
}

function validatePartialYokai(object) {
    return yokaiSchema.partial().safeParse(object)
}

module.exports = {
    validateYokai,
    validatePartialYokai
}