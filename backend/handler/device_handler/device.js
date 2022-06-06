const findNearBy = require("../../controllers/nearby");
const helper_client = require("../../helpers/clients");
const device_locations = require("../../helpers/device_locations");
const RoadModel = require("../../models/roads.model");
const Device_location = require("../../models/device_locations.model");

const device_location = function (req, res) {
  let { lat, lon, speed } = req.body; //add plate number as reqest body
  if (!lat || !lon || !speed) {
    res.status(400);
    res.json({ msg: "bad request" });
    return;
  }

  let near_by = findNearBy(helper_client.clients, lat, lon);
  if (near_by.length == 0) {
    res.status(200);
    res.json({ msg: "no currently available traffic found" });
    return;
  }
  for (i = 0; i < near_by.length; i++) {
    io.to(near_by[i]).emit("message", { speed: speed, plate_num: "07721" });
  }
  res.status(200);
  res.json({ msg: "report sent to nearby traffic" });
};

//to be done just demo
const add_location = function (req, res) {
  let { lat, lon, speed } = req.body;

  if (lat === "" || lon === "" || speed === "") {
    res.status(400).send("bad request"); //bad request
    return;
  }
  let new_location = new Device_location({
    latitude: lat,
    longitude: lon,
    speed: speed,
  });

  new_location.save((err, data) => {
    if (err) {
      res.status(500).send("server error"); // server error
      return;
    }
  });
  res.status(200).json({ msg: "new device added" }); //ok response
};
// to be done just demo

const number_of_vehcle = function (req, res) {
  let { lat, lon } = req.body;

  device_locations.delete_old_data();
  //for now we just return all cars in the array
  // todo -> from the array we will find only {nearby} cars and return number of them
  var len = device_locations.number_of_cars(lat, lon);
  res.json({ msg: len });
};

module.exports = {
  device_location,
  add_location,
  number_of_vehcle,
};
