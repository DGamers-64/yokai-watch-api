import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_1/yokai.js'
import { GameController } from '../controllers/ykw_1/game.js'
import { InventarioController } from '../controllers/ykw_1/inventario.js'

export const ykw1Router = Router({ mergeParams: true })

ykw1Router.get('/', GameController.getGame)

ykw1Router.get('/yokai', YokaiController.getAllYokai)

ykw1Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw1Router.get('/inventario', InventarioController.getBolsillos)

// mainRouter.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// mainRouter.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
