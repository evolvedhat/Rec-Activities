var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("EditMinors", { page_title: "EditMinors - Node.js", data: "" });
});

router.post("/", function (req, res) {
  let accID = req.body.AdultAccID_input;

  if (
    req.body.newGuardian ||
    req.body.newName ||
    req.body.newPhone ||
    req.body.newEmail ||
    req.body.newAddress
  ) {
    console.log("editing");
    if (req.body.newGuardian) {
      const querystring = `UPDATE MinorsInfo
        SET GuardianName = ?
        WHERE AccountID = ?
        `;

      connection.query(
        querystring,
        [req.body.newGuardian, accID],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }

    if (req.body.newName) {
      const querystring = `UPDATE MinorsInfo
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
      const querystring = `UPDATE MinorsInfo 
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
      const querystring = `UPDATE MinorsInfo
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
      const querystring = `UPDATE MinorsInfo
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

  const querystring = "SELECT * FROM MinorsInfo WHERE AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("EditMinors", {
        page_title: "EditMinors - Node.js",
        data: "",
      });
    } else {
      res.render("EditMinors", {
        page_title: "EditMinors - Node.js",
        data: rows,
      });
    }
  });
});
module.exports = router;
