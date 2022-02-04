import { AppController } from '../controller/app.controller.js'
import AppModule from '../module/app.module.js'
import { ReadStream } from '../module/staticFile.module.js'

export const routes = async (fastify, options) => {
  //module
  const appModule = new AppModule(fastify.db.client)
  const appController = new AppController()

  /**
   * get all cards or only one cards!
   */
  fastify.get('/api/cards', appController.GetAllCards.bind(appModule))

  /**
   * get all categories
   */
  fastify.get('/api/categories', appController.GetCategories.bind(appModule))

  /**
   * get all authors
   */
  fastify.get('/api/authors', appController.GetAuthors.bind(appModule))

  /**
   * get recomendet crads for sap categroy id
   */
  fastify.get('/api/recomendet', appController.GetRecomendet.bind(appModule))

  /**
   * home :)
   */
  fastify.get('/', (req, res) => {
    return { hello: 'world!' }
  })

  /**
   * create new crads
   */
  fastify.post('/api/upload', appController.PostCreateCards.bind(appModule))

  /**
   * check admin
   */
  fastify.post('/api/admin', appController.CheckAdmin.bind(appModule))

  /**
   * xamma yengi postlarni ob chiqib beradi.
   */
  fastify.get(
    '/api/check/confirmation',
    appController.GetCardByType.bind(appModule)
  )

  /**
   * Admin tekshirib bolgan elonlarni kiritadi
   */
  fastify.post('/api/check', appController.PostCheck.bind(appModule))

  /**
   * static file with stream
   */
  fastify.get('/public/*', ReadStream)
}
