var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT * FROM Activities WHERE Department != 'Adults Program'",
    function (err, rows) {
      if (err) {
        req.flash("error", err);
        res.render("Aqua", {
          page_title: "Aqua - Node.js",
          data: "",
        });
      } else {
        res.render("Aqua", {
          page_title: "Aqua - Node.js",
          data: rows,
        });
      }
    }
  );
});

module.exports = router;
