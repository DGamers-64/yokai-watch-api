import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_2/yokai.js'
import { GameController } from '../controllers/ykw_2/game.js'
import { InventarioController } from '../controllers/ykw_2/inventario.js'

export const ykw2Router = Router({ mergeParams: true })

ykw2Router.get('/', GameController.getGame)

ykw2Router.get('/yokai', YokaiController.getAllYokai)

ykw2Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw2Router.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
