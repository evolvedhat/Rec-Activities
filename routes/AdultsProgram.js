var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT * FROM Activities WHERE Department != 'Aqua Athletics'",
    function (err, rows) {
      if (err) {
        req.flash("error", err);
        res.render("AdultsProgram", {
          page_title: "AdultsProgram - Node.js",
          data: "",
        });
      } else {
        res.render("AdultsProgram", {
          page_title: "AdultsProgram - Node.js",
          data: rows,
        });
      }
    }
  );
});

module.exports = router;
