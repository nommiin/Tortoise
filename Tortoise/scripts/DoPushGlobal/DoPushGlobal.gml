/// @function DoPushGlobal( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"], Name = global.StringMap[? buffer_read(argument[1], buffer_u32)], Value = ds_map_find_value(Environment[? "Global"], Name);
if (Name != undefined) {
	if (Value != undefined) {
		ds_stack_push(Stack, Value);	
	} else Environment[? "Error"] = "Could not perform PushGlobal operation, value for variable \"" + Name +"\" is not set";
} else Environment[? "Error"] = "Could not perform PushGlobal operation, unknown variable name was given";