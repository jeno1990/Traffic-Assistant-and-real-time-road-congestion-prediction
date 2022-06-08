const mongoose =require('mongoose');
//Driver schema
const Road= new mongoose.Schema(
    {
       
        road_name:{
            type:String,
            required:true,
        },
        speed_limit:{
            type:Number,
            required:true,   
        },

        tracking_points: [
            { latitude: String, longitude: String }
        ],
    }
);


module.exports=mongoose.model("road", Road);
