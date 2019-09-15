/// @function string_tobin( number )
/// @argument number
var _binValue = argument[0], _binString = (_binValue == 0 ? "0" : "");
while (_binValue > 0) {
	_binString = string(_binValue & 1) + _binString;
	_binValue = _binValue >> 1;
}
return string_repeat("0", (argument_count > 1 ? argument[1] : 8) - string_length(_binString)) + _binString;