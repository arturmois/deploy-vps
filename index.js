import express from 'express'

const app = express()

app.get('/health', (req, res) => {
  res.send('ok')
})

app.listen(3000, () => {
  console.log('HTTP Server Running')
})