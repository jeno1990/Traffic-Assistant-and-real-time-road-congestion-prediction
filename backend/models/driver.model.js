const mongoose =require('mongoose');
//Driver schema
const Driver= new mongoose.Schema(
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
       
        accident_type:{
            type:String,
            
        },
        plate_number:{
            type:String,
           
        },
        accident_occerance_time:{
            type:String,
           
        },
        

    }
);


module.exports=mongoose.model("Driver",Driver);
