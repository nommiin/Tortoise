/// @function ReadSTRG( buffer, chunk )
/// @argument buffer The data buffer to read
/// @argument chunk The chunk to read from
global.StringMap = ds_map_create();
global.StringList = ds_list_create();
for(var i = 0, _i = buffer_read(argument[0], buffer_s32); i < _i; i++) {
	var StringRead = IString(argument[0]);
	show_debug_message("String: " + string(json_encode(StringRead)));
	global.StringMap[? StringRead[? "Offset"] + 4] = StringRead[? "Value"];
	global.StringList[| i] = StringRead[? "Value"];
}