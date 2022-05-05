
function findDistace(lat1, lat2, lon1, lon2) {
  // The math module contains a function
  // named toRadians which converts from
  // degrees to radians.
  lon1 = (lon1 * Math.PI) / 180;
  lon2 = (lon2 * Math.PI) / 180;
  lat1 = (lat1 * Math.PI) / 180;
  lat2 = (lat2 * Math.PI) / 180;

  // Haversine formula
  let dlon = lon2 - lon1;
  let dlat = lat2 - lat1;
  let a =
    Math.pow(Math.sin(dlat / 2), 2) +
    Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dlon / 2), 2);

  let c = 2 * Math.asin(Math.sqrt(a));

  // Radius of earth in kilometers. Use 3956
  // for miles
  let r = 6371;

  // calculate the result
  return c * r;
}

function findNearBy(clients , lat , lon){
    var nearTraffic=[]
    for(i=0;i<clients.length;i++){
        //this function calculates relative distance between traffics array and 
        //the device location(car location) and if less than 3km it adds to list
        let distance=findDistace(clients[i].latitude , lat , clients[i].longitude, lon);
        console.log(distance, "Km" ," near_by")
        if(distance<=3){
            //socket id of users near to incident
            nearTraffic.push(clients[i].socketId);  
        }
    }
    return nearTraffic
}

module.exports=findNearBy;