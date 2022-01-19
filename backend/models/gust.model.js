const mongoose =require('mongoose');
//Driver schema
const Gust= new mongoose.Schema(
    {
       
        violation_type:{
            type:String,
            required:true,
        },
        full_name:{
            type:String,
            required:true,
            
            
        },

        plate_number:{
            type:String,
            required:true,
  
            },
    }
);


module.exports=mongoose.model("Gust",Gust);
