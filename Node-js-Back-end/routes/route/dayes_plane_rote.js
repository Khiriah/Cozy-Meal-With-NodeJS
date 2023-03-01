const express = require("express");
const dayesRoute = express.Router();

const {add_dayes_plane,getTour_plane} = require("../controller/dayes_plane_controller");

dayesRoute.post("/dayesPlane_forthetrips/:id", add_dayes_plane);
dayesRoute.get("/tour_plane/:id", getTour_plane);


module.exports = dayesRoute;
