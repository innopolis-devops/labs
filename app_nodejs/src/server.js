const express = require('express')
const fs = require('fs')
const path = require('path')
const VISITS_STORAGE_DIR_PATH = './storage'
const VISITS_STORAGE_FILE = 'visits.txt'
const app = express()
const PORT = process.env.PORT || 8085

const initVisitsFile = () => {
    if (!fs.existsSync(VISITS_STORAGE_DIR_PATH)){
        fs.mkdirSync(VISITS_STORAGE_DIR_PATH);
    }
    return fs.createWriteStream(`${VISITS_STORAGE_DIR_PATH}/${VISITS_STORAGE_FILE}`);
}

const writeToStorageFile = (dataToWrite) => {
    fs.appendFile(`${VISITS_STORAGE_DIR_PATH}/${VISITS_STORAGE_FILE}`, `${dataToWrite}, ` , function (err) {
        if (err) throw err;
    });
}

const getDateLocalized = () => {
    const date = new Date();
    return  date.toLocaleString('de-DE', {hour12: false, timeZone: 'Europe/Moscow'})
}

app.get('/',(req,res)=>{
    const dateLocalized = getDateLocalized()
    if (!fs.existsSync(`${VISITS_STORAGE_DIR_PATH}/`)) {
        const stream = initVisitsFile();
        stream.write(getDateLocalized())
    }else{
        writeToStorageFile(dateLocalized)
    }

    res.send(dateLocalized)
})

app.get('/visits',(req,res)=>{
    try{res.status(200).sendFile(`${VISITS_STORAGE_DIR_PATH}/${VISITS_STORAGE_FILE}`, {
        root: path.join(__dirname, '..')
    })}catch (e){
        res.status(500).send('Please, visit root path')
    }
})

app.listen(PORT, ()=> {
    console.log('server is listening on port:', PORT)
})