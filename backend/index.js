require("dotenv").config();
const express =require('express');
const mongoose  = require('./config/mongoDB.js');
const Route = require('./routes/route');
var FromHardware=require('./models/arduino.model');
const router = require("./routes/route");


const port =process.env.API_PORT || 5000;
const app=express();
app.use(express.json());


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

app.use("/api",Route);

// app.route("/").get((req,res)=>res.json('Home page'));

app.listen(port,()=>console.log(`your server is running in port ${port}`));