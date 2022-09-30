var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT FullName, AdultsInfo.AccountID FROM AdultsInfo INNER JOIN Adults_Enrolls ON AdultsInfo.AccountID = Adults_Enrolls.AccountID GROUP BY AdultsInfo.FullName, AdultsInfo.AccountID HAVING COUNT(*) = (SELECT COUNT(*) FROM Activities)",
    function (err, allRegRows) {
      connection.query(
        "SELECT `AdultsInfo`.`AccountID`, `AdultsInfo`.`FullName`, `Adults`.`ServiceCardNumber`, `AdultsInfo`.`MedicalRecord`, `AdultsInfo`.`Phone`, `AdultsInfo`.`Email`, `AdultsInfo`.`Address` FROM `Adults` INNER JOIN `AdultsInfo` ON `Adults`.`AccountID`=AdultsInfo.AccountID GROUP BY Adults.AccountID;",
        function (err, allAdultRows) {
          let rowData = { allRegRows, allAdultRows };

          if (err) {
            req.flash("error", err);
            res.render("AdultReg", {
              page_title: "AdultReg - Node.js",
              data: "",
            });
          } else {
            res.render("AdultReg", {
              page_title: "AdultReg - Node.js",
              rowData,
            });
          }
        }
      );
    }
  );
});

module.exports = router;
