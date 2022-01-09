require('dotenv').config()
const express = require('express')
const cors = require('cors')
const app = express()
const port = process.env.PORT
const path = require('path')

app.use(cors())
app.use(express.json())

app.use('/uploads', express.static(path.join(__dirname,'../uploads')))
app.use('/api/tes', require('./routes/tes'))

app.listen(port, () => {
    console.log('App already start from port ', port);
}
)





