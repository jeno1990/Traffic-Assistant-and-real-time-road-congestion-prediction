const client_helper=require('../../helpers/clients')

// var clients = [];
function connect(io) {
  //for now I used array to store current connected sockets

  io.use((socket, next) => {
    let key = socket.handshake.query.key;
    let latitude = socket.handshake.query.latitude;
    let longitude = socket.handshake.query.longitude;

    if (key) {
      console.log();
      socket.user = {
        name: key,
        latitude: latitude,
        longitude: longitude,
        socketId: socket.conn.id,
      };
      next();
    }
  });

  io.on("connection", (socket) => {

    console.log(socket.user.name, " joined ", socket.user);
    
    client_helper.add_clientToMap(socket.user); //to add the traffic to array
    
    // socket.broadcast.emit("message", "new user joined");
    
    socket.on("disconnect", function () {
      // console.log(socket.conn.id);
      client_helper.remove_client_from_map(socket.conn.id); //to delete the traffic from the array
    });

    socket.on("message", (data) => {
      console.log("the message is ", data);
    });

  });
}

module.exports = connect;
