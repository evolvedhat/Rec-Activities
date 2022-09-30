var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("Parking", {
    page_title: "Parking - Node.js",
    data: "",
  });
});

router.post("/", function (req, res) {
  let accID = req.body.AccID_input;
  // ctrl+alt+L
  console.log(
    "🚀 ~ file: Parking.js ~ line 16 ~ router.get ~ req.body",
    req.body
  );

  const querystring =
    "SELECT AdultsInfo.FullName, AdultsInfo.AccountID, PaysFor.LicencePlateNumber FROM PaysFor INNER JOIN AdultsInfo ON PaysFor.AccountID = AdultsInfo.AccountID AND PaysFor.AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Parking", { page_title: "Parking - Node.js", data: "" });
    } else {
      res.render("Parking", { page_title: "Parking - Node.js", data: rows });
    }
  });
});

module.exports = router;
