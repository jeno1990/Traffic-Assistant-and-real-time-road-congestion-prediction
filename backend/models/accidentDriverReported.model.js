const mongoose =require('mongoose');
const schema = mongoose.Schema;


const DriverReported = new schema(
    {
       
        latitude:{
            type:String,
        },
        longitude:{
            type:String,
        },
        plate_num:{
            type:String,
        },
        driver_name:{
            type : String,
        }

    },{timestamps:true}
);


module.exports = mongoose.model( "reportedAccident", DriverReported );
