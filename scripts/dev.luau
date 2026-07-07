local process = require("@lune/process")
local task = require("@lune/task")

if process.os == "windows" then
	process.exec("taskkill", { "/F", "/IM", "rojo.exe" })
else
	process.exec("pkill", { "-f", "rojo" })
end

task.spawn(function()
	local sourcemap = process.exec(
		"rojo",
		{ "sourcemap", "dev.project.json", "--output", "sourcemap.json", "--watch" },
		{ env = process.env, stdio = "forward" }
	)
end)

task.wait(1)

task.spawn(function()
	local rojoServe = process.exec("rojo", { "serve", "dev.project.json" }, { env = process.env, stdio = "forward" })
end)

print("\nPress Ctrl+C to close all tooling.\n")

while true do
	task.wait(1)
end
