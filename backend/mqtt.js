var mqtt = require('mqtt')

var options = {
    host: '3a628bfae3ce4dabac0ecb92c463de0b.s1.eu.hivemq.cloud',
    port: 8883,
    protocol: 'mqtts',
    username: 'final_project',
    password: 'final_project'
}

//initialize the MQTT client
var client = mqtt.connect(options);

//setup the callbacks
client.on('connect', function () {
    console.log('Connected');
});

client.on('error', function (error) {
    console.log(error);
});

client.on('message', function (topic, message) {
    //Called each time a message is received
    console.log('Received message:', topic, message.toString());
});

// subscribe to topic 'my/test/topic'
client.subscribe('valetron');

// publish message 'Hello' to topic 'my/test/topic'
client.publish('valetron', 'Hello');