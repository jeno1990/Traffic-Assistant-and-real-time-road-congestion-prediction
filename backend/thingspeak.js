// // Install thingspeak client or include in your package.json
// // npm install thingspeakclient


// var ThingSpeakClient = require('thingspeakclient');
// var client = new ThingSpeakClient();


// var yourWriteKey = 'EATLI1NNXUGHJ1HQ';
// var channelID = 72366;


// client.attachChannel(channelID, { writeKey:'yourWriteKey'}, callBackThingspeak);


// client.updateChannel(channelID, {field1: 7, field2: 6}, function(err, resp) {
//     if (!err && resp > 0) {
//         console.log('update successfully. Entry number was: ' + resp);
//     }
//     else {
//       console.log(err);
//     }
// });



// function callBackThingspeak(err, resp)
// {
//     if (!err && resp > 0) {
//         console.log('Successfully. response was: ' + resp);
//     }
//     else {
//       console.log(err);
//     }
// }