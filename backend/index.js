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

connection.once("open",()=>console.log('mongodb connected'));


setInterval( async ()=>{
    console.log("endponit");
    const url=`https://api.thingspeak.com/channels/1760569/feeds.json?api_key=5ACFV65GTC5VQJ3A&results=2`;
    const options={
      'method':"GET",
    };
    const response=await fetch(url,options)
    .then(res => res.json())
    .catch(e =>{
      console.error({
        'message':"oh no",
         error:e,
      }
  
      );
    });
    console.log("response :",response);
  //res.json(response);
   if(response) 
   {
     const thing=JSON.parse(JSON.stringify(response.feeds[0]));
    console.log(thing.field1);

   }
  //field value
  
  } 
 , 2000);

app.use("/api",Route);

//to add admin on start
add_admin();

