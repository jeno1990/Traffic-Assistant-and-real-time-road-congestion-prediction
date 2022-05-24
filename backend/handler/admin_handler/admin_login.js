const admin = require("../../models/admin.model");
const jwt = require("jsonwebtoken");

const admin_login = (req, res) => {
  let { email, password } = req.body;

  if (email === "" || password === "") {
    res.status(400).json({ msg: "ALL FIELDS SHOULD BE FEELED!" });
    return;
  }
  admin.findOne({ email: email }, function (err, admin) {
    if (err) {
      res.status(500).json({ msg: "server error" });
      return;
    }
    if (!admin) {
      res.status(404).json({ msg: "no acount found" });
      return;
    } else {
      const token = jwt.sign({ admin }, process.env.TOKEN_KEY);
      admin.token = token;
      res.status(200).json({ admin: admin });
    }
  });
};

module.exports = { admin_login };
