
const toursmodel = require('../../db/models/tours_models')



const add_tour = async(req,res)=>{

  const user = req.token.userName
  const { tourName, tourImage ,include,Exclude
    ,country,city,isAveliable,startDate,endDate,tourType,
    description,price,category,numOfpepole
  } = req.body;

    const new_tour = new toursmodel({tourName, tourImage ,include,
      Exclude,country,city,isAveliable,startDate,owner:user,tourType,
      endDate,description,price,category,numOfpepole});
  
    try {
      const response =  new_tour.save();
      const tours = await toursmodel.find({owner:user}).populate("owner");

        res.status(201).json(tours);
    } catch (error) {
      res.status(403).json(error);
    } 

}

const get_tours=async(req,res)=>{
  try{
    const allTours = await toursmodel.find({});
res.status(200).send(allTours)

  }catch(error){
    res.status(400).send(error)
  }

}

const international = async(req,res)=>{

    const international = await toursmodel.find({}).where('country')
let result = international.filter(it => it.country != 'saudi arabia');
res.status(201).json(result)
    
    
}

const local = async (req, res) => {
  const getTrips = await toursmodel
    .find({country:"saudi arabia"})
        res.status(200).json(getTrips)
     
    }


const experience_tour = async(req,res)=>{
  
  const getExperience = await toursmodel
    .find({tourType:"experience"})
    if(getExperience){
      res.status(200).json(getExperience)
    }else{
      res.status(400).json({message:'no experience tours here'})

    }
}


const trips_tour=async (req,res)=>{
  const getTrips = await toursmodel
  .find({tourType:"trip"})
  if(getTrips){
    res.status(200).json(getTrips)

  }else{
    res.status(400).json({message:'no Trips tours here'})

  }

}

module.exports={add_tour,get_tours,international,local,experience_tour,trips_tour};