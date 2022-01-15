const mongoose =require('mongoose');
//traffic form schema
const Traffic_form= new mongoose.Schema(
    {
        traffic_id:{
            type:ObjectId,
            
        },
       
                violtion_type:{
                    type:String,
                    
                },
                plate_number:{
                    type:String,
                   
                },
                action_taken:{
                    type:String,
                   
                },
                driver_name:{
                    type:String,
                   
                },
                comment:{
                    type:String,
                   
                },


       
        

    }
);


module.exports=mongoose.model("Traffic_form",Traffic_form);
