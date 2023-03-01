const bcrypt = require("bcrypt");
const userModel = require("../../db/models/user_model");


const newUser = async(req, res) => {
  let { firstName,lastName, email, password ,phoneNumber,gender,city,country,age,photoUrl} = req.body;


  try {
    password = await bcrypt.hash(password, 10);
    const registered = new userModel({
      firstName,
      lastName,
      email,
      password,
      phoneNumber,
      gender,
      photoUrl,
      city,
      country,
      age,
    });


    const response = await registered.save();
    res.status(201).json(response);
  } catch (error) {
    res.send(error);
  }
};

module.exports = { newUser }




// try {
//   password = await bcrypt.hash(password,10);
//   const registered = new userModel({ firstName,lastName, email, password ,phoneNumber,gender,city,country,age,photoUrl});

// const newUser = async (req, res) => {
// let {
// firstName,
// lastName,
// email,
// password,
// phoneNumber,
// gender,
// photoUrl,
// city,
// country,
// age,
// } = req.body;