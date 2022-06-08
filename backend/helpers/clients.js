//this client array will store currently online traffics each time new traffic joined to socket server
// var clients = [];
var clientsMap = new Map();
// function clientsFunction(obj){
//     clients.push(obj);
// }
// const remove_client=(id)=>{
//     clients.splice(clients.indexOf(id), 1);
// }
function add_clientToMap (client){
    clientsMap.set(client.socketId , client);
}

const remove_client_from_map=(id)=>{
    clientsMap.delete(id);
}
module.exports = {add_clientToMap , remove_client_from_map , clientsMap};
