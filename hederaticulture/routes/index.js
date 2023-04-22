var express = require('express');
var router = express.Router();
var db=require('../database_connection');

var cors = require('cors');
var app = express();
 
app.use(cors());
//app.use(cors({origin: '*'}));


router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});





module.exports = router;
