const jwt = require("jsonwebtoken");
require("dotenv").config();

const config = process.env;

const authenticate = (req, res, next) => {
  // const token = req.body.token || req.query.token || req.headers["Authorization"];
  // console.log(req.headers);
  const token =
    req.body.token || req.query.token || req.headers["x-access-token"];
  if (!token) {
    return res.status(403).send("valid token required!");
  }
  try {
    const decoded = jwt.verify(token, config.TOKEN_KEY);
    req.user = decoded;
    // console.log(req.user);
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }
  // const bearer = token.split(' ');
  // const bearerToken=bearer[1];
  // req.token=bearerToken;
  return next();
};
//before authorization is called there must be authentication because role is taken from the token
const Authorize = (Permission) => {
  return (req, res, next) => {
    const Role = req.user.admin.role; //this is from the token
    if (Permission.includes(Role)) {
      next();
    } else {
      res.status(401).json({ msg: "unauthorized user" });
    }
  };
};
module.exports = { authenticate, Authorize };
