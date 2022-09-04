const express = require('express')
const {getMskTime} = require("../features/time");
const mainRouter = express.Router()

/**
 * this endpoint returns current time in Moscow
 */
mainRouter.get('', async (req, res) => {
    const currentTime = getMskTime() // get from use-cases (features)
    res.render('main', {time_msk: currentTime}) // templating
})

module.exports = mainRouter