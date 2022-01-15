const express =require('express');
const mongoose  = require('./config/mongoDB.js');
const port =process.env.port||5000;
const app=express();


app.use(express.json());
const connection = mongoose.connection;

connection.once("open",()=>console.log('mongodb connected'));

const userRoute =require('./routes/driver.route');
app.use("/driver",userRoute);
app.route("/").get((req,res)=>res.json('Home page'));

app.listen(port,()=>console.log(`your server is running in port ${port}`));