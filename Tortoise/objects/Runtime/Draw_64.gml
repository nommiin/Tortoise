draw_text(4, 2, "Locals: (" + string(ds_map_size(Environment[? "Local"])) + ")");
for(var i = ds_map_find_first(Environment[? "Local"]), j = 0; i != undefined; i = ds_map_find_next(Environment[? "Local"], i)) {
	draw_text(4, (4 + 18) + (j++ * 16), "self." + i + " = " + string(ds_map_find_value(Environment[? "Local"], i)));
}

draw_text(room_width / 2, 2, "Globals: (" + string(ds_map_size(Environment[? "Global"])) + ")")
for(var i = ds_map_find_first(Environment[? "Global"]), j = 0; i != undefined; i = ds_map_find_next(Environment[? "Global"], i)) {
	draw_text(room_width / 2, (4 + 18) + (j++ * 16), "global." + i + " = " + string(ds_map_find_value(Environment[? "Global"], i)));
}