/// @function DoPushImmediate( environment, bytecode, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Stack = Environment[? "Stack"];
switch ((argument[2] >> 16) & 0xF) {
	case eType.Variable: {
		switch (cast(argument[2] & 0xFFFF, buffer_s16)) {
			case eScope.Local: {
				ds_stack_push(Stack, ds_map_find_value(Environment[? "Local"], global.StringMap[? buffer_read(argument[1], buffer_u32)]));
				break;	
			}
		}
		break;	
	}
	
	case eType.String: {
		ds_stack_push(Stack, global.StringList[| buffer_read(argument[1], buffer_u32)]);
		break;	
	}
	
	case eType.Error: {
		ds_stack_push(Stack, argument[2] & 0xFFFF);
		break;	
	}
	
	default: Environment[? "Error"] = "Unknown Type: " + string((argument[2] >> 16) & 0xF);
}