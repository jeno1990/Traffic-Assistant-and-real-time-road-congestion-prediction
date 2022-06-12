const express = require("express");

const middlewares = require("../middlewares/auth");
const driver_profile = require("../handler/driver_handler/driver_profile_handler");
const driver = require("../handler/driver_handler/driver");
const traffic = require("../handler/traffic_handler/traffic_profile_handler");
const gust = require("../handler/gust_handler");
const router = express.Router();
const device = require("../handler/device_handler/device");
const admin = require("../handler/admin_handler/admin_login");
const road = require("../handler/road_handler/road");
const adminApi = require("./../handler/admin_handler/admin_handler")
const vehcle = require('./../handler/admin_handler/vehcle')

//driver routes
router.post("/driver/driver_login", driver_profile.driver_login);
router.post("/driver/accident_form",middlewares.authenticate ,driver.accident_report);//<-----
router.post("/driver/send_email", driver_profile.sendEmail);// <----
router.get('/driver/get_vehcle_location/:plate_num' , driver.get_vehcle_location)
router.get(  //<-- change to all drivers
  "/driver/all_drivers",
  middlewares.authenticate,
  middlewares.Authorize(["admin", "traffic"]),
  driver.all_drivers
);

router.put(
  "/driver/change_password",
  middlewares.authenticate,
  driver_profile.change_password
);
// router.post(
//   "/driver/number_of_vehcle",
//   middlewares.authenticate,
//   device.number_of_vehcle
// );



//admin routes (react api's)
router.post("/admin/admin_login", admin.admin_login);
router.post(    
  "/traffic/traffic_signup",
  // middlewares.authenticate,
  // middlewares.Authorize(["admin"]),
  traffic.traffic_signup
);
router.post(
  "/driver/driver_signup",
  middlewares.authenticate,
  middlewares.Authorize(["admin"]),
  driver_profile.driver_signup
);
router.post("/roads/new_road", road.add_roads);
router.post("/roads/new_path", road.add_path);
router.post('/admin/add_new_vehcle' , vehcle.add_vehcle);
router.get('/admin/get_vehcle_by_plate/:plate_num' , vehcle.search_by_plateNum);
router.get('/admin/get_all_traffics' , adminApi.AllTraffics);


//traffic routes
router.post("/traffic/traffic_login", traffic.traffic_login);
router.get("/traffic/issued_cases", traffic.issued_cases);
router.get("/traffic/reported_cases", traffic.reported_cases);
router.post("/traffic/report_form", traffic.traffic_report_form);


//device routes 
router.post("/device/location_information", device.overspeed);
router.post("/device/new_location", device.add_location); //takes input lat and lon only



//road api's
router.get("/roads/list_of_roads", road.get_path_roads);
router.get("/roads/get_destinations", road.get_destinations);
router.get("/road/get_congesion_info/:road", road.get_congesion_info);




module.exports = router;
