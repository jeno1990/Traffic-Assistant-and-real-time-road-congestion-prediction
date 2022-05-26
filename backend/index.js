require("dotenv").config();
const express =require('express');
const mongoose  = require('./config/mongoDB.js');
const Route = require('./routes/route');
var FromHardware=require('./models/arduino.model');
const router = require("./routes/route");
var bodyParser = require('body-parser')
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const API_KEY="8UHT67ITOFDGRDHG";

const port =process.env.API_PORT || 5000;
const app=express();
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())
var SerialPort = require('serialport');
const parsers = SerialPort.parsers;

const parser = new parsers.Readline({
  delimiter: '\r\n'
});
console.log('data');


var porter = new SerialPort('COM2',{ 
  baudRate: 9600,
  dataBits: 8,
  parity: 'none',
  stopBits: 1,
  flowControl: false
});

porter.pipe(parser);
parser.on('data',function (data) {
  var jsons=JSON.parse(data);
  console.log(jsons);
  var hardware = new FromHardware({
    latitude: jsons.latitude,
    longtude: jsons.longtude,
    speed: jsons.speed,
  });

  hardware.save().then(()=>{
      console.log('hardware saved');
    //  res.status(200).json('hardware saved successful');
  } ).catch(
      (err)=>{
          console.log('error');
     //     res.status(403).json(err);
      }
  );
  //console.log(jsons)
  //arduino(jsons);
  
});


const connection = mongoose.connection;

connection.once("open",()=>console.log('mongodb connected'));


setInterval( async ()=>{
    console.log("endponit");
    const url=`https://api.thingspeak.com/channels/1638300/feeds.json?api_key=${API_KEY}&results=2`;
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

// app.route("/").get((req,res)=>res.json('Home page'));

app.listen(port,()=>console.log(`your server is running in port ${port}`));