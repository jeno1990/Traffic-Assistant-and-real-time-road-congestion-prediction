var bcrypt = require("bcryptjs");
const Traffic =require("../models/traffic.model");




const traffic_signup=function(req, res) {
    console.log('inside the drver_signup');

 
    let {first_name,last_name,email,password} = req.body;
    if (first_name === "" || email === "" || password === "" ) {
      res.json({ status: 0, data: "error", msg: " Enter all fields" });
    } else {
      //if all the data is provided, it checks that email provides is alredy used or not in our system
      Traffic.findOne({ email: email }, function(err, traffic) {
        if (err) console.log(err);

        if (traffic) {
          //if used, return thi message
          res.json({ code:403 ,status: 0, data: traffic.email, msg: " Driver already exists" });
        } else {
          //if not used, create a new obnect od our user schema and store it in it
          var traffic = new Traffic({
            first_name: first_name,
            last_name : last_name,
            email: email,
            password: password,
          });
          bcrypt.genSalt(10, function(err, salt) {
            bcrypt.hash(traffic.password, salt, function(err, hash) {
              if (err) {
                res.json({
                  status: 0,
                  data: err,
                  msg: " error while hashing password"
                });
              }
              traffic.password = hash;
              traffic.save(function(err) {
                //you can use promise here
                //user.save().then().catch() you can use promise like this also
                if (err) {
                  //if error send that to user
                  res.json({code:500, status: 0, data: err, msg: "internale server error" });
                } else {
                  //Send response to the user that registration process is complete
                res.json({
                    status: 1,
                    data: traffic,
                    msg: `Thank You for registering.`
                  });
                }
              });
            });
          });
        }
      });
    }
  }

  const traffic_login = function(req,res){
   
    let { email, password } = req.body;
    //checks that both email and password is provided at api call
    if (email === "" || password === "") {
      res.json({ status: 0, data: "error", msg: " Enter all fields!!!" });
    } else {
      //check the provided email with  our database
      Traffic.findOne({ email: email }, (err, traffic) => {
        if (err) {
          res.json({code:500, status: 0, message: "internal server error" });
        }
        // if the email is not found , respond user that this email is not found
        if (!traffic) {
          res.json({
            code:404,
            status: 0,
            msg:
              "no acount found with provided email"
          });
          } else {
          //if email found hash the password for the comparision as our system have hashed password
          bcrypt.compare(password, traffic.password, (err, isMatch) => {
            if (err) {
              res.json({ status: 0, data: err, msg: " error" });
            } else {
              //if passowrd didnt match respond to the user
              if (!isMatch) {
            res.status(401)
                res.json({
                  status: 0,
                  data: isMatch,
                  msg: " user credentials doesn't match"
                });
              } else {
                // if email and password match , respond that to user
                res.json({
                  status: 1,
                  data: {
                    id: traffic.id,
                    first_name: traffic.first_name,
                    last_name:traffic.last_name,
                    email: traffic.email,
                    // type: traffic.type ??what is type

                  },
                  msg: "Welcome " + email
                });
              }
            }
          });
        }
      });
    }
  }
  const issued_cases=function (req,res) {
    //
Report_accident.find().select(' accident_type plate_number ').exec(
  (err,alart)=>{
    if(err){
      res.send("error"+err)
    }
    else{
      res.send(alart)
    }
  }
)    
  }
  const reported_cases=function (req,res) {
    Gust.find().select(' violation_type plate_number ').exec(
      (err,alart)=>{
        if(err){
          res.send("error"+err)
        }
        else{
          res.send(alart)
        }
      }
    ) 
    
      
  }
module.exports={
    traffic_signup,traffic_login,issued_cases,reported_cases,traffic_report_form
}