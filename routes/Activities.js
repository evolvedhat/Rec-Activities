var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query("SELECT * FROM Activities", function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Activities", {
        page_title: "Activities - Node.js",
        data: "",
      });
    } else {
      res.render("Activities", {
        page_title: "Activities - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
