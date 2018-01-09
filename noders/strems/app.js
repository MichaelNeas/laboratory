const express = require('express');
const app = express();

app.set('view engine', 'ejs');
//next is for finish with this middleware, go on to the next
app.use('/assets', express.static('assets'));

app.get('/', (req, res) => {
  res.render('index');
});


app.get('/qstring', (req, res) => {
  res.send(req.query);
});

app.get('/profile/:id', (req, res) => {
  const data = {age: 27, job: 'bruh'};
  res.render('profile', {id: req.params.id, data:data});
});

app.listen(3000);