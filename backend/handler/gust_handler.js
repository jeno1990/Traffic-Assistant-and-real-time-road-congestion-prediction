
const Gust =require("../models/gust.model");

const gust_form=function(req,res){
    console.log('inside the gust_form');

    let { violation_type, plate_number,full_name } = req.body;
    //checks that both email and password is provided at api call
    if (violation_type === "" || plate_number === ""|| full_name === "") {
      res.json({ status: 0, data: "error", msg: " Enter all fields!!!" });
    } else {
      //check the provided email with  our database
      var gust = new Gust({
        full_name: full_name,
        violation_type: violation_type,
        plate_number: plate_number,
      });

      gust.save().then(()=>{
          console.log('gust form');
          res.status(200).json('form register successful');
      } ).catch(
          (err)=>{
              console.log('error');
              res.status(403).json(err);
          }
      );
      
        }
      
    
  }
module.exports={
gust_form}