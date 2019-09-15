/// @function string_tohex( number, [padding=0] )
/// @argument number The number to convert to hex
/// @argument [padding=0] The amount of zeros to pad the number with
var _hexValue = argument[0], _hexString = (_hexValue == 0 ? "00" : ""), _hexKey = "0123456789ABCDEF";
while (_hexValue > 0) {
	_hexString = _hexString + string_char_at(_hexKey, ((_hexValue >> 4) & 0xF) + 1) + string_char_at(_hexKey, (_hexValue & 0xF) + 1);
	_hexValue = _hexValue >> 8;
}
return "0x" + (argument_count > 1 ? string_repeat("0", argument[1] - string_length(_hexString)) + _hexString : _hexString);