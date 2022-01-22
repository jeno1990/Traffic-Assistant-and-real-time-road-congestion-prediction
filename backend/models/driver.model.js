const mongoose =require('mongoose');
const schema = mongoose.Schema;


const Driver = new schema(
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
            required:false
        },
        phone_number:{
            type:String,
            // required: true
        },
        address:{
            type:String,
          //  required:false
        },
        password:{
            type:String,
            required: true
        },
        token: { 
            type: String 
        },

    },{timestamps:true}
);

// const Driver = mongoose.model( "Driver", Driver );

module.exports = mongoose.model( "Driver", Driver );
