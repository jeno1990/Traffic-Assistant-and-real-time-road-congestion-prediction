const findNearBy = require("../../controllers/nearbyTraffic");
const helper_client=require('../../helpers/clients')
const device_locations = require('../../helpers/device_locations')


const device_location = function (req , res){
    let {lat,lon,speed}=req.body; //add plate number as reqest body
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

//to be done just demo
const add_location = function (req , res){
    let {lat,lon} = req.body;

    const obj={lat: lat, lon:lon};
    device_locations.new_location(obj);

    res.json({msg:"successfully added"});
}
// to be done just demo

const number_of_vehcle = function (req , res){
    let {lat , lon}= req.body;

    device_locations.delete_old_data();
    //for now we just return all cars in the array 
    // todo -> from the array we will find only {nearby} cars and return number of them
    var len = device_locations.number_of_cars(lat , lon); 
    res.json({msg:len})
}

module.exports={
    device_location,
    add_location,
    number_of_vehcle
}