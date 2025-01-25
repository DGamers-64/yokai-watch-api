import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_2/yokai.js'
import { InventarioController } from '../controllers/ykw_2/inventario.js'

export const ykw2Router = Router({ mergeParams: true })

ykw2Router.get('/', (req, res) => {
    const jsonYKW2 = 
    {
        "rutas": {
            "/yokai": "Lista de Yo-Kais",
            "/yokai/:id": "Información de Yo-Kai",
            "/inventario": "Lista de bolsillos",
            "/inventario/:bolsillo": "Lista de items en bolsillo",
            "/inventario/:bolsillo/:id": "Información de item"
        }
    }
    res.send(jsonYKW2)
})

ykw2Router.get('/yokai', YokaiController.getAllYokai)

ykw2Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw2Router.get('/inventario', InventarioController.getBolsillos)

ykw2Router.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

ykw2Router.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfoByParam)

ykw2Router.use((req, res) => {
    res.status(404).send({ res: `Error 404: ${req.url}`})
})