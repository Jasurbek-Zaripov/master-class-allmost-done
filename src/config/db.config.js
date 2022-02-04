import pkg from 'pg'
import { config } from 'dotenv'
config()

const { Client } = pkg

const client = new Client({
  connectionString: `${process.env.db_url}`,
})
async function dbconnector(fastify) {
  try {
    await client.connect()
    console.log('db connected succesfully')
    fastify.decorate('db', { client })
  } catch (err) {
    console.error(err)
  }
}
export default dbconnector