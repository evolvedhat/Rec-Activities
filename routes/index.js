var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT COUNT(ActivityName) AS Total FROM Activities",
    function (err, progRows) {
      connection.query(
        "SELECT Cost, COUNT(*) as 'Programs' FROM Activities WHERE Cost < 30 GROUP BY Cost",
        function (err, costRows) {
          let rowData = { progRows, costRows };

          if (err) {
            req.flash("error", err);
            res.render("index", {
              page_title: "index - Node.js",
              data: "",
            });
          } else {
            res.render("index", {
              page_title: "index - Node.js",
              rowData,
            });
          }
        }
      );
    }
  );
});

module.exports = router;
