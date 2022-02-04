/**
 * date format function
 */
export function generateDatabaseDateTime() {
  let date = new Date()
  return date.toISOString().replace('T', ' ').substring(0, 19)
}
