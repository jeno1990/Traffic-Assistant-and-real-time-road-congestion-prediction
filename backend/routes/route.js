const express= require('express');
// const fetch= require("node-fetch");
// mod.cjs
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const API_KEY="8UHT67ITOFDGRDHG";
const auth = require("../middlewares/auth");
const driver = require('../handler/driver_handler');
const traffic =  require('../handler/traffic_handler');
const gust =require('../handler/gust_handler');
const { thingspeak_handler } = require('../handler/thingspeak_handler');
const router = express.Router();


//driver routes
router.post("/driver/driver_signup",driver.driver_signup);
router.post("/driver/driver_login",driver.driver_login);
router.post("/driver/accident_form",driver.accident_report);

router.get("/driver/driver_by_id/:driver_id",auth,driver.findDriverById)

//traffic routes
router.post("/traffic/traffic_signup",traffic.traffic_signup);
router.post("/traffic/traffic_login",traffic.traffic_login);
router.get("/traffic/issued_cases",traffic.issued_cases);
router.get("/traffic/reported_cases",traffic.reported_cases);
router.post("/traffic/report_form",traffic.traffic_report_form);


//gust routes

router.post("/gust/gust_form",gust.gust_form);

//thingspeak route
// router.get("/thingspeak",thingspeak_handler)


  module.exports = router;