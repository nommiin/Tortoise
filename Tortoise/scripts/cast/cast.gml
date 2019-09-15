/// @function cast( number, type )
var b = buffer_create(buffer_sizeof(argument[1]), buffer_fixed, 1);
buffer_write(b, argument[1], argument[0]);
var r = buffer_peek(b, 0, argument[1]);
buffer_delete(b);
return r;