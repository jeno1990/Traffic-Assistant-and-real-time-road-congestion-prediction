const Driver = require("../../models/driver.model");
require("../../models/report_accident.model");

const accident_report = function (req, res) {
    let { accident_type, plate_number } = req.body;
  
    if (accident_type === "" || plate_number === "") {
      res.json({ status: 0, data: "error", msg: " Enter all fields!!!" });
    } else {
      Report_accident({
        accident_type: accident_type,
        plate_number: plate_number,
      });
    }
  };

  const findDriverById = function (req, res) {
    let driver_id = req.params.driver_id;
    // console.log(driver_id);
    if (driver_id === "") {
      res.status(400);
      res.json({ msg: "driver_id field required" });
    } else {
      Driver.findOne({ _id: driver_id }, (err, driver) => {
        console.log(driver);
        if (err) {
          res.status(500);
          res.json({ msg: "internal server error" });
        } else {
          if (!driver) {
            res.status(401);
            res.json({ msg: "driver not found" });
          } else {
            res.status(200);
            res.json({
              data: {
                id: driver.id,
                first_name: driver.first_name,
                last_name: driver.last_name,
                email: driver.email,
              },
            });
          }
        }
      });
    }
  };
  module.exports={
    accident_report,
    findDriverById
  }