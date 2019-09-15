/// @function DoDivide( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"];
if (ds_stack_size(Stack) > 1) {
	var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
	ds_stack_push(Stack, Left / Right);
} else Environment[? "Error"] = "Could not perform Divide operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));