/// @function DoPop( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Name = global.StringMap[? buffer_read(argument[1], buffer_u32)], Stack = Environment[? "Stack"];
if (ds_stack_size(Stack) > 0) {
	switch (cast(argument[2] & 0xFFFF, buffer_s16)) {
		case eScope.Local: {
			ds_map_set(Environment[? "Local"], Name, ds_stack_pop(Stack));
			break;	
		}
	}
} else Environment[? "Error"] = "Could not perform Pop operation, stack is empty";