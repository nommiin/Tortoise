/// @function DoCall( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Instruction = argument[2], Stack = Environment[? "Stack"], Name = global.StringMap[? buffer_read(argument[1], buffer_u32)], Arguments = [];
if (ds_stack_size(Stack) >= Instruction & 0xFF) {
	if (Name != undefined) {
		for(var i = 0, _i = (Instruction & 0xFF); i < _i; i++) {
			Arguments[array_length_1d(Arguments)] = ds_stack_pop(Stack);
		}
		
		var Script = global.ScriptMap[? Name];
		if (Script != undefined) {
			show_debug_message("Executing script..." + string(Name));
			ds_stack_push(Stack, ExecuteBytecode(Environment, Script));
		} else {
			show_debug_message("Executing function..." + string(Name));
			ds_stack_push(Stack, function_execute_array(Name, Arguments));
		}
	} else Environment[? "Error"] = "Could not perform Call operation, unknown function name was given";
} else Environment[? "Error"] = "Could not perform Call operation, expected " + string(Instruction & 0xFF) + " arguments when stack only has " + string(ds_stack_size(Stack));