const mongoose =require('mongoose');
//Driver  report schema
const Reported_accident= new mongoose.Schema(
    {
            driver_id:{
                type:mongoose.Schema.ObjectId,
                
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


module.exports=mongoose.model("Reported_accident",Reported_accident);
