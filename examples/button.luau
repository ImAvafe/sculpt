local tilly = require("@game/ReplicatedStorage/Sculpt/Tilly")

const sheet = Instance.new("StyleSheet")
const tag, _destroy = tilly(sheet)

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("Players"):WaitForChild("ImAvafe"):FindFirstChild("PlayerGui")

local link = Instance.new("StyleLink")
link.Parent = gui
link.StyleSheet = sheet

sheet.Parent = link

local button = Instance.new("TextButton")

tag(button, "bg-blue-400 text-base p-2 rounded-base")

button.AutomaticSize = Enum.AutomaticSize.XY
button.Parent = gui

-- destroy()

return nil
