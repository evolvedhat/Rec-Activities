var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query("SELECT * FROM Minors", function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Minors", { page_title: "Minors - Node.js", data: "" });
    } else {
      res.render("Minors", { page_title: "Minors - Node.js", data: rows });
    }
  });
});

module.exports = router;
