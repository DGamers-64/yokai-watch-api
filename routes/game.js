import { Router } from 'express'
import { YokaiController } from '../controllers/yokai.js'
import { GameController } from '../controllers/game.js'

export const mainRouter = Router({ mergeParams: true })

mainRouter.get('/', GameController.getGameInfo)

mainRouter.get('/yokai', YokaiController.getAllYokai)

mainRouter.get('/yokai/:id', YokaiController.getYokaiByParam)
