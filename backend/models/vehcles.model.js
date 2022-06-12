const mongoose =require('mongoose');
const schema = mongoose.Schema;


const Vehcles = new schema(
    {
       
        plate_num : {
            type : String,
            required : true
        },
        vehcle_brand : {
            type : String
        },
        color : {
            type : String
        },
        owner : {
            type : String,
            required : true
        }

    },{timestamps:true}
);


module.exports = mongoose.model( "vehcle", Vehcles );
