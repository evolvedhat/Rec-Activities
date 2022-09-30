var mysql = require("mysql");

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "PASSWORD",
  database: "rec_activities",
});

con.connect((err) => {
  if (err) {
    console.log("Error occurred while connecting to database", err);
  } else {
    console.log("Connected to database");
    var sql = "SELECT * FROM Minors";
    con.query(sql, function (err, result) {
      if (err) {
        console.log(err);
      }
      console.log("Accessed tables successfully");
    });
  }
});
module.exports = con;
