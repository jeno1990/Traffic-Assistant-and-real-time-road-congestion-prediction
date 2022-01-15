var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/FinalProject'
// ,{  
//     // useNewUrlParser: true,  
//     useUnifiedTopology: true,  
//     useFindAndModify: false
//  }
 )
 .then((result)=>console.log("mongodb connected successfully"))
 .catch((err)=>console.log(err));

module.exports = mongoose;