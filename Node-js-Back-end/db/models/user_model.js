const mongoose = require("mongoose");
mongoose.set("strictQuery", false);

const userModel = new mongoose.Schema({
  email: { type: String, unique: true },
  password: { type: String },
  firstName: { type: String },
  phoneNumber: { type: Number, unique: true },
  lastName: { type: String },
  gender: { type: String, default: "" },
  photoUrl: { type: String, default: "" },
  token:{type:String ,default:''},
  country:{type:String },
  city:{type:String},
  age:{type:String},
  OTP:{type:String,default:''},
  bio:{type:String ,default:''},
  likes:[{type:mongoose.Schema.Types.ObjectId, ref: "toursmodel"}]

});

module.exports = mongoose.model("userModel", userModel);
