const dayesPlane = require("../../db/models/tours_dayes_plane");




  const add_dayes_plane = async(req,res)=>{

    const id = req.params.id;
    const {day,title,descrition,image}=req.body;
  try{
    const isTripthere = await dayesPlane.find({tours:id}).populate("tours");
    console.log(isTripthere);
    if(isTripthere == null){
      console.log('if');
      const add = new dayesPlane({
        day,title,descrition,image,
      })
      const saved = await isTripthere.save();
    }else{
      const add = new dayesPlane({
        day,title,descrition,image,tours:id
      })
      const saved =await add.save();
    }
    const dayes_plane = await dayesPlane.find({tours:id}).populate("tours");
    console.log('dddd');
  
    res.status(201).json(dayes_plane)
  
  }catch(error){
  res.send(error)
  }

}
 
const getTour_plane = async (req,res)=>{
    const id =req.params.id;
const get_the_plan = await dayesPlane.find({tours:id})
res.status(200).json(get_the_plan)
}

module.exports = {add_dayes_plane,getTour_plane};
