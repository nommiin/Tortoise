/// @function ReadFUNC( buffer, chunk )
/// @argument buffer The data buffer to read
/// @argument chunk The chunk to read from
for(var i = 0, _i = buffer_read(argument[0], buffer_s32); i < _i; i++) {
	var FunctionName = buffer_read(argument[0], buffer_s32), FunctionOffsets = [], FunctionBase = 0;
	for(var j = 0, _j = buffer_read(argument[0], buffer_s32); j < _j; j++) {
		if (j == 0) FunctionBase = buffer_read(argument[0], buffer_s32);
		else FunctionBase += buffer_peek(argument[0], FunctionBase + 4, buffer_u32);
		FunctionOffsets[array_length_1d(FunctionOffsets)] = FunctionBase + 4;
	}
	for(var j = 0, _j = array_length_1d(FunctionOffsets); j < _j; j++) buffer_poke(argument[0], FunctionOffsets[j], buffer_u32, FunctionName);	
}