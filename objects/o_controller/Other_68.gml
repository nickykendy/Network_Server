/// networking
var eventType = ds_map_find_value(async_load, "type");
switch(eventType) {
	case network_type_connect:
		var socket = ds_map_find_value(async_load, "socket");
		ds_list_add(sockets, socket);
		//show message
		with (o_message) instance_destroy();
		var note = instance_create_depth(0, 0, "Ins_mge", o_message);
		note.message = "A new player has connected!";
	break;
	
	case network_type_disconnect:
		var socket = ds_map_find_value(async_load, "socket");
		var findSocket = ds_list_find_index(sockets, socket);
		if (findSocket >= 0) ds_list_delete(sockets, findSocket);
		//show message
		with (o_message) instance_destroy();
		var note = instance_create_depth(0, 0, "Ins_mge", o_message);
		note.message = "A player has left!";
	break;
	
	case network_type_data:
		var buffer = ds_map_find_value(async_load, "buffer");
		var socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0);
		scr_handleIncomingPackets(buffer, socket);
	break;
}