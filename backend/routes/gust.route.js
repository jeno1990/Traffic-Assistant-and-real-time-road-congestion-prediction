const express= require('express');
const { gust_form } = require('../handler/gust_handler');
const router =express.Router();

router.post("/gust_form",gust_form);

  module.exports=router;