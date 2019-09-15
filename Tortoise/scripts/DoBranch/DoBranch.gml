/// @function DoBranch( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
// _d << 8 >> 6;
var Environment = argument[0], Count = argument[2] & 0xFFFFFF;//((argument[2] & 0xFFFFFF) - 1)
var r = Count & 0x003FFFFF;
if ((Count & 0x00C00000) != 0) r |= 0xFFC00000;
Count = cast(r, buffer_s32) - 1;
buffer_seek(argument[1], buffer_seek_relative, Count * 4);