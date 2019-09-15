# Miscellaneous Notes/TODO
- (the following notes/suggestions were given courtesy of YellowAfterlife)
- ~~Change from a switch statement to a lookup table for operation scripts~~
- ~~Just use least significant 16-bits of Branch instruction as the jump count~~
- Move away from reading the bytecode buffer and instead read the data into an array or grid

# Information
- The GMDebug (old non-IDE debugger) that ships with current-day GMS 2 runtimes is unobfuscated, and it contains the entire VM compiler along with instruction, type, and token enums. Seems to compile for the newest bytecode version.
- eVM_Instruction.eVMI_BRANCH encodes the amount as an "Int24", as seen below (from GMDebug.exe)
```csharp
public static int EncodeInstructionBranch(int _instr, int _offset) {
  return _instr << 24 | (_offset >> 2 & 16777215);
}
```
- For, repeat, and while loops all use the BRANCH instruction to "goto" the start of the loop
