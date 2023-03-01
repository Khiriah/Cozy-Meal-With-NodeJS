const express = require("express");
const signUpRoute = express.Router();

const { newUser } = require("../controller/signup_controller");

signUpRoute.post("/signUp", newUser);

module.exports = signUpRoute;
