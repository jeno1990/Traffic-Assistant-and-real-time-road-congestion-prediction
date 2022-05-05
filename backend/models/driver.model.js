const bcrypt = require('bcryptjs/dist/bcrypt');
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
        role: {
            type:String
        },
        isActive: {
            type: Boolean,
            default : false
        },
        gender : {
            type: String 
        },
        profile_picture: {
            type: String
        }

    },{timestamps:true}
);

Driver.methods.hashPassword = function(password){
    return bcrypt.hashSync(password,bcrypt.genSaltSync(10));
}
Driver.methods.comparePassword = function(passowrd,hash){
    return bcrypt.compareSync(passowrd,hash);
}
module.exports = mongoose.model( "Driver", Driver );
