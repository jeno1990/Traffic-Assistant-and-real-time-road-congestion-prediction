const mongoose =require('mongoose');
//Driver schema
const Path= new mongoose.Schema(
    {
        //here how to add (megenagna - > 6 kilo ) and (6 kilo - > megenagna)
        starting_point : String,
        destination : String,
        list_of_roads: [
             String 
        ],
    }
);


module.exports=mongoose.model("path", Path);
