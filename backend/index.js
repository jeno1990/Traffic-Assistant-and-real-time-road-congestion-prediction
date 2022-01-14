const express =require('express');
const mongoose  = require('mongoose');
const port =process.env.port||5000;
const app=express();

mongoose.connect('mongodb://localhost:27017/FinalProject'
// ,{  
//     useNewUrlParser: true,  
//     useUnifiedTopology: true,  
//     useFindAndModify: false
//  }
 );
const connection =mongoose.connection;
connection.once("open",()=>console.log('mongodb connected'));
app.use(express.json());
const userRoute =require('./routes/driver/driver_login');
app.use("/driver",userRoute);
app.route("/").get((req,res)=>res.json('your first rest ap2i'));
app.listen(port,()=>console.log(`your server is running in port ${port}`));