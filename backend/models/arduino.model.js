const mongoose =require('mongoose');
const schema = mongoose.Schema;


const FromHardware = new schema(
    {
       
        latitude:{
            type:String,
            
        },
        longtude:{
            type:String,
            // required: true
        },
        speed:{
            type:String,
        },
        

    },{timestamps:true}
);


module.exports = mongoose.model( "FromHardware", FromHardware );
