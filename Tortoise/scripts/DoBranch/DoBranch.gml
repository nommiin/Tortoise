/// @function DoBranch( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Count = cast(argument[2] & 0xFFFF, buffer_s16) - 1;
buffer_seek(argument[1], buffer_seek_relative, Count * 4);