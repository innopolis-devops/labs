const express = require('express')

const app = express()
const PORT = process.env.PORT || 8080

app.get('/',(req,res)=>{
    const date = new Date();
    const dateLocalized = date.toLocaleString('de-DE', {hour12: false, timeZone: 'Europe/Moscow'})
    res.send(dateLocalized)
})

app.listen(PORT, ()=> {
    console.log('server is listening on port:', PORT)
})