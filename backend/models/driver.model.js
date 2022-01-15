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
      
        
        

    }
);


module.exports=mongoose.model("Driver",Driver);
