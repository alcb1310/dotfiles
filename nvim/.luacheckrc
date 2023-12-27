---@diagnostic disable: lowercase-global

ignore = {
	"111", -- setting non-standard global variable
	"212/_.*", -- unused arguments, for vars with "_" prefix
	"214", -- used variable with unused hint ("_" prefix)
	"121", -- setting read-only global variable 'vim'
	"122", -- setting read-only field of global variable 'vim'
}

-- Global objects defined by the C code (or libraries)
read_globals = {
	"vim",
}
