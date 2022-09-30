var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query("SELECT * FROM Equipment", function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Equipments", {
        page_title: "Equipments - Node.js",
        data: "",
      });
    } else {
      res.render("Equipments", {
        page_title: "Equipments - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
