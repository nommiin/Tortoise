/// @function IChunk( buffer )
/// @argument buffer The buffer to read from
/// @returns {ds_map} An instance of the Code
var Instance = ds_map_create();
Instance[? "Offset"] = buffer_read(argument[0], buffer_s32);
Instance[? "Base"] = buffer_tell(argument[0]);
buffer_seek(argument[0], buffer_seek_start, Instance[? "Offset"]);
Instance[? "Name"] = global.StringMap[? buffer_read(argument[0], buffer_s32)];
Instance[? "Length"] = buffer_read(argument[0], buffer_s32);
Instance[? "Locals"] = buffer_read(argument[0], buffer_s16);
Instance[? "Arguments"] = buffer_read(argument[0], buffer_s16);
Instance[? "Position"] = buffer_read(argument[0], buffer_s32);
Instance[? "Bytecode"] = buffer_create(Instance[? "Length"], buffer_fixed, 1);
buffer_copy(argument[0], (buffer_tell(argument[0]) - 4) + Instance[? "Position"], Instance[? "Length"], Instance[? "Bytecode"], 0);
buffer_seek(argument[0], buffer_seek_start, Instance[? "Base"]);
return Instance;