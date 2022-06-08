require("dotenv").config();
const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
global.io = require("socket.io")(server, { cors: { origin: "*" } });

const mongoose = require("./config/mongoDB.js");
const Route = require("./routes/route");
const connect = require("./handler/socket/traffic_socket")(io);
const add_admin = require("./init/insertAdmin");
const thingspeak = require('./handler/device_handler/thingspeak_handler')

const port = process.env.API_PORT || 5000;

//test api
app.get("/", (req, res) => {
  console.log("Home page");
  res.json({ msg: "Home Page " });
});

app.use(express.json());

const connection = mongoose.connection;
connection.once("open", () => console.log("mongodb connected"));

setInterval(() => {
  thingspeak.thingspeak();
}, 60000);


app.use("/api", Route);

//to add admin on start
add_admin();

server.listen(port, () => console.log(`Server is running in port ${port}`));
