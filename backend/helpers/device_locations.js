
var device_locations = [];

function new_location(obj) {
  device_locations.push({
    value: obj,
    time: Date.now(),
  });
  console.log("inside device_locations ", device_locations);
}
function delete_old_data() {
  var time = Date.now();
  device_locations = device_locations.filter(function (item) {
    return time < item.time + 5000 * 60;
  });
  console.log("after old data removed: ", device_locations);
}

//for now just the whole array length
function number_of_cars(lat , lon){
    return device_locations.length;
}

module.exports = { delete_old_data, new_location, number_of_cars };
