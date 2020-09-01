source_file = "glfw_binding_source.cpp"

function prepend_to_cpp()
	return [[
#include <memory>
#include "../glfw_binding_source.cpp"
]]
end

function prepend_to_cheez()
	return [[
#lib("./lib/glfw3dll.lib")
#lib("./lib/glfw_binding.lib")

#export_scope

GLFWwindow :: struct {}
GLFWmonitor :: struct {}
GLFWcursor :: struct {}
uint32_t :: u32
uint64_t :: u64
]]
end

function on_global_variable(decl, name, type)
	return true, nil
end

function on_typedef(decl, name, type)
	index = name:find("GLFW")
	if (index == nil)
	then
		-- doesn't start with GLFW*, so don't emit anything
		return true, nil
	else
		-- starts with GLFW*, so emit default
		return false, nil
	end
end

special_macros = {
	GLFW_HAT_RIGHT_UP   = "@bin_or(GLFW_HAT_RIGHT, GLFW_HAT_UP)",
	GLFW_HAT_RIGHT_DOWN = "@bin_or(GLFW_HAT_RIGHT, GLFW_HAT_DOWN)",
	GLFW_HAT_LEFT_UP    = "@bin_or(GLFW_HAT_LEFT, GLFW_HAT_UP)",
	GLFW_HAT_LEFT_DOWN  = "@bin_or(GLFW_HAT_LEFT, GLFW_HAT_DOWN)"
}

function on_macro(decl, name)
	index = name:find("GLFW_")
	if (index == nil) then
		-- doesn't start with GLFW_*, so don't emit anything
		return true, nil
	end

	if special_macros[name] then
		return true, (name .. " :: " .. special_macros[name])
	end

	-- starts with GLFW_*, so emit default
	return false, nil
end

function on_function(decl, name)
	index = name:find("glfw")
	if (index == nil)
	then
		-- doesn't start with glfw*, so don't emit anything
		return true, nil
	else
		-- starts with glfw*, so emit default
		return false, nil
	end
end

function on_struct(decl, name)
	index = name:find("GLFW")
	if (index == nil)
	then
		-- doesn't start with GLFW*, so don't emit anything
		return true, nil
	else
		-- starts with GLFW*, so emit default
		return false, nil
	end
end