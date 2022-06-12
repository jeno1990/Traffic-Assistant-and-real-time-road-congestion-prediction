const RoadModel = require("../../models/roads.model");
const PathModel = require("../../models/path.model");
const pathModel = require("../../models/path.model");
const Destination = require("../../models/destinations.model");
const Device_location = require("../../models/device_locations.model")
const nearby_controller = require("../../controllers/nearby")

const add_roads = function (req, res) {
  let { road_name, speed_limit, tracking_points } = req.body;
  let roads = new RoadModel({
    road_name: road_name,
    speed_limit: speed_limit,
    tracking_points: tracking_points,
  });

  if (road_name === "" || speed_limit === "" || !tracking_points) {
    res.status(400).json({ msg: "BAD REQUEST!0" });
    return;
  }
  roads.save((err, data) => {
    if (err) {
      res.status(500).json({ msg: "SERVER ERROR" });
      return;
    }
    res.status(200).json({ msg: "road succesfully added", _id: data._id });
  });
};

function addDestination(name) {
  var newDestination = new Destination({
    name: name,
  });
  newDestination.save((err) => {
    if(err){
        console.log(err);
        return;
    }
  });
}

const add_path = function (req, res) {
  const { starting_point, destination, list_of_roads } = req.body;

  //if the destination or the statrting point is new then add it to the database
  Destination.findOne({ name: starting_point }, (err, data) => {
    if (!data) {
      addDestination(starting_point);
    }
  });
  Destination.findOne({ name: destination }, (err, data) => {
    if (!data) {
      addDestination(destination);
    }
  });
  console.log("list of roads : "+ list_of_roads);
  if (!list_of_roads) {
    res.status(400).json({ msg: "BAD REQUEST!" });
    return;
  }
  let path = new PathModel({
    starting_point: starting_point,
    destination: destination,
    list_of_roads: list_of_roads,
  });
  path.save((err, data) => {
    if (err) {
      res.status(500).json({ msg: "SERVER ERROR" });
      return;
    }
    console.log("path added");
    res.status(200).json({ msg: "successfully added new path", _id: data._id });
  });
};
//to get roads of the a certain roads
const get_path_roads = function (req, res) {
  let starting_point = req.query.sp;
  let destination = req.query.des;
  console.log("st: "+starting_point+" des: "+destination);
  if (starting_point == "" || destination === "") {
    res.status(400).json({ msg: "BAD REQUEST" });
    return;
  }
  //checks megenagna -> 6kilo
  pathModel.findOne(
    { starting_point: starting_point, destination: destination },
    (err, data) => {
      if (err) {
        res.status(500).json({ msg: "SERVER ERROR" });
        return;
      }
      if (!data) {
        //checks 6kilo -> megenagna
        pathModel.findOne(
          { starting_point: destination, destination: starting_point },
          (err2, data2) => {
            if (!data2) {
              res.status(404).json({ msg: "The path has not been registerd" });
              return;
            }
            res.status(200).json({ list_of_roads: data2.list_of_roads });
          }
        );
      } else {
        res.status(200).json({ list_of_roads: data.list_of_roads });
      }
    }
  );
};

//to return list of destinations available
const get_destinations = function (req, res) {
  Destination.find({}, (err, data) => {
    if (err) {
      res.status(500).json({ msg: "server error" });
      return;
    }
    if (!data) {
      res.status(404).json({ msg: "There are no destinations saved" });
    }
    res.status(200).json({ data: data });
  });
};

//will have a lot of computations to get real info about crowdedness
const get_congesion_info = function async (req, res) {
    //this takes the road as ans argument and find saved points for computation
    let road = req.params.road;
    if(!road) {
        res.status(400).json({msg : "The request payload should contain road name"})
        return;
    }
    var number_of_vehcle = 0; 
    RoadModel.find({road_name : road} , (err , data)=>{
        if(err){
            res.status(500).json({msg : "Internal server error"});
            return;
        }
        if(!data){
            res.status(404).json({msg : "The requird road has not been registerd"});
            return;
        }
        var tracking_points = data[0].tracking_points;

        //for each points registerd for that road find the number of vehcles moving and sumup to find total
        Device_location.find({})
        .exec()
        .then((data)=>{
            for(i=0; i<data.length ;i++){
                number_of_vehcle += calculate_number_of_moving_vehcles(tracking_points[i] , data);
            }
            res.status(200).json({number_of_cars : number_of_vehcle});
        })
        .catch((err)=>{
            res.status(500).json({msg : "Internal server error"});
        })
    
    })
    
};
// const number_of_cars =  (tracking_points)=>{
//     let number_of_vehcle = 0;
//     Device_location.find({})
//        .then( (data)=>{
//         //    console.log(data);
            // for(i=0; i<data.length ;i++){
            //     number_of_vehcle += calculate_number_of_moving_vehcles(tracking_points[i] , data);
            // }
//             console.log("number_of_vehcle : "+number_of_vehcle);
//             return number_of_vehcle;
//        }).catch( (err)=>{
//         return 0;
//        });
// }
function calculate_number_of_moving_vehcles(point , totalVehcles){
    return nearby_controller.num_of_NearByVehcles(totalVehcles, point.latitude , point.longitude);
}

module.exports = {
  add_roads,
  add_path,
  get_path_roads,
  get_destinations,
  get_congesion_info
};
