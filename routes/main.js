import { Router } from 'express'
import { YokaiController } from '../controllers/yokai.js'
import { GameController } from '../controllers/game.js'
import { InventarioController } from '../controllers/inventario.js'

export const mainRouter = Router({ mergeParams: true })

mainRouter.get('/', GameController.getGame)

mainRouter.get('/yokai', YokaiController.getAllYokai)

mainRouter.get('/yokai/:id', YokaiController.getYokaiByParam)

mainRouter.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
