// index.js

/**
 * Required External Modules
 */
const express = require('express')
/**
 * App Variables
 */
const app = express()
const port = process.env.PORT || '8080'
/**
 *  App Configuration
 */

/**
 * Routes Definitions
 */
app.get('/', (req, res) => {
  const dateOb = (new Date().toLocaleString('en-US', {
    timeZone: 'Europe/Moscow'
  }))
  res.status(200).send(`<h1>${dateOb}</h1>`)
})
/**
 * Server Activation
 */
app.listen(port, () => {
  console.log(`Listening to requests on http://localhost:${port}`)
})

module.exports = app
