var express = require('express');
var router = express.Router();

// GET contact page
router.get('/', function(req, res, next)
 {
    // Render the contact page
    res.render('contact', { title: 'Contact' });
});

module.exports = router;