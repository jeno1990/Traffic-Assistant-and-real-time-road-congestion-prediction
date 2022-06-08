const mongoose =require('mongoose');
//Driver schema
const Destination= new mongoose.Schema(
    {
        name : {
            type : String, 
            required: true,
            }
    }
);


module.exports=mongoose.model("destinations", Destination);
