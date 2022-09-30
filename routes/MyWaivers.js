var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("MyWaivers", {
    page_title: "Parking - Node.js",
    data: "",
  });
});

router.post("/", function (req, res) {
  let accID = req.body.AccID_input;
  // ctrl+alt+L
  console.log(
    "🚀 ~ file: MyWaivers.js ~ line 16 ~ router.get ~ req.body",
    req.body
  );

  const querystring =
    "SELECT WaiverName, WaiverType FROM Adults_Signs_Waivers WHERE AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("MyWaivers", { page_title: "MyWaivers - Node.js", data: "" });
    } else {
      res.render("MyWaivers", {
        page_title: "MyWaivers - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
