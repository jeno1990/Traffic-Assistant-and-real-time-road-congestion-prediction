const jwt = require("jsonwebtoken");
require("dotenv").config();

const config = process.env;

const verifyToken = (req, res, next) => {
  // const token = req.body.token || req.query.token || req.headers["Authorization"];
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

module.exports = verifyToken;
