/// @function ExecuteInstruction( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Bytecode = argument[1], Instruction = argument[2], Opcode = (Instruction >> 24) & 0xFF, Stack = Environment[? "Stack"];
switch (Opcode) {
	case eOpcode.Add: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left + Right);
		} else Environment[? "Error"] = "Could not perform Add operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Subtract: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left - Right);
		} else Environment[? "Error"] = "Could not perform Subtract operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Multiply: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left * Right);
		} else Environment[? "Error"] = "Could not perform Multiply operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Divide: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left / Right);
		} else Environment[? "Error"] = "Could not perform Divide operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Modulus: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left % Right);
		} else Environment[? "Error"] = "Could not perform Modulus operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Remainder: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left div Right);
		} else Environment[? "Error"] = "Could not perform Remainder operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.And: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left & Right);
		} else Environment[? "Error"] = "Could not perform And operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Or: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left | Right);
		} else Environment[? "Error"] = "Could not perform Or operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Xor: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left ^ Right);
		} else Environment[? "Error"] = "Could not perform Xor operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.ShiftLeft: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left << Right);
		} else Environment[? "Error"] = "Could not perform ShiftRight operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.ShiftRight: {
		if (ds_stack_size(Stack) > 1) {
			var Right = ds_stack_pop(Stack), Left = ds_stack_pop(Stack);
			ds_stack_push(Stack, Left >> Right);
		} else Environment[? "Error"] = "Could not perform ShiftRight operation, expected 2 values when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.Negate: {
		if (ds_stack_size(Stack) > 0) {
			var Stack = Environment[? "Stack"]; ds_stack_push(Stack, -ds_stack_pop(Stack));
		} else Environment[? "Error"] = "Could not perform Negate operation, stack is empty";
		break;
	}
	
	case eOpcode.Not: {
		if (ds_stack_size(Stack) > 0) {
			var Stack = Environment[? "Stack"]; ds_stack_push(Stack, ~ds_stack_pop(Stack));
		} else Environment[? "Error"] = "Could perform Not operation, stack is empty";
		break;
	}
	
	case eOpcode.Compare: {
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
		break;
	}
	
	case eOpcode.Duplicate: {
		if (ds_stack_size(Stack) > 0) {
			var Stack = Environment[? "Stack"]; ds_stack_push(Stack, ds_stack_top(Stack));
		} else Environment[? "Error"] = "Could not perform Duplicate operation, stack is empty";
		break;
	}
	
	case eOpcode.PopNull: {
		if (ds_stack_size(Stack) > 0) {
			ds_stack_pop(Stack);
		} else Environment[? "Error"] = "Could not perform PopNull operation, stack is empty";
		break;
	}
	
	case eOpcode.Branch: {
		DoBranch(Environment, Bytecode, Instruction);
		break;
	}
	
	case eOpcode.BranchTrue: {
		if (ds_stack_size(Stack) > 0) {
			if (ds_stack_pop(Stack) == true) DoBranch(Environment, Bytecode, Instruction);
		} else Environment[? "Error"] = "Could not perform BranchTrue operation, stack is empty";
		break;
	}
	
	case eOpcode.BranchFalse: {
		if (ds_stack_size(Stack) > 0) {
			if (ds_stack_pop(Stack) == false) DoBranch(Environment, Bytecode, Instruction); break;
		} else Environment[? "Error"] = "Could not perform BranchFalse operation, stack is empty";
		break;
	}
	
	case eOpcode.Call: {
		if (ds_stack_size(Stack) >= Instruction & 0xFF) {
			DoCall(Environment, Bytecode, Instruction);
		} else Environment[? "Error"] = "Could not perform Call operation, expected " + string(Instruction & 0xFF) + " arguments when stack only has " + string(ds_stack_size(Stack));
		break;
	}
	
	case eOpcode.PushImmediate: {
		DoPushImmediate(Environment, Bytecode, Instruction);
		break;	
	}
	
	case eOpcode.Pop: {
		if (ds_stack_size(Stack) > 0) {
			DoPop(Environment, Bytecode, Instruction);
		} else Environment[? "Error"] = "Could not perform Pop operation, stack is empty";
		break;	
	}
	
	case eOpcode.PushLocal: {
		DoPushLocal(Environment, Bytecode, Instruction);
		break;	
	}
	
	case eOpcode.Push: {
		DoPush(Environment, Bytecode, Instruction);
		break;	
	}
	
	case eOpcode.Convert: break;
	default: Environment[? "Error"] = "Unknown Opcode: " + string_tohex(Opcode) + " (Instruction: " + string_tohex(Instruction, 8) + ") at " + string(Environment[? "Pointer"]);
}