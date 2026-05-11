-- OpenResty entry point: installs Fennel's require hook so .fnl files load directly
require("fennel").install()
require("lapis").serve("app")
