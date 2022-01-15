const mongoose =require('mongoose');
//traffic schema
const Traffic= new mongoose.Schema(
    {
       
        email:{
            type:String,
            required:true,
            unique:true
        },
        full_name:{
            type:String,
            
            
        },
        password:{
            type:String,
            
        },
        confirm_password:{
            type:String,
            
        },
       
        

    }
);


module.exports=mongoose.model("Traffic",Traffic);
