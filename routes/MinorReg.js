var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT `MinorsInfo`.`AccountID`, `MinorsInfo`.`FullName`, `Minors`.`GuardianName`, `MinorsInfo`.`MedicalRecord`, `MinorsInfo`.`Phone`, `MinorsInfo`.`Email`, `MinorsInfo`.`Address` FROM `Minors` INNER JOIN `MinorsInfo` ON `Minors`.`AccountID`=MinorsInfo.AccountID GROUP BY Minors.AccountID",
    function (err, rows) {
      if (err) {
        req.flash("error", err);
        res.render("MinorReg", {
          page_title: "MinorReg - Node.js",
          data: "",
        });
      } else {
        res.render("MinorReg", {
          page_title: "MinorReg - Node.js",
          data: rows,
        });
      }
    }
  );
});

module.exports = router;
