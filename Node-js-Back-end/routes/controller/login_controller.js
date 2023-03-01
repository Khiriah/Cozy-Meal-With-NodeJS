const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const userModel = require("../../db/models/user_model");
const nodemailer = require("nodemailer");
const logIn = async (req, res) => {
  let { email, password } = req.body;

  try {
    const user = await userModel.findOne({ email: email });
    if (user) {
      const check_password = await bcrypt.compare(password, user.password);
      if (check_password === true) {
        const payload = { _id: user._id, userName: user.firstName };
        const token = jwt.sign(payload, "ABC");

        
        res.status(200).json({ token,_id: user._id , owner:user.firstName});

      } else {
        res.status(403).json("wrong PassWord!");
      }
    } else {
      res.status(404).json("wrong Email!");
    }
  } catch (error) {
    res.send(error);
  }
};

const resetPasswordMail = async (email, otp) => {
  try {
    const transpot = await nodemailer.createTransport({
      service: "gmail",
      secure: false,
      requireTLS: true,
      auth: {
        user: "mezwalahmails@gmail.com",
        pass: "mlyacwtgldfyymrf",
      },
    });

    const mailOptions = {
      from: "mezwalah",
      to: email,
      subject: `For reset password`,
      html: `your OTP is ${otp}`,
    };

    transpot.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log("mail has been send", info.response);
      }
    });
  } catch (err) {
    res.status(400).send({ success: false, msg: err.message });
  }

  }


// const forgotPassword = async (req,res)=>{

//   try{
   
//     const {email} = req.body
//    const userData = await  userModel.findOne({email});
//    if(userData){

// let otp = Math.random();
// otp = otp * 1000000;
// otp = parseInt(otp);
// if (otp[0] == 0) {
//   let otp = Math.random();
// } else {
//   otp = parseInt(otp);
// }
// const updateData = await userModel.findOneAndUpdate(
//   { _id: userData },
//   { OTP :otp},
//   { new: true }
// );

// };


// //////////

const forgotPassword = async (req, res) => {
  try {
    const { email } = req.body;
    const userData = await userModel.findOne({ email });
    if (userData) {
      let otp = Math.random();
      otp = otp * 1000000;
      if (otp[0] == 0) {
        let otp = Math.random();
      } else {
        otp = parseInt(otp);
      }

      const updateData = await userModel.findOneAndUpdate(
        { _id: userData },
        { OTP: otp },
        { new: true }
      );

      await resetPasswordMail(updateData.email, updateData.OTP);
      await res.status(200).json(
        // success: true,
        // msg: "please check your email inbox to got OTP",
        // user: updateData
        updateData
      );
    } else {
      res
        .status(200)
        .json({ success: true, msg: "This email does not exists." });
    }
  } catch (err) {
    res.status(400).send({ success: false, msg: `ERROR ${err.message}` });
  }
};

const verifyOTP = async (req, res) => {
  try {
    const id = req.params.id;
    const { otp } = req.body;
    const user = await userModel.findById({ _id: id });

    console.log(user);

    if (user.OTP === otp) {
      const updateData = await userModel.findByIdAndUpdate(
        { _id: id },
        { OTP: "" },
        { new: true }
      );

     await res.status(201).json(user);
      console.log("correct");
    } else {
      res.status(201).json({ otp: "otp not correct" });
    }
  } catch (error) {
await    res.status(400).json({ msg: `ERRRor ${error.message}` });
  }
};

module.exports = {logIn, forgotPassword, verifyOTP}
