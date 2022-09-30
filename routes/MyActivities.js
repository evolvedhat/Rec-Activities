var express = require("express");
var router = express.Router();
var connection = require("../database.js");
const bodyParser = require("body-parser");
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/", function (req, res) {
  res.render("MyActivities", {
    page_title: "MyActivities - Node.js",
    data: "",
  });
});

router.post("/", function (req, res) {
  let accID = req.body.AccID_input;
  // ctrl+alt+L
  console.log(
    "🚀 ~ file: Registrant.js ~ line 16 ~ router.get ~ req.body",
    req.body
  );

  if (req.body.newActivity || req.body.deleteActivity) {
    console.log("editing");
    if (req.body.newActivity) {
      const querystring = `INSERT INTO Adults_Enrolls
    (AccountID, ActivityName) VALUES (?, ?)
    `;

      connection.query(
        querystring,
        [accID, req.body.newActivity],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }
    if (req.body.deleteActivity) {
      const querystring = `DELETE FROM Adults_Enrolls
      WHERE AccountID = ? AND ActivityName = ?
      `;

      connection.query(
        querystring,
        [accID, req.body.deleteActivity],
        function (err, rows) {
          console.log("rows", rows);
          console.log("err", err);
        }
      );
    }
  }

  const querystring = "SELECT * FROM Adults_Enrolls WHERE AccountID = ?";
  connection.query(querystring, [accID], function (err, rows) {
    if (err) {
      req.flash("error", err);
      res.render("MyActivities", {
        page_title: "MyActivities - Node.js",
        data: "",
      });
    } else {
      res.render("MyActivities", {
        page_title: "MyActivities - Node.js",
        data: rows,
      });
    }
  });
});

module.exports = router;
