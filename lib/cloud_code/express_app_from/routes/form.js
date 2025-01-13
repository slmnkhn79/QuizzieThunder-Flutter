const path = require('path');
const express = require('express');
const router = express.Router();

// Serve the form
router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../views/form.html'));
});

// Handle form submission
router.post('/submit', (req, res) => {
    const { name, email } = req.body;
    res.send(`Received the data: Name - ${name}, Email - ${email}`);
});

module.exports = router;