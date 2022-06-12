const Traffic = require('./../../models/traffic.model')



const AllTraffics = (req , res)=>{
    Traffic.find({} , (err, data)=>{
        if(err){
            return res.status(500).json({msg : "Internal Server error"});
        }
        if(!data){
            return res.json({msg : "No registered traffic"});
        }
        res.status(200).json({data : data});
    })
}

module.exports = { AllTraffics }
