enum eOpcode {
	Convert = 7,
	Multiply = 8,
	Divide = 9,
	Remainder = 10,
	Modulus = 11,
	Add = 12,
	Subtract = 13,
	And = 14,
	Or = 15,
	Xor = 16,
	Negate = 17,
	Not = 18,
	ShiftLeft = 19,
	ShiftRight = 20,
	Compare = 21,
	Pop = 69,
	PushImmediate = 132,
	Duplicate = 134,
	Return = 156,
	Exit = 157,
	PopNull = 158,
	Branch = 182,
	BranchTrue = 183,
	BranchFalse = 184,
	PushEnvironment = 186,
	PopEnvironment = 187,
	Push = 192,
	PushLocal = 193,
	PushGlobal = 194,
	PushBuiltin = 195,
	Call = 217,
	Break = 255
}

enum eScope {
	Local = -7,
	Global = -5,
	Noone = -4,
	All = -3,
	Other = -2,
	Self = -1
}

enum eCompare {
	None,
	LessThan,
	LessThanEqual,
	Equal,
	NotEqual,
	GreaterThanEqual,
	GreaterThan
}

enum eType {
	Double,
	Float,
	Integer,
	Long,
	Boolean,
	Variable,
	String,
	Instance,
	Delete,
	Undefined,
	UnsignedInteger,
	Error = 15
}