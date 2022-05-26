const mongoose = require('mongoose')

const Connections = mongoose.Schema({
    Name:{
        type:String
    },
    Scocket_id:{
        type:String
    },
    Latitude:{
        type:String
    },
    Longitude:{
        type:String
    }
});

module.exports=mongoose.model("connections",Connections)

//we might not need to use database to check for online traffics instade we can use window variable 
//never been used before