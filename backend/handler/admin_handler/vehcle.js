const Vehcles = require("./../../models/vehcles.model");

const add_vehcle = (req, res) => {
  let { plate_num, vehcle_brand, color, owner } = req.body;

  if (plate_num === "" || owner === "") {
    return res.status(400).json({ msg: "Bad request" });
  }
  let vehcle = new Vehcles({
    plate_num: plate_num,
    vehcle_brand: vehcle_brand,
    color: color,
    owner: owner,
  });

  vehcle.save((err) => {
    if (err) {
      return res.status(500).json({ msg: "Internal server error" });
    }
    res.status(200).json({ msg: "successfully added new vehcle" });
  });
};

const search_by_plateNum = (req, res) => {
  let plate_num = req.params["plate_num"];

  if (!plate_num) {
    return res.status(400).json({ msg: "Bad request" });
  }
  Vehcles.find({ plate_num: plate_num }, (err, data) => {
    if (err) {
      return res.status(500).json({ msg: "Internal server error" });
    }
    if (!data) {
      return res.status(404).json({ msg: "No vehcle with this plate number" });
    }
    res.status(200).json({ data: data });
  });
};

module.exports = { add_vehcle, search_by_plateNum };
