import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_3/yokai.js'
import { GameController } from '../controllers/ykw_3/game.js'
import { InventarioController } from '../controllers/ykw_3/inventario.js'

export const ykw3Router = Router({ mergeParams: true })

ykw3Router.get('/', GameController.getGame)

ykw3Router.get('/yokai', YokaiController.getAllYokai)

ykw3Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw3Router.get('/inventario', InventarioController.getBolsillos)

// ykw3Router.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

// ykw3Router.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)
