/// @function IEnvironment()
var Instance = ds_map_create();
Instance[? "Stack"] = ds_stack_create();
Instance[? "Error"] = undefined;
Instance[? "Frame"] = "";
Instance[? "Pointer"] = 0;
Instance[? "Disassembly"] = "";
Instance[? "Output"] = "";
Instance[? "Jumps"] = [];
Instance[? "Local"] = ds_map_create();
Instance[? "Global"] = ds_map_create();
return Instance;