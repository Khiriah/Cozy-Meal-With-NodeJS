const mongoose = require("mongoose");


const dayesPlane = new mongoose.Schema({
  
    day :{type: String,},
    title :{type:String },
    descrition:{type: String,},
    image:{type: String,},
tours:{type: mongoose.Schema.Types.ObjectId, ref:'toursmodel'},
});


module.exports = mongoose.model("dayesPlane", dayesPlane);