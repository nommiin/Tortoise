/// @function ReadSCPT( buffer, chunk )
/// @argument buffer The data buffer to read
/// @argument chunk The chunk to read from
global.ScriptMap = ds_map_create();
for(var i = 0, _i = buffer_read(argument[0], buffer_s32); i < _i; i++) {
	var Base = buffer_tell(argument[0]) + 4;
	buffer_seek(argument[0], buffer_seek_start, buffer_read(argument[0], buffer_s32));
	var Name = global.StringMap[? buffer_read(argument[0], buffer_s32)];
	global.ScriptMap[? Name] = global.CodeList[| buffer_read(argument[0], buffer_s32)];
	buffer_seek(argument[0], buffer_seek_start, Base);
}