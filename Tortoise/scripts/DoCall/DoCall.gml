/// @function DoCall( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Instruction = argument[2], Stack = Environment[? "Stack"], Name = global.StringMap[? buffer_read(argument[1], buffer_u32)], Arguments = [];
if (Name != undefined) {
	for(var i = 0, _i = (Instruction & 0xFF); i < _i; i++) {
		Arguments[array_length_1d(Arguments)] = ds_stack_pop(Stack);
	}
	ds_stack_push(Stack, function_execute_array(Name, Arguments));
} else Environment[? "Error"] = "Could not perform Call, unknown function name was given";