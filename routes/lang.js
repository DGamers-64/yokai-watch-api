import { Router } from 'express'
import { GameController } from '../controllers/game.js'
import { LangController } from '../controllers/lang.js'

export const langRouter = Router({ mergeParams: true })

langRouter.get('/', LangController.getLangs)

langRouter.get('/:game', GameController.getGame)