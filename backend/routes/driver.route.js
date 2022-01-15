const express= require('express');
const { driver_signup, driver_login,accident_report } = require('../handler/driver_handler');
const router =express.Router();

router.post("/driver_signup",driver_signup);
router.post("/driver_login",driver_login);
router.post("/Id/accident_form",accident_report);


  module.exports=router;