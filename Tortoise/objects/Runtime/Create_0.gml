var Data = buffer_load("D:\\Tortoise\\Tortoise-Research\\builds\\data.win");

#region Read IFF
var Header = IChunk(Data), Valid = true;
if (Header[? "Name"] == "FORM") {
	var Chunks = ds_map_create();
	while (buffer_tell(Data) < Header[? "Base"] + Header[? "Length"]) {
		var ChunkRead = IChunk(Data);
		Chunks[? ChunkRead[? "Name"]] = ChunkRead;
		buffer_seek(Data, buffer_seek_start, ChunkRead[? "Base"] + ChunkRead[? "Length"]);
	}
} else Valid = false;
#endregion

#region Read Chunks
if (Valid == true) {
	var ChunkOrder = ["STRG", "GEN8", "FUNC", "VARI", "CODE", "SCPT"];
	for(var i = 0; i < array_length_1d(ChunkOrder); i++) {
		var ChunkRead = Chunks[? ChunkOrder[i]];
		if (ChunkRead != undefined) {
			var Reader = asset_get_index("Read" + ChunkOrder[i]);
			if (Reader > -1) {
				show_debug_message("Reading Chunk: " + ChunkOrder[i]);
				buffer_seek(Data, buffer_seek_start, ChunkRead[? "Base"]);
				script_execute(Reader, Data, ChunkRead);
			} else show_debug_message("Could not read chunk, " + ChunkOrder[i] + ": Missing script");
		} else show_debug_message("Could not read chunk, " + ChunkOrder[i] + ": Missing chunk");
	}
}
#endregion

#region Runtime Logic
if (Valid == true) {
	Environment = IEnvironment();
	ExecuteBytecode(Environment, global.CodeBlocks[? "gml_Script_script_main"]);
}
#endregion