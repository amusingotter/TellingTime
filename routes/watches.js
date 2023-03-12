var express = require('express');
var router = express.Router();


//==================================================
// Route to list all records
//==================================================
router.get('/', function(req, res, next) {
    let query = "SELECT watch_id, model, material, movement, complications, size, price, status, manufacturer_id FROM watches";
    // execute query
    db.query(query, (err, result) => {
      if (err) {
        console.log(err);
        res.render('error');
      }
      // render the view with the records
      res.render('watches/allrecords', { allrecs: result });
    });
  });
  
// ==================================================
// Route to view one specific record. Notice the view is one record
// ==================================================

router.get('/:recordid/show', function(req, res, next) {
    let query = "SELECT watch_id, model, material, movement, complications, size, price, status, manufacturer_id FROM watches WHERE watch_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => {
      if (err) {
        console.log(err);
        res.render('error');
      } else {
        res.render('watches/onerec', {onerec: result[0]});
      }
    });
  });
  
// ==================================================
// Route to show empty form to obtain input form end-user.
// ==================================================
router.get('/addrecord', function(req, res, next) {
    res.render('watches/addrec');
    });



// ==================================================
// Route to obtain user input and save in database.
// ==================================================

router.post('/', function(req, res, next) {
    let insertquery = "INSERT INTO watches (model, material, movement, complications, size, price, status, manufacturer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
  
 
  
    db.query(insertquery,[req.body.model, req.body.material, req.body.movement, req.body.complications, req.body.size, req.body.price, req.body.status, req.body.manufacturer_id], (err, result) => {
      if (err) {
        console.log(err);
        res.render('error');
      } else {
        res.redirect('/watches');
      }
    });
  });


// ==================================================
// Route to edit one specific record.
// ==================================================

router.get('/:recordid/edit', function(req, res, next) {
    let query = "SELECT watch_id, model, material, movement, complications, size, price, status, manufacturer_id FROM watches WHERE watch_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => {
      if (err) 
      {
        console.log(err);
        res.render('error');
      } 
      else
       {
        res.render('watches/editrec', { onerec: result[0] });
      }
    });
  });
  
  
// ==================================================
// Route to save edited data in database.
// ==================================================


router.post('/save', function(req, res, next) {
    let updatequery = "UPDATE watches SET model = ?, material = ?, movement = ?, complications = ?, size = ?, price = ?, status = ?, manufacturer_id = ? WHERE watch_id = " + req.body.watch_id;
 

    db.query(updatequery,[req.body.model, req.body.material, req.body.movement, req.body.complications, req.body.size, req.body.price, req.body.status, req.body.manufacturer_id],(err, result) => {
      if (err) 
      {
        console.log(err);
        res.render('error');
      } 
      else
      {
        res.redirect('/watches');
      }
    });
  });

// ==================================================
// Route to delete one specific record.
// ==================================================

router.get('/:recordid/delete', function(req, res, next) {
    let query = "DELETE FROM watches WHERE watch_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => 
    {
      if (err) 
      {
        console.log(err);
        res.render('error');
      } 
      else 
      {
        res.redirect('/watches');
      }
    });
  });  

module.exports = router;