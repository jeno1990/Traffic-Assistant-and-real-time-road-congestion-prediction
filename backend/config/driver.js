const Driver = require("../models/driver.model");

const FindDriver = function(driver_id,callback ){
    callback(driver_id);
}
let Driver_by_Id = function(driver_id){
   Driver.findOne({_id:driver_id},(err , driver)=>{
       if(err){
           return err;
       }else{
           return driver;
       }
   })
}

// function DriverById(driver_id)
module.exports = {FindDriver,Driver_by_Id}