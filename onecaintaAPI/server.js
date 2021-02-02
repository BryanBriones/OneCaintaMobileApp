var express = require('express'),
app = express(),
port = process.env.PORT || 3000;

const sql = require('mssql')
var config = require('./database/connection'); 


var cors = require('cors');
var bodyParser = require('body-parser');


app.listen(port);

console.log('todo list RESTful API server started on: ' + port);


sql.connect(config).then(pool => {
    // Query
    console.log("Configs are correct");  
}).then(result => {
    console.log("Connected to DB");  
}).catch(err => {
    console.log("Error connecting to DB, Ensure connection properties are correct");  
});


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

var router = require('./routes')();
 
app.use('/api', router);
  
