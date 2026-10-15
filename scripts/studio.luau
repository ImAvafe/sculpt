local process = require("@lune/process")

process.exec("rodeo", { "run", "--place", "testPlace.rbxl", "--detach" }, { env = process.env, stdio = "forward" })
