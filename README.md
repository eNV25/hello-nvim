
# hello Lua!

This is a simple hello-world C module for neovim.

```
$ make
$ cp hello.so ~/.config/nvim/lua/
$ nvim
: lua =require("hello").say_hello()
```

