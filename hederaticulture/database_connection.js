



var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost', // your host name
  user: 'root',      // your database username
  password: '',      //your database password
  database: 'hederaticulture' // your database Name
}); 
conn.connect(function(err) {
  if (err) throw err;
  console.log('Database is connected !');
});
module.exports = conn;

