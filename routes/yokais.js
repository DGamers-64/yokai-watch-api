import { Router } from "express"
import { YokaiController } from '../controllers/yokais.js';

export const yokaisRouter = Router()

yokaisRouter.get('/', YokaiController.getAll )

yokaisRouter.get('/:id', YokaiController.getById )

yokaisRouter.post('/', YokaiController.create )

yokaisRouter.delete('/:id', YokaiController.delete )

yokaisRouter.patch('/:id', YokaiController.update )
