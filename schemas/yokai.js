import z from 'zod'

const yokaiSchema = z.object({
    nombre: z.string(),
    tribu: z.string(),
    rango: z.enum(['S', 'A', 'B', 'C', 'D', 'E', '-'])
})

export function validateYokai(object) {
    return yokaiSchema.safeParse(object)
}

export function validatePartialYokai(object) {
    return yokaiSchema.partial().safeParse(object)
}
