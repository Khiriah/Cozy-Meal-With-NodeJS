const express = require("express");
const toursRote = express.Router();

const { add_tour,get_tours,local,international,experience_tour,trips_tour} = require("../controller/tours_controller");
const {authentication} = require("../middle_ware/auth")


toursRote.post("/add_tours" ,authentication,add_tour);
toursRote.get("/all_tours" ,get_tours);
toursRote.get("/local" ,local);
toursRote.get("/international" ,international);

toursRote.get("/experience" ,experience_tour);
toursRote.get("/trips" ,trips_tour);


module.exports = toursRote;
