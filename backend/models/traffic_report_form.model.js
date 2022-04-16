const mongoose =require('mongoose');
const { schema } = require('./driver.model');
//traffic form schema
const Traffic_form= new mongoose.Schema(
    {
        traffic_id:{
            type:mongoose.Schema.ObjectId,
            
        },
       
        violation_type:{
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

    },{timestamps:true}
);


module.exports=mongoose.model("Traffic_form",Traffic_form);
