local process = require("@lune/process")
local task = require("@lune/task")

if process.os == "windows" then
	process.exec("taskkill", { "/F", "/IM", "rojo.exe" })
else
	process.exec("pkill", { "-f", "rojo" })
end

task.spawn(function()
	process.exec(
		"rojo",
		{ "sourcemap", "default.project.json", "--output", "sourcemap.json", "--watch" },
		{ env = process.env, stdio = "forward" }
	)
end)

task.wait(1)

task.spawn(function()
	process.exec(
		"darklua",
		{ "process", "--config", ".darklua.json", "src/", "dist/", "--watch" },
		{ env = process.env, stdio = "forward" }
	)
end)

task.spawn(function()
	process.exec("rogen", { "watch" }, { env = process.env, stdio = "forward" })
end)

task.spawn(function()
	process.exec("rojo", { "serve", "build.project.json" }, { env = process.env, stdio = "forward" })
end)

print("\nPress Ctrl+C to close all tooling.\n")

while true do
	task.wait(1)
end
