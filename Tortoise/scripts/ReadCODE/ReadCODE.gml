/// @function ReadSTRG( buffer, chunk )
/// @argument buffer The data buffer to read
/// @argument chunk The chunk to read from
global.CodeBlocks = ds_map_create();
for(var i = 0, _i = buffer_read(argument[0], buffer_s32); i < _i; i++) {
	var CodeRead = ICode(argument[0]);
	global.CodeBlocks[? CodeRead[? "Name"]] = CodeRead;
}