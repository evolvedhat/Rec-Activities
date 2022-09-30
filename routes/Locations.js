var express = require("express");
var router = express.Router();
var connection = require("../database.js");

router.get("/", function (req, res, next) {
  connection.query(
    "SELECT TakesPlace_Indoor.ActivityName, TakesPlace_Indoor.RoomNumber, TakesPlace_Indoor.BuildingName, IndoorLocation.Address FROM IndoorLocation INNER JOIN TakesPlace_Indoor ON TakesPlace_Indoor.RoomNumber = IndoorLocation.RoomNumber",
    function (err, indoorRows) {
      connection.query(
        "SELECT TakesPlace_Outdoor.ActivityName, TakesPlace_Outdoor.FieldNumber, TakesPlace_Outdoor.FieldName, OutdoorLocation.Address FROM OutdoorLocation INNER JOIN TakesPlace_Outdoor ON TakesPlace_Outdoor.FieldNumber = OutdoorLocation.FieldNumber",
        function (err, outdoorRows) {
          let rowData = { indoorRows, outdoorRows };

          if (err) {
            req.flash("error", err);
            res.render("Locations", {
              page_title: "Locations - Node.js",
              data: "",
            });
          } else {
            res.render("Locations", {
              page_title: "Locations - Node.js",
              rowData,
            });
          }
        }
      );
    }
  );
});

module.exports = router;
