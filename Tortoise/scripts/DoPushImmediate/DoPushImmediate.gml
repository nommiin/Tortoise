/// @function DoPushImmediate( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"];
switch ((argument[2] >> 16) & 0xF) {
	case eType.Error: {
		// Environment[? "Disassembly"] += "(" + string(argument[2] & 0xFFFF) + ")";
		ds_stack_push(Stack, argument[2] & 0xFFFF);
		break;	
	}
}