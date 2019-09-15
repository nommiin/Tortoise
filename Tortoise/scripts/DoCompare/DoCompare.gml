/// @function DoCompare( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Instruction = argument[2], Stack = Environment[? "Stack"];
if (ds_stack_size(Stack) > 1) {
	var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
	switch ((Instruction >> 8) & 0xFF) {
		case eCompare.Equal: {
			ds_stack_push(Stack, Left == Right);
			break;
		}
				
		case eCompare.NotEqual: {
			ds_stack_push(Stack, Left != Right);
			break;
		}
				
		case eCompare.LessThan: {
			ds_stack_push(Stack, Left < Right);
			break;
		}
				
		case eCompare.LessThanEqual: {
			ds_stack_push(Stack, Left <= Right);
			break;
		}
				
		case eCompare.GreaterThan: {
			ds_stack_push(Stack, Left > Right);
			break;
		}
				
		case eCompare.GreaterThanEqual: {
			ds_stack_push(Stack, Left >= Right);
			break;
		}
	}
} else Environment[? "Error"] = "Could not perform Compare operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));