var bcrypt = require("bcryptjs");
//bcryptjs is used for password hash

// Get Users model which we have created above

const Driver =require("../models/driver.model");

const driver_signup=function(req, res) {
    console.log('inside the drver_signup');

    //we will get these data from requst body i.e. we have to provide this data will calling this api
    let {full_name,email,password} = req.body;
  //verify if we go all of these data or not
    if (full_name === "" || email === "" || password === "" ) {
      //if any of the data is missing we will send this response to user
      res.json({ status: 0, data: "error", msg: " Enter all fields" });
    } else {
      //if all the data is provided, it checks that email provides is alredy used or not in our system
      Driver.findOne({ email: email }, function(err, driver) {
        if (err) console.log(err);
  
        if (driver) {
          //if used, return thi message
          res.json({ status: 0, data: driver.email, msg: " Driver already exists" });
        } else {
          //if not used, create a new obnect od our user schema and store it in it
          var driver = new Driver({
            full_name: full_name,
            email: email,
            password: password,
          });
         //then hash the provides password with  bcryptjs package
          bcrypt.genSalt(10, function(err, salt) {
            bcrypt.hash(driver.password, salt, function(err, hash) {
              // if hash error occcur send response to the user about the error
              if (err) {
                res.json({
                  status: 0,
                  data: err,
                  msg: " error while hashing password"
                });
              }
  
              driver.password = hash;
  //if everything is ok and password is hashe, then user bojcet that we created aboue will be saved in our database
              driver.save(function(err) {
                //you can use promise here
                //user.save().then().catch() you can use promise like this also
                if (err) {
                  //if error send that to user
                  res.json({ status: 0, data: err, msg: " error" });
                } else {
                  //Send response to the user that registration process is complete
                res.json({
                    status: 1,
                    data: driver,
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
  const driver_login=function(req,res){
    console.log('inside the drver_login');

    let { email, password } = req.body;
    //checks that both email and password is provided at api call
    if (email === "" || password === "") {
      res.json({ status: 0, data: "error", msg: " Enter all fields!!!" });
    } else {
      //check the provided email with  our database
      Driver.findOne({ email: email }, (err, driver) => {
        if (err) {
          res.json({ status: 0, message: err });
        }
        // if the email is not found , respond user that this email is not found
        if (!driver) {
          res.json({

            status: 0,
            msg:
              " user with this email didnot found"
          });
          } else {
          //if email found hash the password for the comparision as our system have hashed password
          bcrypt.compare(password, driver.password, (err, isMatch) => {
            if (err) {
              res.json({ status: 0, data: err, msg: " error" });
            } else {
              //if passowrd didnt match respond to the user
              if (!isMatch) {
            res.status(401)

                res.json({
                  status: 0,
                  data: isMatch,
                  msg: " Password didnt match"
                });
              } else {
                // if email and password match , respond that to user
                res.json({
                  status: 1,
                  data: {
                    id: driver.id,
                    name: driver.name,
                    email: driver.email,
                    type: driver.type
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
module.exports={
    driver_signup,driver_login
}