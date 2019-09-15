/// @function ReadFUNC( buffer, chunk )
/// @argument buffer The data buffer to read
/// @argument chunk The chunk to read from
var ChunkRead = argument[1];
buffer_seek(argument[0], buffer_seek_relative, 12);
while (buffer_tell(argument[0]) < (ChunkRead[? "Base"] + ChunkRead[? "Length"]) - 8) {
	var VariableName = buffer_read(argument[0], buffer_s32);
	buffer_seek(argument[0], buffer_seek_relative, 8);
	var VariableCount = buffer_read(argument[0], buffer_s32), VariableOffsets = [], VariableBase = buffer_read(argument[0], buffer_s32);
	var VariableReturn = buffer_tell(argument[0]);
	if (VariableCount == 0) return;
	for(var i = 0; i < VariableCount; i++) {
		if (i > 0) VariableBase += (buffer_peek(argument[0], VariableBase + 4, buffer_s32) & 0xFFFFFFF);
		VariableOffsets[array_length_1d(VariableOffsets)] = VariableBase + 4;
		buffer_seek(argument[0], buffer_seek_relative, 4);
	}
	for(var i = 0; i < array_length_1d(VariableOffsets); i++) buffer_poke(argument[0], VariableOffsets[i], buffer_s32, VariableName);
	buffer_seek(argument[0], buffer_seek_start, VariableReturn);
}