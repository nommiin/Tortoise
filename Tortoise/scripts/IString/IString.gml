/// @function IString( buffer )
/// @argument buffer The buffer to read from
/// @returns {ds_map} An instance of the String class
var Instance = ds_map_create();
Instance[? "Offset"] = buffer_read(argument[0], buffer_s32);
Instance[? "Base"] = buffer_tell(argument[0]);
buffer_seek(argument[0], buffer_seek_start, Instance[? "Offset"]);
Instance[? "Value"] = "";
for(var i = 0, _i = buffer_read(argument[0], buffer_s32); i < _i + 1; i++) {
	Instance[? "Value"] += chr(buffer_read(argument[0], buffer_u8));
}
buffer_seek(argument[0], buffer_seek_start, Instance[? "Base"]);
return Instance;