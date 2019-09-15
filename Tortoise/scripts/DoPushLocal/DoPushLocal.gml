/// @function DoPushImmediate( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"], Name = global.StringMap[? buffer_read(argument[1], buffer_u32)], Value = ds_map_find_value(Environment[? "Local"], Name);
if (Name != undefined) {
	// Environment[? "Disassembly"] += "(self." + Name + ")";
	if (Value != undefined) {
		// Environment[? "Disassembly"] += " => " + string(Value);
		ds_stack_push(Stack, Value);	
	}
}