const express = require('express');
const auth = require("../middlewares/auth");
const { driver_signup, driver_login } = require('../handler/driver_handler');
const router = express.Router();

router.post("/driver_signup",driver_signup);
router.post("/driver_login",driver_login);


router.get("/secured" ,auth ,(req, res) => {
  res.status(200).send("Welcome 🙌 ")}
  )
  
  
  module.exports = router;