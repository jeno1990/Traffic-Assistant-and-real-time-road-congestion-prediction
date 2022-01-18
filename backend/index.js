require("dotenv").config();
const express =require('express');
const mongoose  = require('./config/mongoDB.js');
const Route = require('./routes/driver.route');


const port =process.env.API_PORT || 5000;
const app=express();


app.use(express.json());
const connection = mongoose.connection;

connection.once("open",()=>console.log('mongodb connected'));


app.use("/api",Route);

// app.route("/").get((req,res)=>res.json('Home page'));

app.listen(port,()=>console.log(`your server is running in port ${port}`));