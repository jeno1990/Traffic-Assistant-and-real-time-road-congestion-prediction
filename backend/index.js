require("dotenv").config();
const express =require('express');
const mongoose  = require('./config/mongoDB.js');
const userRoute =require('./routes/driver.route');
const userRouteTraffic =require('./routes/traffic.route');



const port =process.env.API_PORT || 5000;
const app=express();


app.use(express.json());
app.use("/driver",userRoute);
app.use("/traffic",userRouteTraffic);

const connection = mongoose.connection;

connection.once("open",()=>console.log('mongodb connected'));



app.route("/").get((req,res)=>res.json('Home page'));

app.listen(port,()=>console.log(`your server is running in port ${port}`));