const express = require("express");
const app = express();

var url = require("url");
var path = require("path");

// app.use(express.static(__dirname + "/public"));
// app.use("/public", express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, "stylesheets")));

app.get("/", (req, res) => {
  res.send("Successful response.");
});

app.listen(3000, () => console.log("Example app is listening on port 3000."));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.get("/public", (req, res) => {
  res.sendFile(__dirname + "/stylesheets/style.css");
});
