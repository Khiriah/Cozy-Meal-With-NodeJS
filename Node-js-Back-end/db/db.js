const mongoose = require("mongoose");
mongoose.connect("mongodb://localhost:27017/Mezwalah").then(
  () => {
    console.log("DB connected");
    now = Date.now();
    console.log(`aaa ${now}`);
  },
  (err) => {
    console.log(`Error +${err}`);
  }
);
