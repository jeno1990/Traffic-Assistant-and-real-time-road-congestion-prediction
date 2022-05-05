require("dotenv").config();
const express = require("express");
const app = express();
const server = require("http").createServer(app);
global.io = require("socket.io")(server, { cors: { origin: "*" } });

const mongoose = require("./config/mongoDB.js");
const Route = require("./routes/route");
const connect = require("./handler/socket/traffic_socket")(io);

const port = process.env.API_PORT || 5000;

app.use(express.json());

const connection = mongoose.connection;
connection.once("open", () => console.log("mongodb connected"));

app.use("/api", Route);

server.listen(port, () => console.log(`Server is running in port ${port}`));
