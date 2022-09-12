const express = require('express')

const app = express()

app.get('/',(req,res)=>{
    const date = new Date();
    const dateLocalized = date.toLocaleString('de-DE', {hour12: false, timeZone: 'Europe/Moscow'})
    res.send(dateLocalized)
})

app.listen(8000, '0.0.0.0')