/// destroy
network_destroy(server);
buffer_delete(global.buffer);
ds_list_destroy(sockets);