/// @function IChunk( buffer )
/// @argument buffer The buffer to read from
/// @returns {ds_map} An instance of the Chunk class
var Instance = ds_map_create();
Instance[? "Name"] = "";
for(var i = 0; i < 4; i++) {
	Instance[? "Name"] += chr(buffer_read(argument[0], buffer_u8));	
}
Instance[? "Length"] = buffer_read(argument[0], buffer_s32);
Instance[? "Base"] = buffer_tell(argument[0]);
return Instance;