///initialize
var networkType = network_socket_tcp;
var port = 50000;
var maxPlayers = 32;
var bufferSize = 1024;
var bufferType = buffer_fixed;
var bufferAlignment = 1;

//create the server
server = network_create_server(networkType, port, maxPlayers);
global.buffer = buffer_create(bufferSize, bufferType, bufferAlignment);
sockets = ds_list_create();

//show message
with (o_message) instance_destroy();
var note = instance_create_depth(0, 0, "Ins_msg", o_message);
note.message = "Server is up!";