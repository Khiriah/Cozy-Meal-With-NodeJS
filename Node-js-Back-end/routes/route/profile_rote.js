const express = require("express");
const profileRoute = express.Router();
// const upload = require('../middle_ware/upload')
const {authentication} = require("../middle_ware/auth")

const { get_user, updateUserInfo,changedPass ,likes,getLikes} = require("../controller/profile_controller");
var multer = require('multer');
const userModel = require('../../db/models/user_model')
const path = require('path')

const storage = multer.diskStorage({
    destination:(req,file,cb)=>{
        cb(null,"./uploads")

    },
    filename:(req,file,cb)=>{

        console.log(req.token._id);
        cb(null,req.token._id + ".jpg")
    }
})

const fileFilter=(req,file,cb)=>{
    if(file.mimetype == "image/jpeg" || file.mimetype == "image/png"){
        cb(null,true)
    }else{
        cb(null,false)
    }
}

const upload = multer({
    storage:storage,
    limits:{
        fileSize:1024 * 1024 * 6
    },
    filseFilter:fileFilter
});







profileRoute.get("/user/:id", get_user);
profileRoute.put("/updateuserInfo/:id", updateUserInfo);
profileRoute.patch("/change_password/:id", changedPass);
profileRoute.put("/likes/:id",authentication, likes);
profileRoute.get("/likes",authentication, getLikes);



profileRoute.patch('/add/image/:id',authentication,upload.single("img"), (req,res)=>{

 userModel.findOneAndUpdate(
    {_id:req.token._id},
    {  photoUrl:req.file.path},
    {new:true},
    (err,data) =>{
        if(err) return res.status(500).send(`ERRROR !!!!!!! ${err}`);
        // const response = {
        //     message:'image added successfully update',
        //     data:user,
        // }
        return res.status(200).json({'status':'image added successfully update',"data":data})
    }
   
)
    

})



module.exports = profileRoute;

