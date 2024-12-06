import { Router } from 'express'
import { YokaiController } from '../controllers/yokai.js'
import { GameController } from '../controllers/game.js'
import { InventarioController } from '../controllers/inventario.js'

export const ykw2Router = Router({ mergeParams: true })

ykw2Router.get('/', GameController.getGame)

ykw2Router.get('/yokai', YokaiController.getAllYokai)

ykw2Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw2Router.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
