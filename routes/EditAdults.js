var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("EditAdults", { page_title: "EditAdults - Node.js", data: "" });
});

router.post("/", function (req, res) {
  let accID = req.body.AdultAccID_input;

  if (
    req.body.newName ||
    req.body.newPhone ||
    req.body.newEmail ||
    req.body.newAddress
  ) {
    console.log("editing");
    if (req.body.newName) {
      const querystring = `UPDATE AdultsInfo 
      SET FullName = ?
      WHERE AccountID = ?
      `;

      connection.query(
        querystring,
        [req.body.newName, accID],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }

    if (req.body.newPhone) {
      const querystring = `UPDATE AdultsInfo 
      SET Phone = ?
      WHERE AccountID = ?
      `;

      connection.query(
        querystring,
        [req.body.newPhone, accID],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }

    if (req.body.newEmail) {
      const querystring = `UPDATE AdultsInfo 
      SET Email = ?
      WHERE AccountID = ?
      `;

      connection.query(
        querystring,
        [req.body.newEmail, accID],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }
    if (req.body.newAddress) {
      const querystring = `UPDATE AdultsInfo 
        SET Address = ?
        WHERE AccountID = ?
        `;

      connection.query(
        querystring,
        [req.body.newAddress, accID],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }
  }

  const querystring = "SELECT * FROM AdultsInfo WHERE AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("EditAdults", {
        page_title: "EditAdults - Node.js",
        data: "",
      });
    } else {
      res.render("EditAdults", {
        page_title: "EditAdults - Node.js",
        data: rows,
      });
    }
  });
});
module.exports = router;
