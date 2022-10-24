const express = require("express")
const bodyParser = require("body-parser")
const path = require("path")

// Config
const app = express()
const port = 8082

// Testing
module.exports = {app}

// Paths
const dirname = path.resolve() // because __dirname may or may not be declared

// Static
app.use(express.static('public'))
app.use('/css', express.static(path.join(dirname, "public/css")))
app.use('/img_lab7', express.static(path.join(dirname, "public/img_lab7")))
app.use('/js', express.static(path.join(dirname, "public/js")))

// Templating
app.set('views', './src/views')
app.set('view engine', 'ejs')
// app.engine('ejs', require('ejs').__express);

app.use(bodyParser.urlencoded({extended: true}))

// Routes
const mainRouter = require("./src/routes/main")

app.use('/', mainRouter)
app.use('/article', mainRouter)

// Start server
app.listen(port, () => console.log(`Server started on port ${port}`))