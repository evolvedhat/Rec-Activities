var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var expressValidator = require("express-validator");
var flash = require("express-flash");
var session = require("express-session");
var bodyParser = require("body-parser");

var mysql = require("mysql");
var connection = require("./database");

var indexRouter = require("./routes/index");
var minorsRouter = require("./routes/Minors");
var activitiesRouter = require("./routes/Activities");
var actIndoorRouter = require("./routes/actIndoor");
var actOutdoorRouter = require("./routes/actOutdoor");
var registrantRouter = require("./routes/Registrant");
var MyActivitiesRouter = require("./routes/MyActivities");
var ParkingRouter = require("./routes/Parking");
var MyWaiversRouter = require("./routes/MyWaivers");
var InstructorRouter = require("./routes/Instructor");
var LocationsRouter = require("./routes/Locations");
var EquipmentsRouter = require("./routes/Equipments");
var CertificationsRouter = require("./routes/Certifications");
var AquaRouter = require("./routes/Aqua");
var AdultsProgramRouter = require("./routes/AdultsProgram");
var AdminRouter = require("./routes/Admin");
var AdultRegRouter = require("./routes/AdultReg");
var MinorRegRouter = require("./routes/MinorReg");
var EditAdultsRouter = require("./routes/EditAdults");
var EditMinorsRouter = require("./routes/EditMinors");
var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use(
  session({
    secret: "123456cat",
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 },
  })
);

app.use(flash());
app.use(expressValidator());
app.use(bodyParser.urlencoded({ extended: true }));

app.use("/", indexRouter);
app.use("/Minors", minorsRouter);
app.use("/Activities", activitiesRouter);
app.use("/actIndoor", actIndoorRouter);
app.use("/actOutdoor", actOutdoorRouter);
app.use("/Registrant", registrantRouter);
app.use("/MyActivities", MyActivitiesRouter);
app.use("/Parking", ParkingRouter);
app.use("/MyWaivers", MyWaiversRouter);
app.use("/Instructor", InstructorRouter);
app.use("/Locations", LocationsRouter);
app.use("/Equipments", EquipmentsRouter);
app.use("/Certifications", CertificationsRouter);
app.use("/Aqua", AquaRouter);
app.use("/AdultsProgram", AdultsProgramRouter);
app.use("/Admin", AdminRouter);
app.use("/AdultReg", AdultRegRouter);
app.use("/MinorReg", MinorRegRouter);
app.use("/EditAdults", EditAdultsRouter);
app.use("/EditMinors", EditMinorsRouter);
// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};
  // render the error page
  res.status(err.status || 500);
  res.render("error");
});
module.exports = app;
