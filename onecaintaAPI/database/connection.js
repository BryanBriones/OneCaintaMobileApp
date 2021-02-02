//const sql = require('mssql')

// Create connection to database

const config = {
  user: "onecaintaadmin", // update me
  password: "tanginamomayor", // update me
  server: 'localhost\\SQLEXPRESS', //updateto OnlineServer orDNSname e.g. onecainta.net
  database: "OneCainta",//update me,
  options: {
         encrypt: false, // change true this if WIndows Azure
         enableArithAbort: true
     },
  pool: {
    max: 10,
     min: 5,
    idleTimeoutMillis: 30000
  }
}


module.exports = config;