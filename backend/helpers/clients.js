//this client array will store currently online traffics each time new traffic joined to socket server
var clients = [];
function clientsFunction(obj){
    clients.push(obj);
}
const remove_client=()=>{
    clients.splice(clients.indexOf(socket.user), 1);
}
module.exports = {clientsFunction,remove_client,clients};
