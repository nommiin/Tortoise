/// @function DoBranchTrue( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"];
if (ds_stack_size(Stack) > 0) {
	if (ds_stack_pop(Stack) == true) DoBranch(Environment, argument[1], argument[2]);
} else Environment[? "Error"] = "Could not perform BranchTrue operation, stack is empty";