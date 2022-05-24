const mongoose =require('mongoose');
const schema = mongoose.Schema;


const Admin = new schema(
    {
        email:{
            type:String,
            required:true,
            unique:true
        },
        first_name:{
            type:String,
            required: true
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
        location:{
            latitude: {type:Number},
            longitude: {type:Number}
        },
        role: {
            type:String , 
            required :true,
        },
        token: { 
            type: String 
        }

    },{timestamps:true}
);

// const Driver = mongoose.model( "Driver", Driver );

module.exports = mongoose.model( "Admin", Admin );
