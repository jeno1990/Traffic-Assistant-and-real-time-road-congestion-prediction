const express= require('express');
const  gust_form  = require('./gust.route');
const  driver  = require('./driver.route');
const  traffic  = require('./traffic.route');

const router =express.Router();
router.post("/driver",driver);
router.post("/traffic",traffic);
router.post("/gust_form",gust_form);

  module.exports=router;