var express = require('express');
var router = express.Router();

/* GETS about page. */
router.get('/', function(req, res, next) 
{
    // Render the about page.
 res.render('about', { title: 'About' });
});


module.exports = router;