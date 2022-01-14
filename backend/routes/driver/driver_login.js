const express= require('express');
const Driver =require("../../models/driver.model");
const router =express.Router();
var bcrypt = require("bcryptjs");


router.route("/driver_login").post((req,res)=>{
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
  });

module.exports=router;