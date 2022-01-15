require("dotenv").config();
var mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI
// ,{  
//     // useNewUrlParser: true,  
//     useUnifiedTopology: true,  
//     useFindAndModify: false
//  }
 )
 .then((result)=>console.log("mongodb connected successfully"))
 .catch((err)=>console.log(err));

module.exports = mongoose;