const mqtt = require("mqtt");
const clientId = "jgmGZKIe7J"
// const clientId = `mqtt_${Math.random().toString(16).slice(3)}`;
var client = mqtt.connect("mqtt://broker.hivemq.com" , {
  // clientId,
  // username:"user",
  // password:"user"
  });

client.on("connect", function () {
  // setInterval(function () {
  //   var random = Math.random() * 50;

  //   console.log(random);

  //   if (random < 30) {
    console.log('Connected');
    
  //   }
  // })
  // ,
  //   300000;
});
client.publish("something111", "temperature value: ");
client.on("error", function (err) {
  console.log(err);
  // process.exit(1);
});
