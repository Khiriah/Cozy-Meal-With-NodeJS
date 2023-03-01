const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const userModel = require("../../db/models/user_model");

const get_user = async (req, res) => {
  try {
    const id = req.params.id;
    const user = await userModel.findOne({ _id: id });
    if (user) {
      res.status(201).json(user);
    } else {
      res.status(204).json("user not ther");
    }
    console.log(user);
  } catch (err) {
    res.status(401).json(`error ${err}`);
  }
};

const updateUserInfo = async (req, res) => {
  const id = req.params.id;
  const {
    firstName,
    lastName,
    photoUrl,
    gender,
    phoneNumber,
    city,
    country,
    age,
  } = req.body;

  const updateData = await userModel.findOneAndUpdate(
    { _id: id },
    { firstName, lastName, photoUrl, gender, phoneNumber, city, country, age },
    { new: true }
  );

  res.status(201).json(updateData);
};


const changedPass = async(req,res)=>{
    try{
     const id = req.params.id;
     const { newpassword } = req.body;
   
  const password= await bcrypt.hash(newpassword,10);
   
     await userModel.findOneAndUpdate(
       { _id: id },
       { password :password},
       { new: true }
     ).then((result)=>{
      res.status(201).json(result);


     })
   
    }catch(err){
     res.status(401).json({status:401,err})
  
    }
   };


   const likes =async (req,res)=>{
    const id = req.params.id;
  const user = req.token._id;
  try {
   const newLike=await userModel.findOne({ likes:id })
   if(newLike){
   const desLike= await userModel.findOneAndUpdate({_id:user},{$pull:{likes:id}},{new:true})

    res.status(200).json(desLike)


   }else{
    console.log("HHIII ");
 const like=  await userModel.findOneAndUpdate({_id:user},{$push:{likes:id}},{new:true})
   res.status(200).json(like);

   }
   
  } catch (error) {
    res.send(error)
  }

   }
  

   const getLikes = async(req,res)=>{
    const user = req.token._id;
    try {
      const likes = await userModel.findOne({_id:user}).populate("likes");
      res.status(200).json(likes);
    } catch (error) {
      res.send(error);
    }
  }
   module.exports = { get_user,updateUserInfo ,changedPass,likes,getLikes};

  