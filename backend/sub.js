const mqtt = require("mqtt");

var client = mqtt.connect("mqtt://broker.hivemq.com");

client.on("connect", () => {
  client.subscribe("something111");
  console.log("client has subscribed");
});

client.on("message", function (topic, message) {
  // message is Buffer
  console.log(message.toString());
  // client.end();
});
