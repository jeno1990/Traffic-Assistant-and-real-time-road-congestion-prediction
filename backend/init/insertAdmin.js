const Admin = require("../models/admin.model");

const add_admin = () => {
  var newadmin = new Admin({
    first_name: "admin",
    last_name: "admins_father",
    email: "admin@gmail.com",
    password: "admin",
    role: "admin",
  });

  Admin.findOne({ email: "admin@gmail.com" }, function (err, admin) {
    if (err) console.log("error while finding admin " + err);
    if (admin) {
      console.log("admin allready exists");
    } else {
      newadmin.save(function (err) {
        if (err) {
          console.log("error while adding admin " + err);
        } else {
          console.log("admin added ", newadmin);
        }
      });
    }
  });
};
module.exports = add_admin;
