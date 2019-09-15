/// @function ExecuteInstruction( environment, bytecode, mapping, instruction )
/// @argument environment
/// @argument bytecode
/// @argument instruction
var Environment = argument[0], Bytecode = argument[1], Mapping = argument[2], Instruction = argument[3], Opcode = (Instruction >> 24) & 0xFF, Method = Mapping[Opcode];
if (Method != undefined) {
	if (Method > -1) {
		script_execute(Method, Environment, Bytecode, Instruction);
	}
} else Environment[? "Error"] = "Could not perform unknown operation " + string_tohex(Opcode) + " (Instruction: " + string_tohex(Instruction, 8) + ") at " + string(Environment[? "Pointer"]);