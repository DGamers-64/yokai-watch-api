import z from 'zod'

const yokaiSchema = z.object({
    id: z.number().optional(),
    img: z.string().url(),
    nombre: z.string(),
    tribu: z.string(),
    rango: z.enum(['S', 'A', 'B', 'C', 'D', 'E', '-']),
    elemento_debil: z.string(),
    foto: z.union([z.literal(0), z.literal(1)]),
    bando: z.enum(["Fantasqueletos", "Carnánimas", "Ambos", "Único"])
})

export function validateYokai(object) {
    return yokaiSchema.safeParse(object)
}

export function validatePartialYokai(object) {
    return yokaiSchema.partial().safeParse(object)
}
