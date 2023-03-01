const express = require("express");
const app = express();
const cors = require("cors")
const bodyParser = require('body-parser')
require('dotenv').config()

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
require("./db/db");
const signUpRoute = require('./routes/route/signup_rote')
const loginRoute = require('./routes/route/login_rote')
const profileRoute = require('./routes/route/profile_rote')
const toursRoute = require('./routes/route/tours_rote');
const dayesRoute = require('./routes/route/dayes_plane_rote');


app.use(express.json());
app.use(cors());

app.use(signUpRoute);
app.use(loginRoute);
app.use(profileRoute)
app.use(toursRoute)
app.use(dayesRoute)

const Port = process.env.PORT;
app.listen(Port, () => {
  console.log("server run on 5000 port ", Port);
});
