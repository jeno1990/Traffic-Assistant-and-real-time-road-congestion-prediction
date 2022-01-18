const mongoose =require('mongoose');
const schema = mongoose.Schema;


const Traffic = new schema(
    {
       
        email:{
            type:String,
            required:true,
            unique:true
        },
        first_name:{
            type:String,
            // required: true
        },
        last_name:{
            type:String,
            default:"",
            required:false
        },
        password:{
            type:String,
            required: true
        },
        isActive: {
            type: Boolean,
            default: false
        },
        location:{
            latitude: {type:Number},
            longitude: {type:Number}
        }

    },{timestamps:true}
);

// const Driver = mongoose.model( "Driver", Driver );

module.exports = mongoose.model( "Traffic", Traffic );
