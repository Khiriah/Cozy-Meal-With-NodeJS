const express = require("express");
const loginRoute = express.Router();

const {
  logIn,
  forgotPassword,
  verifyOTP,
} = require("../controller/login_controller");

loginRoute.post("/login", logIn);
loginRoute.post("/forget-password", forgotPassword);
loginRoute.put("/verifyOTP/:id", verifyOTP);

module.exports = loginRoute;
