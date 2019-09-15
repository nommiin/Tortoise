draw_text(4, 4, string(Environment[? "Output"]));
for(var i = ds_map_find_first(Environment[? "Local"]), j = 0; i != undefined; i = ds_map_find_next(Environment[? "Local"], i)) {
	draw_text(room_width / 2, (room_height / 2) + (j++ * 16), "self." + i + " = " + string(ds_map_find_value(Environment[? "Local"], i)));
}