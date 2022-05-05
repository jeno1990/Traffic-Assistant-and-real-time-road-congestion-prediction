const findNearBy = require("../../controllers/nearbyTraffic");
const helper_client=require('../../helpers/clients')



const device_location = function (req , res){
    let {lat,lon,speed}=req.body;
    if(!lat||!lon||!speed){
        res.status(400);
        res.json({msg:"bad request"})
        return
    }

    let near_by=findNearBy(helper_client.clients,lat,lon);
    if(near_by.length==0){
        res.status(200)
        res.json({msg:"no currently available traffic found"})
        return
    }
    for(i=0;i<near_by.length;i++){
        io.to(near_by[i]).emit("message",{speed:speed,plate_num:"07721"});
    }
    res.status(200);
    res.json({msg:"report sent to nearby traffic"});
}

module.exports={
    device_location
}