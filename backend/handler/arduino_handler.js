const FromHardware =require("../models/arduino.model");


exports.arduino=function(data){
  console.log(data);

return function(req,res){
    console.log(data.latitude);
      //check the provided email with  our database
      var hardware = new FromHardware({
        latitude: data.latitude,
        longtude: data.longtude,
        speed: data.speed,
      });

      hardware.save().then(()=>{
          console.log('hardware saved');
          res.status(200).json('hardware saved successful');
      } ).catch(
          (err)=>{
              console.log('error');
              res.status(403).json(err);
          }
      );
      
        }
      
    
  }

