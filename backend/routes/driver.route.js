const express= require('express');
const { driver_signup, driver_login,accident_report } = require('../handler/driver_handler');

const auth = require("../middlewares/auth");
const router = express.Router();

router.post("/driver_signup",driver_signup);
router.post("/driver_login",driver_login);
router.post("/home/accident_form/",accident_report);



router.get("/secured" , auth ,(req, res) => {
  res.status(200).send("Welcome 🙌 ")}
  )
  
  
  module.exports = router;