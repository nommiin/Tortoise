/// @function DoPopNull( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"];
if (ds_stack_size(Stack) > 0) {
	ds_stack_pop(Stack);
} else Environment[? "Error"] = "Could not perform PopNull operation, stack is empty";