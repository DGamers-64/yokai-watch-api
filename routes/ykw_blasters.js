import { Router } from 'express'
import { YokaiController } from '../controllers/yokai.js'
import { GameController } from '../controllers/game.js'
import { InventarioController } from '../controllers/inventario.js'

export const ykwBlastersRouter = Router({ mergeParams: true })

ykwBlastersRouter.get('/', GameController.getGame)

ykwBlastersRouter.get('/yokai', YokaiController.getAllYokai)

ykwBlastersRouter.get('/yokai/:id', YokaiController.getYokaiByParam)

ykwBlastersRouter.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
