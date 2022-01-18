const express= require('express');
const { traffic_signup, traffic_login, issued_cases, reported_cases, traffic_report_form } = require('../handler/traffic_handler');
const router =express.Router();

router.post("/traffic_signup",traffic_signup);
router.post("/traffic_login",traffic_login);
router.post("/Id/report_form",traffic_report_form);


router.get("/Id/issued_cases",issued_cases);
router.get("/Id/reported_cases",reported_cases);


module.exports=router;