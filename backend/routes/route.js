const express = require("express");

const auth = require("../middlewares/auth");
const driver_profile = require("../handler/driver_profile_handler");
const driver = require("../handler/driver_handler/driver");
const traffic = require("../handler/traffic_profile_handler");
const gust = require("../handler/gust_handler");
const router = express.Router();
const device = require("../handler/device_handler/device");

//driver routes
router.post("/driver/driver_signup", driver_profile.driver_signup);
router.post("/driver/driver_login", driver_profile.driver_login);
router.post("/driver/accident_form", driver.accident_report);
router.post("/driver/send_email", driver_profile.sendEmail);
router.get("/driver/driver_by_id/:driver_id", auth, driver.findDriverById);
router.put("/driver/change_password", auth, driver_profile.change_password);

router.post("/driver/number_of_vehcle", device.number_of_vehcle)

//traffic routes
router.post("/traffic/traffic_signup", traffic.traffic_signup);
router.post("/traffic/traffic_login", traffic.traffic_login);
router.get("/traffic/issued_cases", traffic.issued_cases);
router.get("/traffic/reported_cases", traffic.reported_cases);
router.post("/traffic/report_form", traffic.traffic_report_form);

//device routes
router.post("/device/location_information", device.device_location);
router.post("/device/new_location",device.add_location); //takes input lat and lon only
//routers that weill be implemted
/*
  change password
  send emails to the traffic on signup by 
  traffic analysis -send data informations about a single traffic 
                   -send data info about multiple traffics in a certain region
                   -
  
*/

//gust routes
router.post("/gust/gust_form", gust.gust_form);
module.exports = router;
