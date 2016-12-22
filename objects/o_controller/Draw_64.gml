/// GUI
draw_set_color(c_white);
draw_text(5, 5, "Server status: " + string(server >= 0));
draw_text(5, 20, "Total clents: " + string(ds_list_size(sockets)));