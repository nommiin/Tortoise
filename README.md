# Tortoise
A GameMaker bytecode interpreter written in GameMaker Language

## Status
Can run basic logic, loops, if statements, etc. Local and global variables are supported. Arrays are currently not working. You cannot call scripts yet either.  It **does not** load rooms or objects. `CODE` blocks are invoked directly using `ExecuteBytecode` at the moment, for testing. See [`Tortoise/objects/Runtime/Create_0.gml`](https://github.com/nommiin/Tortoise/blob/master/Tortoise/objects/Runtime/Create_0.gml) to get started

## Why?
Mostly for research purposes, I also wanted to write my first interpreter in a language I was comfortable in (which just so happened to by GML). Ideally I'll use this project to write another interpreter in a high performance language like Rust, C++, or Haxe 

## Goals
Run a game in it, probably...?

## References
https://pcy.ulyssis.be/undertale/unpacking-corrected

https://github.com/krzys-h/UndertaleModTool

https://github.com/donkeybonks/acolyte/wiki/Bytecode

https://github.com/GameMakerDiscord/function-execute

**GMAssetCompiler.exe**, **GMDebug.exe**
