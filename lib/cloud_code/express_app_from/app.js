const express = require('express');
const bodyParser = require('body-parser');
const formRouter = require('./routes/form');
const app = express();
const port = 3000;
app.use(express.static('public')); //
// Middleware to parse form data
app.use(bodyParser.urlencoded({ extended: true }));

// Use the form router
app.use('/', formRouter);

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
});