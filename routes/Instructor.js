var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("Instructor", {
    page_title: "Instructor - Node.js",
    data: "",
  });
});

router.post("/", function (req, res) {
  let accID = req.body.AccID_input;
  // ctrl+alt+L

  const querystring =
    "SELECT Instructor.AccountID, Instructor.FullName, Supervisor.SupFullName, Supervisor.Department FROM Instructor INNER JOIN Supervise ON Instructor.AccountID = Supervise.InsAccountID INNER JOIN Supervisor ON Supervise.SupAccountID = Supervisor.AccountID AND Instructor.AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("Instructor", {
        page_title: "Instructor - Node.js",
        data: "",
      });
    } else {
      res.render("Instructor", {
        page_title: "Instructor - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
