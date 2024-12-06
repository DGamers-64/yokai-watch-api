import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_blasters/yokai.js'
import { GameController } from '../controllers/ykw_blasters/game.js'
import { InventarioController } from '../controllers/ykw_blasters/inventario.js'

export const ykwBlastersRouter = Router({ mergeParams: true })

ykwBlastersRouter.get('/', GameController.getGame)

ykwBlastersRouter.get('/yokai', YokaiController.getAllYokai)

ykwBlastersRouter.get('/yokai/:id', YokaiController.getYokaiByParam)

ykwBlastersRouter.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
