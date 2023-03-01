
const mongoose = require("mongoose");

const toursmodel = new mongoose.Schema({
 tourName:{type:String},
 owner:{type:String},
 tourImage:{type:Array},
 includ:{type: Array, default:[]},
 Exclude:{type: Array, default:[]},
 country:{type:String ,require:true},
 city:{type:String,require:true},
 isAvelable:{type:Boolean,default:true},
 startDate:{type:String},
 endDate:{type:String},
 description:{type:String},
 price:{type:Number},
 category:{type:String},
 tourTipe:{type:String},
 numOfpepole:{type:Number},
 tourType:{type:String ,require:true},
 user: { type: mongoose.Schema.Types.ObjectId, ref: "userModel" },

});

module.exports = mongoose.model("toursmodel", toursmodel);