const mysql = require("mysql");
const config = require('../config/config.json');
const mydatabase = mysql.createConnection({
  host :    config.host,
  user:     config.user,
  password : config.password,
  database :  config.database
});



module.exports = mydatabase;