/// @function HandleError( environment )
/// @argument environment
var Environment = argument[0];
if (Environment[? "Error"] != undefined) {
	var Stack = ds_stack_create(), StackDump = ""; ds_stack_copy(Stack, Environment[? "Stack"]);
	while (ds_stack_size(Stack) > 0) {
		StackDump += string(ds_stack_pop(Stack));	
		if (ds_stack_size(Stack) > 0) StackDump += ", ";
	}
	ds_stack_destroy(Stack);
	return show_question("An error has occured:\n" + string(Environment[? "Error"]) + "\nStack: [" + StackDump + "]\n\nContinue execution?");
}