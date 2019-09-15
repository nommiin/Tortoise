/// @function ExecuteBytecode( environment, code )
/// @argument environment
/// @argument code
var Environment = argument[0], Code = argument[1], Bytecode = Code[? "Bytecode"];
buffer_seek(Bytecode, buffer_seek_start, 0);
while (buffer_tell(Bytecode) < buffer_get_size(Bytecode)) {
	ExecuteInstruction(Environment, Bytecode, buffer_read(Bytecode, buffer_u32));
	if (Environment[? "Error"] != undefined) {
		if (HandleError(Environment) == false) break;
		else Environment[? "Error"] = undefined;
	}
}