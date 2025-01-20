import { Router } from 'express'
import { YokaiController } from '../controllers/ykw_2/yokai.js'
import { InventarioController } from '../controllers/ykw_2/inventario.js'

export const ykw2Router = Router({ mergeParams: true })

ykw2Router.get('/', (req, res) => {
    const jsonYKW2 = 
    {
        'nombreCompleto': 'Yo-Kai Watch 2',
        'versiones': [
            'Fantasqueletos',
            'Carnánimas',
            'Mentespectros'
        ],
        'fechaSalida': {
            'japón': '10-7-2014',
            'america': '30-9-2016',
            'europa': '7-4-2017'
        },
        "sinopsis": "El juego trata sobre las aventuras de Nathan Adams, un niño de 11 años al que le roban el reloj Yo-kai, junto a Whisper y Jibanyan, tendrán que adentrarse en el pasado para derrotar a Lady Desdicha, villana principal, y sus secuaces, los Yo-kai maléficos."
    }
    res.send(jsonYKW2)
})

ykw2Router.get('/yokai', YokaiController.getAllYokai)

ykw2Router.get('/yokai/:id', YokaiController.getYokaiByParam)

ykw2Router.get('/inventario', InventarioController.getBolsillos)

ykw2Router.get('/inventario/:bolsillo', InventarioController.getItemsInBolsillo)

ykw2Router.get('/inventario/:bolsillo/:id', InventarioController.getItemsInfo)

ykw2Router.get('/:otros', (req, res) => {
    res.status(404).send({ res: `Error 404: ${req.url}`})
})