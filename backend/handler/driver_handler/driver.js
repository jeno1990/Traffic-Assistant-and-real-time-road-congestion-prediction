const Driver = require("../../models/driver.model");
require("../../models/report_accident.model");
const helper_client = require("./../../helpers/clients");
const findNearBy = require('./../../controllers/nearby')
const DriverReported = require("./../../models/accidentDriverReported.model");
const Device_location = require('./../../models/device_locations.model')


const accident_report = function (req, res) {
  let { plate_num, driver_name, lat, lon } = req.body;
  console.log(plate_num , " " , driver_name , " ", lat , " " , lon);
  if (lat === "" || plate_num === "" || lon === "") {
    res.status(400).json({ msg: " provide all fields!!!" });
    return;
  } else {
    let report_payload = new DriverReported({
      driver_name: driver_name,
      plate_num: plate_num,
      latitude: lat,
      longitude: lon,
    });

    report_payload.save((err) => {
      if (err) {
        return res.status(500).json({ msg: "Internal server error" });
      }
      //send the infomation to nearby traffic
      let near_by = findNearBy.findNearBy(helper_client.clientsMap, lat, lon);
      for(i=0; i<near_by.length;i++){
      io.emit("accident_message", {
        driver_name: driver_name,
        plate_num: plate_num,
        Latitude: lat,
        longitude: lon,
      });
      }
      res.status(200).json({ msg: "report sent successfully" });
    });
  }
};

const all_drivers = function (req, res) {
  Driver.find({}, (err, data) => {
    if (err) {
      return res.status(500).json({ msg: "Internal server error" });
    }
    if (!data) {
      return res.status(404).json({ msg: "No driver found" });
    }
    res.status(200).json({ data: data });
  });
};

const get_vehcle_location = (req , res)=>{
  let plate_num = req.params['plate_num'];

  Device_location.find({plate_num: plate_num} , (err , data)=>{
    if (err) {
      return res.status(500).json({ msg: "Internal server error" });
    }
    if (!data) {
      return res.status(404).json({ msg: "No vehcle with this plate number" });
    }
    res.status(200).json({ data: data });
  })
}

module.exports = {
  accident_report,
  all_drivers,
  get_vehcle_location
};
