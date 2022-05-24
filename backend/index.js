require("dotenv").config();
const express = require("express");
const app = express();
const server = require("http").createServer(app);
global.io = require("socket.io")(server, { cors: { origin: "*" } });

const mongoose = require("./config/mongoDB.js");
const Route = require("./routes/route");
const connect = require("./handler/socket/traffic_socket")(io);
const add_admin = require("./init/insertAdmin");

const port = process.env.API_PORT || 5000;

app.get("/test", (req, res) => {
  res.json({ msg: "Home Page " });
});
app.use(express.json());

app.get("/",(req , res)=>{res.send("home page")});

const connection = mongoose.connection;
connection.once("open", () => console.log("mongodb ping test seccussfull!"));

app.use("/api", Route);

//to add admin on start
add_admin();

server.listen(port, () => console.log(`Server is running in port ${port}`));
