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
        report_form:[
            {
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
        ]
       
       
        

    }
);


module.exports=mongoose.model("Traffic",Traffic);
