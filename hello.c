
#include "lauxlib.h"

#define LEN(array) (sizeof(array) / sizeof(array[0]))

typedef struct {
	char *data;
	size_t size;
} String;

void nvim_err_writeln(String str);

#define MESSAGE "Hello World!"

int say_hello(lua_State *L) {
	String msg = { .data =  MESSAGE, .size =  LEN(MESSAGE) - 1 };

	nvim_err_writeln(msg);

	lua_pushstring(L, msg.data); // return
	return 1;
}

int luaopen_hello(lua_State *L) {
	static const struct luaL_Reg M[] = {
		{ "say_hello", say_hello },
		{ NULL, NULL },
	};
	luaL_register(L, "hello", M);
	return 1;
}
