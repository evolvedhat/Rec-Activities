var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("Certifications", {
    page_title: "Certifications - Node.js",
    data: "",
  });
});

router.post("/", function (req, res) {
  let accID = req.body.AccID_input;
  // ctrl+alt+L

  const querystring = "SELECT * FROM QualifiesFor WHERE AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Certifications", {
        page_title: "Certifications - Node.js",
        data: "",
      });
    } else {
      res.render("Certifications", {
        page_title: "Certifications - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
