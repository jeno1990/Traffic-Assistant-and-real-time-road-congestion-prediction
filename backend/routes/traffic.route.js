const express= require('express');
const { traffic_signup, traffic_login, issued_cases, reported_cases } = require('../handler/traffic_handler');
const router =express.Router();

router.post("/traffic_signup",traffic_signup);
router.post("/traffic_login",traffic_login);
router.get("/issued_cases",issued_cases);
router.get("/reported_cases",reported_cases);


  module.exports=router;