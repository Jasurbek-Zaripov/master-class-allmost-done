import { upload } from '../config/multer.confige.js'
import { UnlinkFile, WriteFile } from '../module/file.module.js'

export class AppController {
  /**
   * Get all cards or with filter
   */
  async GetAllCards(req, res) {
    try {
      const { id, limit, page, search, author, category, date, status } =
        req.query
      if (id) return await this.getCard(id)

      return await this.getAllCards(
        limit,
        page,
        search,
        author,
        category,
        date,
        status
      )
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * get all categories
   */
  async GetCategories(req, res) {
    try {
      return await this.getCategories()
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * get all authors
   */
  async GetAuthors(req, res) {
    try {
      return await this.getAuthors()
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * get all cards by category id
   */
  async GetRecomendet(req, res) {
    try {
      const { id } = req.query

      if (id) return await this.getRecomendet(id)

      return new Error('not found card id')
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * Create new cards
   */
  async PostCreateCards(req, res) {
    let xato
    try {
      upload(req, res, async err => {
        try {
          if (err) throw new Error(err)

          xato = await WriteFile(req.file)

          if (xato instanceof Error) {
            throw new Error(xato.message)
          }

          const card = await this.postCards(req.body, xato)
          return res
            .header('Content-Type', 'application/json; charset=utf-8')
            .send(card[0])
        } catch (er) {
          // On Error delete file

          if (!(xato instanceof Error)) {
            UnlinkFile(xato)
          }
          return res
            .header('Content-Type', 'application/json; charset=utf-8')
            .send({ ERROR: er.message })
        }
      })
    } catch (error) {
      return res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * check admin
   */
  async CheckAdmin(req, res) {
    try {
      const data = await this.checkAdmin(req.body, req.headers)
      return data
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * check token and get all cards by Type (pending: 1, eccepted: 2, rejected: 0 )
   */
  async GetCardByType(req, res) {
    try {
      const { token } = req.headers

      return await this.getConfirmation(
        token,
        req.query,
        req.headers['user-agent']
      )
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }

  /**
   * Update by Type (pending: 1, eccepted: 2, rejected: 0 )
   */
  async PutCardStatus(req, res) {
    try {
      return await this.updateAnnouncement(req.body)
    } catch (error) {
      res
        .header('Content-Type', 'application/json; charset=utf-8')
        .send({ ERROR: error.message })
    }
  }
}
