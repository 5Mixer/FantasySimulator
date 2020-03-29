const express = require('express')
const cors = require('cors')
const app = express()
const bodyParser = require('body-parser')

const port = 3000

app.use(cors())
app.use(bodyParser.json())

database = {
	items: [],
	tags: []
}

app.get('/', (req, res) => res.json(database))
app.get('/items/', (req, res) => res.json(database.items))
app.post('/items/', (req, res) => {
	console.log("item pushed:")
	console.log(req.body)
	database.items.push(req.body)
	res.json({result:'success'})
})
app.get('/tags/', (req, res) => res.json(database.items))

app.listen(port, () => console.log(`Database server listening on port ${port}!`))

