const http = require("https");
const findNearBy = require("../../controllers/nearby");
const helper_client = require("../../helpers/clients");
const Device_location = require("../../models/device_locations.model");

const thingspeak = async () => {
  const url =
    "https://api.thingspeak.com/channels/1760569/feeds.json?api_key=5ACFV65GTC5VQJ3A&results=2";
  await http
    .get(url, (res) => {
      res.on("data", (response) => {
        // console.log("Chunk: " + response);
        if (response) {
          const thing = JSON.parse(response);
          const length = thing.feeds.length - 1;
          console.log(thing.feeds[length]);
          var feeds = thing.feeds[length];
          if (feeds.field1 >= 50) {
            overspeed(feeds.field2, feeds.field3, feeds.field1, feeds.field4);
          }
          add_new_location(feeds.field2, feeds.field3, feeds.field1,feeds.field4);
        }
      });
    })
    .on("error", (err) => {
      console.error("Error: " + err.message);
    });
};
function overspeed(lat, lon, speed, plate_num) {
  let near_by = findNearBy.findNearBy(helper_client.clientsMap, lat, lon);
  // console.log("test");
  for (i = 0; i < near_by.length; i++) {
    console.log(helper_client.clientsMap.get(near_by[i]["_id"]));
    io.emit("message", {
      speed: speed,
      plate_num: plate_num,
      latitude: lat,
      longitude: lon,
    });
    console.log("message is sent to nearby traffic");
  }
}

function add_new_location(lat, lon, speed,plate_num) {
  let new_location = new Device_location({
    latitude: lat,
    longitude: lon,
    speed: speed,
    plate_num
  });

  new_location.save((err) => {
    if (err) {
      condsole.log(err); // server error
      return;
    }
  });
}
module.exports = { thingspeak };
